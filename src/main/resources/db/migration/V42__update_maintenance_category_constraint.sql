UPDATE maintenance_requests
SET category = 'AC_HEATING'
WHERE category = 'HVAC';

UPDATE maintenance_requests
SET category = 'OTHER'
WHERE category = 'ELEVATOR';

ALTER TABLE maintenance_requests
    DROP CONSTRAINT IF EXISTS maintenance_requests_category_check;

ALTER TABLE maintenance_requests
    ADD CONSTRAINT maintenance_requests_category_check
    CHECK (category IN (
        'PLUMBING',
        'ELECTRICAL',
        'AC_HEATING',
        'HOUSEKEEPING',
        'PAINTING',
        'CARPENTRY',
        'GARDEN',
        'ALUMINUM',
        'OTHER'
    ));
