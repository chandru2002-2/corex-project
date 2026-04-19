package com.corex.util;

import io.jsonwebtoken.*;
import io.jsonwebtoken.security.Keys;
import io.jsonwebtoken.SignatureAlgorithm;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

import jakarta.annotation.PostConstruct;

import java.security.Key;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

@Component
public class JwtUtil {

    @Value("${jwt.secret}")
    private String SECRET;

    private Key key;

    private final long ACCESS_TOKEN_VALIDITY = 1000 * 60 * 60 * 24; // 1 day
    private final long REFRESH_TOKEN_VALIDITY = 1000 * 60 * 60 * 24 * 7; // 7 days

    @PostConstruct
    public void init() {
        key = Keys.hmacShaKeyFor(SECRET.getBytes());
    }

    // 🔐 ACCESS TOKEN
    public String generateAccessToken(String email, Long userId, String role) {

        Map<String, Object> claims = new HashMap<>();
        claims.put("userId", userId);
        claims.put("role", role);
        claims.put("type", "ACCESS");

        return Jwts.builder()
                .setClaims(claims)
                .setSubject(email)
                .setIssuedAt(new Date())
                .setExpiration(new Date(System.currentTimeMillis() + ACCESS_TOKEN_VALIDITY))
                .signWith(key, SignatureAlgorithm.HS256)
                .compact();
    }

    // 🔐 REFRESH TOKEN
    public String generateRefreshToken(String email) {

        Map<String, Object> claims = new HashMap<>();
        claims.put("type", "REFRESH");

        return Jwts.builder()
                .setClaims(claims)
                .setSubject(email)
                .setIssuedAt(new Date())
                .setExpiration(new Date(System.currentTimeMillis() + REFRESH_TOKEN_VALIDITY))
                .signWith(key, SignatureAlgorithm.HS256)
                .compact();
    }

    // 📥 Extract Email
    public String extractEmail(String token) {
        return extractAllClaims(token).getSubject();
    }

    // 📥 Extract Role
    public String extractRole(String token) {
        return extractAllClaims(token).get("role", String.class);
    }

    // 📥 Extract UserId
    public Long extractUserId(String token) {
        return extractAllClaims(token).get("userId", Long.class);
    }

    // 📥 Extract Token Type
    public String extractTokenType(String token) {
        return extractAllClaims(token).get("type", String.class);
    }

    // ✅ GENERIC VALIDATION (used in JwtFilter)
    public boolean validateToken(String token) {
        try {
            Claims claims = extractAllClaims(token);

            // ✅ Must be ACCESS token
            String type = claims.get("type", String.class);
            if (!"ACCESS".equals(type)) {
                return false;
            }

            return !isTokenExpired(claims);

        } catch (JwtException | IllegalArgumentException e) {
            return false;
        }
    }

    // ✅ ACCESS TOKEN VALIDATION
    public boolean validateAccessToken(String token) {
        return validateToken(token);
    }

    // ✅ REFRESH TOKEN VALIDATION
    public boolean validateRefreshToken(String token) {
        try {
            Claims claims = extractAllClaims(token);

            String type = claims.get("type", String.class);
            if (!"REFRESH".equals(type)) {
                return false;
            }

            return !isTokenExpired(claims);

        } catch (JwtException | IllegalArgumentException e) {
            return false;
        }
    }

    // ⏳ Check expiry (optimized)
    private boolean isTokenExpired(Claims claims) {
        return claims.getExpiration().before(new Date());
    }

    // 🔍 Parse Claims (single point)
    private Claims extractAllClaims(String token) {
        return Jwts.parserBuilder()
                .setSigningKey(key)
                .build()
                .parseClaimsJws(token)
                .getBody();
    }
}