package com.corex.controller;

import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

@RestController
public class RoleTestController {

    @GetMapping("/admin/test")
    
    public String admin() {
        return "Admin API working";
    }

    @GetMapping("/user/test")
    public String user() {
        return "User API working";
    }
}