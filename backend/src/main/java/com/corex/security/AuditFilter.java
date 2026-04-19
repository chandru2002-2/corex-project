package com.corex.security;

import com.corex.entity.AuditLog;
import com.corex.repository.AuditLogRepository;
import com.corex.util.JwtUtil;

import jakarta.servlet.FilterChain;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import lombok.RequiredArgsConstructor;

import org.springframework.stereotype.Component;
import org.springframework.web.filter.OncePerRequestFilter;

import java.io.IOException;
import java.time.LocalDateTime;

@Component
@RequiredArgsConstructor
public class AuditFilter extends OncePerRequestFilter {

    private final AuditLogRepository auditRepo;
    private final JwtUtil jwtUtil;

    @Override
    protected void doFilterInternal(HttpServletRequest request,
                                    HttpServletResponse response,
                                    FilterChain filterChain)
            throws ServletException, IOException {

        Long userId = null;

        String authHeader = request.getHeader("Authorization");

        try {
            if (authHeader != null && authHeader.startsWith("Bearer ")) {
                String jwt = authHeader.substring(7);

                // ✅ SAFE extraction
                if (jwtUtil.validateAccessToken(jwt)) {
                    userId = jwtUtil.extractUserId(jwt);
                }
            }
        } catch (Exception ignored) {}

        // ⏱️ Continue request
        filterChain.doFilter(request, response);

        // 🌐 Fix IP (localhost case)
        String ip = request.getRemoteAddr();
        if ("0:0:0:0:0:0:0:1".equals(ip)) {
            ip = "127.0.0.1";
        }

        // 📊 Status type
        String statusType = (response.getStatus() >= 200 && response.getStatus() < 300)
                ? "SUCCESS" : "ERROR";

        // 🧾 Save audit log
        AuditLog log = AuditLog.builder()
                .userId(userId)
                .endpoint(request.getRequestURI())
                .method(request.getMethod())
                .status(response.getStatus())
                .ipAddress(ip)
                .statusType(statusType) // ✅ optional (if field exists)
                .timestamp(LocalDateTime.now())
                .build();

        auditRepo.save(log);
    }
}