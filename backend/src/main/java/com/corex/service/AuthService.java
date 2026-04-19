package com.corex.service;

import com.corex.entity.User;
import com.corex.entity.Role;
import com.corex.entity.Session;
import com.corex.repository.UserRepository;
import com.corex.repository.SessionRepository;
import com.corex.util.JwtUtil;

import lombok.RequiredArgsConstructor;

import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;
import java.time.Duration;
import java.util.HashMap;
import java.util.Map;
import java.util.Optional;

import org.springframework.http.HttpStatus;
import org.springframework.web.server.ResponseStatusException;

@Service
@RequiredArgsConstructor
public class AuthService {

    private final UserRepository userRepo;
    private final SessionRepository sessionRepo;
    private final JwtUtil jwtUtil;
    private final PasswordEncoder passwordEncoder;

    // 🔐 LOGIN
    public Map<String, String> login(String email, String password, String device, String ip) {

        User user = userRepo.findByEmail(email)
                .orElseThrow(() -> new ResponseStatusException(
                        HttpStatus.UNAUTHORIZED, "Invalid credentials"));

        if (!user.isEnabled()) {
            throw new ResponseStatusException(
                    HttpStatus.FORBIDDEN, "Account is disabled");
        }

        // 🔓 AUTO UNLOCK
        if (!user.isAccountNonLocked()) {

            if (user.getLockTime() != null) {

                LocalDateTime unlockTime = user.getLockTime().plusMinutes(10);

                if (unlockTime.isBefore(LocalDateTime.now())) {
                    user.setAccountNonLocked(true);
                    user.setFailedAttempts(0);
                    user.setLockTime(null);
                    userRepo.save(user);

                } else {
                    Duration remaining = Duration.between(LocalDateTime.now(), unlockTime);

                    long minutes = Math.max(0, remaining.toMinutes());
                    long seconds = Math.max(0, remaining.minusMinutes(minutes).getSeconds());

                    throw new ResponseStatusException(
                            HttpStatus.LOCKED,
                            "Account locked. Try again in " + minutes + "m " + seconds + "s"
                    );
                }

            } else {
                user.setAccountNonLocked(true);
                user.setFailedAttempts(0);
                userRepo.save(user);
            }
        }

        int attempts = user.getFailedAttempts();

        // 🔐 PASSWORD CHECK
        if (!passwordEncoder.matches(password, user.getPassword())) {

            attempts++;
            user.setFailedAttempts(attempts);

            if (attempts >= 5) {
                user.setAccountNonLocked(false);
                user.setLockTime(LocalDateTime.now());
            }

            userRepo.save(user);

            int remainingAttempts = Math.max(0, 5 - attempts);

            throw new ResponseStatusException(
                    HttpStatus.UNAUTHORIZED,
                    "Invalid credentials. Attempts left: " + remainingAttempts
            );
        }

        // ✅ SUCCESS LOGIN
        user.setFailedAttempts(0);
        user.setLastLogin(LocalDateTime.now());
        userRepo.save(user);

        String accessToken = jwtUtil.generateAccessToken(
                email,
                user.getId(),
                user.getRole().name()
        );

        String refreshToken = jwtUtil.generateRefreshToken(email);

        String deviceInfo = (device != null ? device : "Unknown Device") +
                " | IP: " + (ip != null ? ip : "Unknown");

        Session session = Session.builder()
                .userId(user.getId())
                .token(accessToken)
                .deviceInfo(deviceInfo)
                .expiryTime(LocalDateTime.now().plusDays(1))
                .active(true)
                .build();

        sessionRepo.save(session);

        Map<String, String> tokens = new HashMap<>();
        tokens.put("accessToken", accessToken);
        tokens.put("refreshToken", refreshToken);

        return tokens;
    }

    // 🔁 REFRESH TOKEN
    public Map<String, String> refresh(String refreshToken) {

        if (!jwtUtil.validateRefreshToken(refreshToken)) {
            throw new ResponseStatusException(
                    HttpStatus.UNAUTHORIZED, "Invalid or expired refresh token");
        }

        String email = jwtUtil.extractEmail(refreshToken);

        User user = userRepo.findByEmail(email)
                .orElseThrow(() -> new ResponseStatusException(
                        HttpStatus.UNAUTHORIZED, "User not found"));

        String newAccessToken = jwtUtil.generateAccessToken(
                email,
                user.getId(),
                user.getRole().name()
        );

        String newRefreshToken = jwtUtil.generateRefreshToken(email);

        // 🔥 CREATE SESSION (MISSING BEFORE)
        Session session = Session.builder()
                .userId(user.getId())
                .token(newAccessToken)
                .deviceInfo("REFRESH")
                .expiryTime(LocalDateTime.now().plusDays(1))
                .active(true)
                .lastUsedAt(LocalDateTime.now())
                .build();

        sessionRepo.save(session);

        Map<String, String> tokens = new HashMap<>();
        tokens.put("accessToken", newAccessToken);
        tokens.put("refreshToken", newRefreshToken);

        return tokens;
    }

    // 🆕 REGISTER
    public void register(String username, String email, String password) {

        if (userRepo.findByEmail(email).isPresent()) {
            throw new ResponseStatusException(
                    HttpStatus.BAD_REQUEST,
                    "User already exists"
            );
        }

        User user = User.builder()
                .username(username)
                .email(email)
                .password(passwordEncoder.encode(password))
                .role(Role.USER)
                .accountNonLocked(true)
                .enabled(true)
                .failedAttempts(0)
                .build();

        userRepo.save(user);
    }

    // 🔓 LOGOUT
    public void logout(String token) {

        Optional<Session> sessionOpt = sessionRepo.findByToken(token);

        if (sessionOpt.isEmpty()) {
            throw new ResponseStatusException(
                    HttpStatus.UNAUTHORIZED, "Invalid token");
        }

        Session session = sessionOpt.get();

        if (!session.isActive()) {
            throw new ResponseStatusException(
                    HttpStatus.BAD_REQUEST, "Session already logged out");
        }

        session.setActive(false);
        sessionRepo.save(session);
    }
    public void register(String username, String email, String password, String role) {

        if (userRepo.findByEmail(email).isPresent()) {
            throw new ResponseStatusException(
                    HttpStatus.BAD_REQUEST,
                    "User already exists"
            );
        }

        // ❌ Block direct ADMIN creation
        Role userRole;
        if (role == null || role.equalsIgnoreCase("USER")) {
            userRole = Role.USER;
        } else {
            throw new ResponseStatusException(
                    HttpStatus.FORBIDDEN,
                    "Cannot assign ADMIN role"
            );
        }

        User user = User.builder()
                .username(username)
                .email(email)
                .password(passwordEncoder.encode(password))
                .role(userRole)
                .accountNonLocked(true)
                .enabled(true)
                .failedAttempts(0)
                .build();

        userRepo.save(user);
    }
    
    public void createAdmin(String username, String email, String password) {

        if (userRepo.findByEmail(email).isPresent()) {
            throw new ResponseStatusException(
                    HttpStatus.BAD_REQUEST,
                    "User already exists"
            );
        }

        User user = User.builder()
                .username(username)
                .email(email)
                .password(passwordEncoder.encode(password))
                .role(Role.ADMIN)   // 🔥 ONLY HERE
                .accountNonLocked(true)
                .enabled(true)
                .failedAttempts(0)
                .build();

        userRepo.save(user);
    }
}