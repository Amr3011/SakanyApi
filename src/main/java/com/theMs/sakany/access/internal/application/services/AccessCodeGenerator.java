package com.theMs.sakany.access.internal.application.services;

import org.springframework.stereotype.Service;

import java.security.SecureRandom;

@Service
public class AccessCodeGenerator {

    private final SecureRandom random = new SecureRandom();

    public String generateCode(String prefix) {
        String year = String.valueOf(java.time.Year.now().getValue());
        int randomNum = random.nextInt(1000); // 000 to 999
        return String.format("%s-%s-%03d", prefix, year, randomNum);
    }
}
