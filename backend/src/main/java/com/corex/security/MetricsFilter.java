package com.corex.security;

import com.corex.entity.Metrics;
import com.corex.repository.MetricsRepository;

import jakarta.servlet.FilterChain;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import lombok.RequiredArgsConstructor;

import org.springframework.stereotype.Component;
import org.springframework.web.filter.OncePerRequestFilter;

import java.io.IOException;
import java.util.Optional;

@Component
@RequiredArgsConstructor
public class MetricsFilter extends OncePerRequestFilter {

    private final MetricsRepository metricsRepo;

    @Override
    protected void doFilterInternal(HttpServletRequest request,
                                    HttpServletResponse response,
                                    FilterChain filterChain)
            throws ServletException, IOException {

        long startTime = System.currentTimeMillis();

        filterChain.doFilter(request, response);

        long duration = System.currentTimeMillis() - startTime;

        String endpoint = request.getRequestURI();
        String method = request.getMethod();

        Optional<Metrics> existing =
                metricsRepo.findByEndpointAndMethod(endpoint, method);

        Metrics metrics = existing.orElse(
                Metrics.builder()
                        .endpoint(endpoint)
                        .method(method)
                        .totalRequests(0)
                        .successCount(0)
                        .failureCount(0)
                        .totalResponseTime(0)
                        .build()
        );

        // 📊 Update metrics
        metrics.setTotalRequests(metrics.getTotalRequests() + 1);
        metrics.setTotalResponseTime(metrics.getTotalResponseTime() + duration);

        if (response.getStatus() >= 200 && response.getStatus() < 300) {
            metrics.setSuccessCount(metrics.getSuccessCount() + 1);
        } else {
            metrics.setFailureCount(metrics.getFailureCount() + 1);
        }

        metricsRepo.save(metrics);
    }
}