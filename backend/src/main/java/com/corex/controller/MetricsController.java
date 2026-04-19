package com.corex.controller;

import com.corex.repository.SessionRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.*;

import java.util.Map;

@RestController
@RequestMapping("/admin")
@RequiredArgsConstructor
public class MetricsController {

    private final SessionRepository sessionRepo;

    @GetMapping("/metrics")
    public Map<String, Object> metrics() {

        long totalSessions = sessionRepo.count();

        return Map.of(
                "totalSessions", totalSessions
        );
    }
}