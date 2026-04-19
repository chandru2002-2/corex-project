package com.corex.entity;

import jakarta.persistence.*;
import lombok.*;

@Entity
@Table(name = "metrics")
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Metrics {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String endpoint;
    private String method;

    private long totalRequests;
    private long successCount;
    private long failureCount;

    private long totalResponseTime; // ms
}