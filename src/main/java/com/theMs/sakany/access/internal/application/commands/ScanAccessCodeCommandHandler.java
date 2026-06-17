package com.theMs.sakany.access.internal.application.commands;

import com.theMs.sakany.access.internal.domain.AccessCode;
import com.theMs.sakany.access.internal.domain.AccessCodeRepository;
import com.theMs.sakany.access.internal.domain.VisitLog;
import com.theMs.sakany.access.internal.domain.VisitLogRepository;
import com.theMs.sakany.shared.exception.BusinessRuleException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;



@Service
public class ScanAccessCodeCommandHandler {

    private final AccessCodeRepository accessCodeRepository;
    private final VisitLogRepository visitLogRepository;

    public ScanAccessCodeCommandHandler(
        AccessCodeRepository accessCodeRepository,
        VisitLogRepository visitLogRepository
    ) {
        this.accessCodeRepository = accessCodeRepository;
        this.visitLogRepository = visitLogRepository;
    }

    @Transactional
    public ScanAccessCodeResult handle(ScanAccessCodeCommand command) {
        AccessCode accessCode = accessCodeRepository.findByCode(command.code())
            .orElseThrow(() -> new IllegalArgumentException("Access code not found: " + command.code()));

        if (accessCode.isSingleUse() && visitLogRepository.existsByAccessCodeId(accessCode.getId())) {
            throw new BusinessRuleException("This access code has already been used");
        }

        if (!accessCode.isSingleUse() && accessCode.getUsageCount() != null) {
            long usedCount = visitLogRepository.countByAccessCodeId(accessCode.getId());
            if (usedCount >= accessCode.getUsageCount()) {
                throw new BusinessRuleException("This access code has reached its usage limit");
            }
        }

        // Validate and use the access code
        accessCode.use();

        // Save the updated access code
        accessCodeRepository.save(accessCode);

        // Create and save visit log
        VisitLog visitLog = VisitLog.create(
            accessCode.getId(),
            accessCode.getResidentId(),
            accessCode.getVisitorName(),
            command.gateNumber()
        );

        VisitLog savedVisitLog = visitLogRepository.save(visitLog);

        return new ScanAccessCodeResult(savedVisitLog.getId(), accessCode);
    }
}
