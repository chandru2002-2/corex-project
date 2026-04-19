package com.corex.security;

import com.corex.entity.Session;
import com.corex.repository.SessionRepository;
import com.corex.util.JwtUtil;

import jakarta.servlet.FilterChain;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import lombok.RequiredArgsConstructor;

import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.stereotype.Component;
import org.springframework.web.filter.OncePerRequestFilter;

import java.io.IOException;
import java.time.LocalDateTime;
import java.util.Collections;
import java.util.Optional;

@Component
@RequiredArgsConstructor
public class JwtFilter extends OncePerRequestFilter {

    private final JwtUtil jwtUtil;
    private final SessionRepository sessionRepo;

    @Override
    protected void doFilterInternal(HttpServletRequest request,
                                    HttpServletResponse response,
                                    FilterChain filterChain)
            throws ServletException, IOException {

        String path = request.getServletPath();

        // ✅ Skip public APIs
        if (path.startsWith("/auth") ||
            path.startsWith("/swagger") ||
            path.startsWith("/v3/api-docs") ||
            path.equals("/")) {

            filterChain.doFilter(request, response);
            return;
        }

        String authHeader = request.getHeader("Authorization");

        // ✅ No token → just continue (Spring will return 401 if needed)
        if (authHeader == null || !authHeader.startsWith("Bearer ")) {
            filterChain.doFilter(request, response);
            return;
        }

        String token = authHeader.substring(7);

        try {
            // 🔍 Extract details
            String email = jwtUtil.extractEmail(token);
            String role = jwtUtil.extractRole(token);
            String type = jwtUtil.extractTokenType(token);
            
            System.out.println("🔥 ROLE FROM TOKEN: " + role);

            // ❌ Ignore non-access tokens
            if (!"ACCESS".equals(type)) {
                filterChain.doFilter(request, response);
                return;
            }

            // ❌ Invalid token → continue (Spring handles rejection)
            if (!jwtUtil.validateToken(token)) {
                filterChain.doFilter(request, response);
                return;
            }

            Optional<Session> sessionOpt = sessionRepo.findByToken(token);

            // ❌ No session → continue
            if (sessionOpt.isEmpty()) {
                filterChain.doFilter(request, response);
                return;
            }

            Session session = sessionOpt.get();

            // ❌ Inactive or expired → continue (Spring will reject)
            if (!session.isActive() ||
                (session.getExpiryTime() != null &&
                 session.getExpiryTime().isBefore(LocalDateTime.now()))) {

                filterChain.doFilter(request, response);
                return;
            }

            // ✅ Update last used
            session.setLastUsedAt(LocalDateTime.now());
            sessionRepo.save(session);

            // ✅ Set authentication
            if (SecurityContextHolder.getContext().getAuthentication() == null) {

                String authority = role.startsWith("ROLE_")
                        ? role
                        : "ROLE_" + role;

                UsernamePasswordAuthenticationToken auth =
                        new UsernamePasswordAuthenticationToken(
                                email,
                                null,
                                Collections.singletonList(
                                        new SimpleGrantedAuthority(authority)
                                )
                        );

                SecurityContextHolder.getContext().setAuthentication(auth);
            }

        } catch (Exception e) {
            // ❌ Do NOT block — let Spring handle
        }

        filterChain.doFilter(request, response);
    }
}