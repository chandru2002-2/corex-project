package com.corex.config;

import com.corex.security.AuditFilter;
import com.corex.security.JwtFilter;
import com.corex.security.MetricsFilter;

import lombok.RequiredArgsConstructor;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.config.annotation.authentication.configuration.AuthenticationConfiguration;

import org.springframework.security.config.annotation.method.configuration.EnableMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;

import org.springframework.security.config.http.SessionCreationPolicy;

import org.springframework.security.web.SecurityFilterChain;
import org.springframework.security.web.authentication.UsernamePasswordAuthenticationFilter;

@Configuration
@EnableWebSecurity
@EnableMethodSecurity
@RequiredArgsConstructor
public class SecurityConfig {

    private final JwtFilter jwtFilter;
    private final AuditFilter auditFilter;
    private final MetricsFilter metricsFilter;

    @Bean
    public SecurityFilterChain securityFilterChain(HttpSecurity http) throws Exception {

    	http
        .cors(cors -> {})   // ✅ ADD THIS
        .csrf(csrf -> csrf.disable())

            // ❌ Disable default login UI
            .formLogin(form -> form.disable())
            .httpBasic(basic -> basic.disable())

            // 🔐 Authorization Rules
            .authorizeHttpRequests(auth -> auth

            	    // ✅ Public APIs
            	    .requestMatchers(
            	            "/auth/**",
            	            "/",
            	            "/swagger-ui/**",
            	            "/v3/api-docs/**"
            	    ).permitAll()

            	    // ✅ Role based APIs
            	    .requestMatchers("/admin/**").hasRole("ADMIN")
            	    .requestMatchers("/user/**").hasAnyRole("USER", "ADMIN")

            	    // 🔒 Everything else
            	    .anyRequest().authenticated()
            	)
            // 🚫 Stateless (JWT only)
            .sessionManagement(sess -> sess
                .sessionCreationPolicy(SessionCreationPolicy.STATELESS)
            )

            // 🔥 FILTER ORDER (VERY IMPORTANT)
            .addFilterBefore(jwtFilter, UsernamePasswordAuthenticationFilter.class)
            .addFilterAfter(metricsFilter, JwtFilter.class)
            .addFilterAfter(auditFilter, JwtFilter.class); // ✅ ADDED

        return http.build();
    }

    // 🔧 AuthenticationManager (for future use)
    @Bean
    public AuthenticationManager authenticationManager(AuthenticationConfiguration config) throws Exception {
        return config.getAuthenticationManager();
    }
}