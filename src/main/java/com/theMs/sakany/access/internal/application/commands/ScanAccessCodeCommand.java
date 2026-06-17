package com.theMs.sakany.access.internal.application.commands;

import com.theMs.sakany.shared.cqrs.Command;



public record ScanAccessCodeCommand(
    String code,
    String gateNumber
) implements Command<ScanAccessCodeResult> {
}
