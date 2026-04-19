package com.corex.controller;

import com.corex.dto.LoginRequest;
import com.corex.dto.RegisterRequest;
import com.corex.service.AuthService;

import jakarta.servlet.http.HttpServletRequest;

import lombok.RequiredArgsConstructor;

import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import java.util.Map;

@RestController
@RequestMapping("/auth")
@RequiredArgsConstructor
public class AuthController {

    private final AuthService authService;

    // ✅ REGISTER
    @PostMapping("/register")
    public ResponseEntity<?> register(@RequestBody RegisterRequest request) {

        authService.register(
                request.getUsername(),
                request.getEmail(),
                request.getPassword(),
                request.getRole()   // 🔥 THIS LINE YOU ASKED
        );

        return ResponseEntity.ok(
                Map.of("message", "User registered successfully")
        );
    }

    // ✅ LOGIN
    @PostMapping("/login")
    public ResponseEntity<?> login(
            @RequestBody LoginRequest request,
            HttpServletRequest httpRequest) {

        String device = httpRequest.getHeader("User-Agent");
        String ip = httpRequest.getRemoteAddr();

        Map<String, String> tokens = authService.login(
                request.getEmail(),
                request.getPassword(),
                device,
                ip
        );

        return ResponseEntity.ok(
                Map.of(
                        "accessToken", tokens.get("accessToken"),
                        "refreshToken", tokens.get("refreshToken"),
                        "type", "Bearer"
                )
        );
    }

    // 🔁 REFRESH TOKEN
    @PostMapping("/refresh")
    public ResponseEntity<?> refresh(@RequestBody Map<String, String> request) {

        String refreshToken = request.get("refreshToken");

        if (refreshToken == null || refreshToken.isEmpty()) {
            return ResponseEntity.badRequest()
                    .body(Map.of("error", "Refresh token is required"));
        }

        Map<String, String> tokens = authService.refresh(refreshToken);

        return ResponseEntity.ok(
                Map.of(
                        "accessToken", tokens.get("accessToken"),
                        "refreshToken", tokens.get("refreshToken"),
                        "type", "Bearer"
                )
        );
    }

    // 🔓 LOGOUT (Authorization header)
    @PostMapping("/logout")
    public ResponseEntity<?> logout(@RequestHeader("Authorization") String header) {

        String token = header.substring(7);
        authService.logout(token);

        return ResponseEntity.ok(Map.of("message", "Logged out"));
    }
    
    @PostMapping("/create-admin")
    public ResponseEntity<?> createAdmin(@RequestBody RegisterRequest request) {

        authService.createAdmin(
                request.getUsername(),
                request.getEmail(),
                request.getPassword()
        );

        return ResponseEntity.ok(
                Map.of("message", "Admin created successfully")
        );
    }
}