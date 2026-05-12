package com.theMs.sakany.access.internal.api.dtos;

import com.theMs.sakany.access.internal.domain.AccessCodeStatus;
import com.theMs.sakany.access.internal.domain.VisitPurpose;

import java.time.Instant;
import java.util.UUID;

public record ScanAccessCodeResponse(
    UUID visitLogId,
    UUID accessCodeId,
    String visitorName,
    VisitPurpose purpose,
    Instant validUntil,
    AccessCodeStatus status,
    boolean isSingleUse,
    Integer usageCount,
    Instant usedAt
) {
}
