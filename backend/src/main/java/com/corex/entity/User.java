package com.corex.entity;

import jakarta.persistence.*;
import lombok.*;

import java.time.LocalDateTime;

@Entity
@Table(name = "users")
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class User {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(nullable = false)
    private String username;

    @Column(unique = true, nullable = false)
    private String email;

    @Column(nullable = false)
    private String password;

    // 🔐 Security
    private boolean accountNonLocked = true;
    private int failedAttempts = 0;
    private LocalDateTime lockTime;
    private boolean enabled = true;

    // 🧠 Role
    @Enumerated(EnumType.STRING)
    private Role role;

    // 📊 Tracking
    private LocalDateTime lastLogin;

    // 🕒 Audit
    private LocalDateTime createdAt;
    private LocalDateTime updatedAt;

    @PrePersist
    protected void onCreate() {
        createdAt = LocalDateTime.now();
    }

    @PreUpdate
    protected void onUpdate() {
        updatedAt = LocalDateTime.now();
    }
}