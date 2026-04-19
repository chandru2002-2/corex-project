package com.corex.repository;

import java.time.LocalDateTime;
import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

import com.corex.entity.Session;

public interface SessionRepository extends JpaRepository<Session, Long> {

    // 🔐 Find by token
    Optional<Session> findByToken(String token);

    // 📱 Get all active sessions of user
    List<Session> findByUserIdAndActiveTrue(Long userId);

    // 🔒 Logout all sessions
    List<Session> findByUserId(Long userId);
    
    List<Session> findByExpiryTimeBefore(LocalDateTime time);

  //  @Modifying
   // @Query("UPDATE Session s SET s.active = false WHERE s.lastUsedAt < :time")
   // void deactivateInactiveSessions(LocalDateTime time);
    
    @Modifying
    @Query("UPDATE Session s SET s.active = false WHERE s.expiryTime < :now")
    int expireSessions(LocalDateTime now);

    @Modifying
    @Query("DELETE FROM Session s WHERE s.active = false")
    int deleteInactiveSessions();
}