package com.corex.repository;

import com.corex.entity.Metrics;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.Optional;

public interface MetricsRepository extends JpaRepository<Metrics, Long> {

    Optional<Metrics> findByEndpointAndMethod(String endpoint, String method);
}