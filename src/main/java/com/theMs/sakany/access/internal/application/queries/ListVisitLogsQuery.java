package com.theMs.sakany.access.internal.application.queries;

import com.theMs.sakany.shared.cqrs.Command;
import com.theMs.sakany.access.internal.domain.VisitLog;

import java.util.List;
import java.util.UUID;

public record ListVisitLogsQuery(
    UUID residentId
) implements Command<List<VisitLog>> {
}
