package com.theMs.sakany.access.internal.application.queries;

import com.theMs.sakany.shared.cqrs.Command;
import com.theMs.sakany.access.internal.domain.AccessCode;

import java.util.List;
import java.util.UUID;

public record ListAccessCodesQuery(
    UUID residentId
) implements Command<List<AccessCode>> {
}
