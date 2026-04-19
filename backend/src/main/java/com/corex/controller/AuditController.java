package com.corex.controller;

import com.corex.entity.AuditLog;
import com.corex.repository.AuditLogRepository;

import lombok.RequiredArgsConstructor;

import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/admin")
@RequiredArgsConstructor
public class AuditController {

    private final AuditLogRepository auditRepo;

    @GetMapping("/audit")
    public List<AuditLog> getLogs() {
        return auditRepo.findAll();
    }
}