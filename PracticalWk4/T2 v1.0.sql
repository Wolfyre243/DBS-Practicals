-- Transaction 2
BEGIN;

UPDATE payment_history SET amount_paid=amount_paid+100 WHERE payee_no = 'A999';

COMMIT;
