package org.core.domain.entities;

import java.math.BigDecimal;
import java.time.LocalDate;
import java.time.LocalDateTime;

public record User(
        Integer id,
        String username,
        String password,
        String firstName,
        String lastName,
        String firstSurname,
        String secondSurname,
        LocalDate birthdate,
        Gender gender,
        String email1,
        String email2,
        String email3,
        String department,
        String municipality,
        String postalCode,
        String document,
        DocumentType documentType,
        String workPlace,
        String workSince,
        BigDecimal workSalary,
        Boolean deleted,
        LocalDateTime createdAt,
        LocalDateTime updatedAt
) {
    public enum Gender {
        M, F
    }

    public enum DocumentType {
        DPI, PASAPORTE
    }
}
