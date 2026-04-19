package com.corex.repository;

import com.corex.entity.AuditLog;

import java.time.LocalDateTime;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

public interface AuditLogRepository extends JpaRepository<AuditLog, Long> {
	
	@Modifying
	@Query("UPDATE Session s SET s.active = false WHERE s.expiryTime < :now")
	void deactivateExpiredSessions(LocalDateTime now);
}