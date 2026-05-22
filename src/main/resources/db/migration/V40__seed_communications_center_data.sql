-- V40: Seed Communications Center data for Admin dashboard
-- Idempotent seed for Push Notifications, System Notifications, and News Announcements.

-- News & Announcements cards
INSERT INTO announcements (
    id,
    author_id,
    title,
    content,
    priority,
    is_active,
    expires_at,
    created_at,
    updated_at
)
VALUES
(
    'b1000000-0000-4000-8000-000000000001',
    'aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaaaa',
    'Summer Pool Hours Update',
    'The community pool will now open daily from 8:00 AM to 10:00 PM during the summer season.',
    'NORMAL',
    TRUE,
    CURRENT_TIMESTAMP + INTERVAL '21 day',
    CURRENT_TIMESTAMP - INTERVAL '2 day',
    CURRENT_TIMESTAMP - INTERVAL '2 day'
),
(
    'b1000000-0000-4000-8000-000000000002',
    'aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaaaa',
    'Upcoming Maintenance Notice',
    'Water supply will be temporarily interrupted on Friday from 8:00 AM to 12:00 PM for scheduled maintenance.',
    'URGENT',
    TRUE,
    CURRENT_TIMESTAMP + INTERVAL '7 day',
    CURRENT_TIMESTAMP - INTERVAL '1 day',
    CURRENT_TIMESTAMP - INTERVAL '1 day'
),
(
    'b1000000-0000-4000-8000-000000000003',
    'aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaaaa',
    'Community App Tips',
    'Use the app to follow announcements, report issues, and receive live updates from the administration.',
    'LOW',
    FALSE,
    NULL,
    CURRENT_TIMESTAMP - INTERVAL '5 day',
    CURRENT_TIMESTAMP - INTERVAL '5 day'
)
ON CONFLICT (id) DO NOTHING;

-- Push Notifications: grouped by reference_id and channel PUSH
INSERT INTO notification_logs (
    id,
    recipient_id,
    title,
    body,
    type,
    reference_id,
    channel,
    status,
    sent_at,
    read_at,
    failure_reason,
    created_at,
    updated_at
)
VALUES
(
    'c1000000-0000-4000-8000-000000000001',
    '44444444-4444-4444-4444-444444444444',
    'Pool Maintenance Tomorrow',
    'The swimming pool will be closed tomorrow from 9 AM to 2 PM for scheduled maintenance.',
    'GENERAL',
    'c2000000-0000-4000-8000-000000000001',
    'PUSH',
    'SENT',
    CURRENT_TIMESTAMP - INTERVAL '2 day',
    CURRENT_TIMESTAMP - INTERVAL '2 day' + INTERVAL '20 minute',
    NULL,
    CURRENT_TIMESTAMP - INTERVAL '2 day',
    CURRENT_TIMESTAMP - INTERVAL '2 day'
),
(
    'c1000000-0000-4000-8000-000000000002',
    'aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaaaa',
    'Pool Maintenance Tomorrow',
    'The swimming pool will be closed tomorrow from 9 AM to 2 PM for scheduled maintenance.',
    'GENERAL',
    'c2000000-0000-4000-8000-000000000001',
    'PUSH',
    'SENT',
    CURRENT_TIMESTAMP - INTERVAL '2 day',
    CURRENT_TIMESTAMP - INTERVAL '2 day' + INTERVAL '25 minute',
    NULL,
    CURRENT_TIMESTAMP - INTERVAL '2 day',
    CURRENT_TIMESTAMP - INTERVAL '2 day'
),
(
    'c1000000-0000-4000-8000-000000000003',
    '44444444-4444-4444-4444-444444444444',
    'Community Meeting Reminder',
    'Reminder: Monthly community meeting is scheduled for Friday at 6 PM in the main hall.',
    'EVENT_REMINDER',
    'c2000000-0000-4000-8000-000000000002',
    'PUSH',
    'SENT',
    CURRENT_TIMESTAMP - INTERVAL '1 day',
    NULL,
    NULL,
    CURRENT_TIMESTAMP - INTERVAL '1 day',
    CURRENT_TIMESTAMP - INTERVAL '1 day'
),
(
    'c1000000-0000-4000-8000-000000000004',
    'aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaaaa',
    'Community Meeting Reminder',
    'Reminder: Monthly community meeting is scheduled for Friday at 6 PM in the main hall.',
    'EVENT_REMINDER',
    'c2000000-0000-4000-8000-000000000002',
    'PUSH',
    'SENT',
    CURRENT_TIMESTAMP - INTERVAL '1 day',
    NULL,
    NULL,
    CURRENT_TIMESTAMP - INTERVAL '1 day',
    CURRENT_TIMESTAMP - INTERVAL '1 day'
)
ON CONFLICT (id) DO NOTHING;

-- System Notifications: ALERT / PAYMENT_DUE / MAINTENANCE_UPDATE with non-PUSH channel
INSERT INTO notification_logs (
    id,
    recipient_id,
    title,
    body,
    type,
    reference_id,
    channel,
    status,
    sent_at,
    read_at,
    failure_reason,
    created_at,
    updated_at
)
VALUES
(
    'd1000000-0000-4000-8000-000000000001',
    '44444444-4444-4444-4444-444444444444',
    'Missing & Found Alert: Missing orange cat near Building A',
    'A missing orange cat was reported near Building A. Please contact the administration if found.',
    'ALERT',
    'a2000000-0000-4000-8000-000000000001',
    'IN_APP',
    'SENT',
    CURRENT_TIMESTAMP - INTERVAL '2 day',
    NULL,
    NULL,
    CURRENT_TIMESTAMP - INTERVAL '2 day',
    CURRENT_TIMESTAMP - INTERVAL '2 day'
),
(
    'd1000000-0000-4000-8000-000000000002',
    '44444444-4444-4444-4444-444444444444',
    'Payment Due Reminder',
    'Your monthly maintenance fee is due in 3 days. Please pay before the deadline to avoid late fees.',
    'PAYMENT_DUE',
    '99999999-9999-9999-9999-999999999991',
    'EMAIL',
    'SENT',
    CURRENT_TIMESTAMP - INTERVAL '1 day',
    NULL,
    NULL,
    CURRENT_TIMESTAMP - INTERVAL '1 day',
    CURRENT_TIMESTAMP - INTERVAL '1 day'
),
(
    'd1000000-0000-4000-8000-000000000003',
    'aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaaaa',
    'Maintenance Update',
    'Maintenance request #66666666-6666-6666-6666-666666666661 has been received and is awaiting assignment.',
    'MAINTENANCE_UPDATE',
    '66666666-6666-6666-6666-666666666661',
    'IN_APP',
    'SENT',
    CURRENT_TIMESTAMP - INTERVAL '8 hour',
    NULL,
    NULL,
    CURRENT_TIMESTAMP - INTERVAL '8 hour',
    CURRENT_TIMESTAMP - INTERVAL '8 hour'
)
ON CONFLICT (id) DO NOTHING;
