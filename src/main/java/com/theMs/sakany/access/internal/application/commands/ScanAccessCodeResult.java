package com.theMs.sakany.access.internal.application.commands;

import com.theMs.sakany.access.internal.domain.AccessCode;

import java.util.UUID;

public record ScanAccessCodeResult(
    UUID visitLogId,
    AccessCode accessCode
) {
}
