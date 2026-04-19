package com.corex.service;

import com.corex.entity.Session;
import com.corex.repository.SessionRepository;

import jakarta.transaction.Transactional;
import lombok.RequiredArgsConstructor;

import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;
import java.util.List;

@Service
@RequiredArgsConstructor
public class SchedulerService {

    private final SessionRepository sessionRepo;

    // 🔥 Every 5 min → expire sessions
    @Scheduled(fixedRate = 300000)
    @Transactional
    public void expireSessions() {

        int updated = sessionRepo.expireSessions(LocalDateTime.now());
        System.out.println("⏳ Expired Sessions: " + updated);
    }

    // 🔥 Every 30 min → delete inactive sessions
    @Scheduled(fixedRate = 1800000)
    @Transactional
    public void cleanupInactiveSessions() {

        int deleted = sessionRepo.deleteInactiveSessions();
        System.out.println("🧹 Deleted inactive sessions: " + deleted);
    }

    // 🔥 Monitoring
    @Scheduled(fixedRate = 60000)
    public void printStats() {
        System.out.println("📊 Total Sessions: " + sessionRepo.count());
    }
}