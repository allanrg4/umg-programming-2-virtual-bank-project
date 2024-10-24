package org.core.domain.entities;

import java.time.LocalDateTime;

public record Account(
        Integer id,
        Integer userId,
        String accountNumber,
        AccountType accountType,
        String pin,
        Boolean notificationSms,
        Boolean notificationEmail,
        Boolean onlineBanking,
        Boolean checkbook,
        Boolean deleted,
        LocalDateTime createdAt,
        LocalDateTime updatedAt
) {
    public enum AccountType {
        SAVINGS,
        CHECKING
    }
}
