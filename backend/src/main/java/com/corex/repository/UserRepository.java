package com.corex.repository;

import java.util.Optional;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.corex.entity.Role;
import com.corex.entity.User;

public interface UserRepository extends JpaRepository<User, Long> {

    // 🔐 Auth
    Optional<User> findByEmail(String email);
    boolean existsByEmail(String email);

    // 🧠 Role-based (use enum if implemented)
    List<User> findByRole(Role role);
    long countByRole(Role role);

    // 🔒 Security
    List<User> findByAccountNonLockedFalse();
    List<User> findByEnabledTrue();
}