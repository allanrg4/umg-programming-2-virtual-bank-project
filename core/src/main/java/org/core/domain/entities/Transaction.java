package org.core.domain.entities;

import java.math.BigDecimal;
import java.time.LocalDateTime;

public record Transaction(
        Integer id,
        Integer accountId,
        String transferAccount,
        BigDecimal amount,
        TransactionType type,
        String reference,
        String description,
        Boolean deleted,
        LocalDateTime createdAt,
        LocalDateTime updatedAt
) {
    public enum TransactionType {
        DEPOSIT,
        WITHDRAWAL,
        TRANSFER
    }
}
