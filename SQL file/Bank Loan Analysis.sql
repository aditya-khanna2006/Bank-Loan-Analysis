CREATE TABLE financial_loan (
    id BIGINT,
    address_state VARCHAR(10),
    application_type VARCHAR(50),
    emp_length VARCHAR(20),
    emp_title VARCHAR(255),
    grade VARCHAR(5),
    home_ownership VARCHAR(30),
    issue_date DATE,
    last_credit_pull_date DATE,
    last_payment_date DATE,
    loan_status VARCHAR(50),
    next_payment_date DATE,
    member_id BIGINT,
    purpose VARCHAR(100),
    sub_grade VARCHAR(5),
    term VARCHAR(30),
    verification_status VARCHAR(50),
    annual_income NUMERIC(15,2),
    dti NUMERIC(10,2),
    installment NUMERIC(15,2),
    int_rate NUMERIC(10,4),
    loan_amount BIGINT,
    total_acc INTEGER,
    total_payment BIGINT
);
select * from financial_loan;

-- ============================================================
-- BANK LOAN REPORT - POSTGRESQL QUERIES
-- ============================================================


-- ============================================================
-- A. SUMMARY
-- ============================================================


-- 1. KPI SUMMARY
-- MTD = December
-- PMTD = November


SELECT
    period,
    loan_applications,
    funded_amount,
    amount_received,
    avg_interest_rate,
    avg_dti
FROM (
    -- MTD
    SELECT
        'MTD' AS period,

        COUNT(*) FILTER (
            WHERE EXTRACT(MONTH FROM issue_date) = 12
        ) AS loan_applications,

        SUM(loan_amount) FILTER (
            WHERE EXTRACT(MONTH FROM issue_date) = 12
        ) AS funded_amount,

        SUM(total_payment) FILTER (
            WHERE EXTRACT(MONTH FROM issue_date) = 12
        ) AS amount_received,

        AVG(int_rate) FILTER (
            WHERE EXTRACT(MONTH FROM issue_date) = 12
        ) AS avg_interest_rate,

        AVG(dti) FILTER (
            WHERE EXTRACT(MONTH FROM issue_date) = 12
        ) AS avg_dti

    FROM financial_loan

    UNION ALL

    -- PMTD
    SELECT
        'PMTD',

        COUNT(*) FILTER (
            WHERE EXTRACT(MONTH FROM issue_date) = 11
        ),

        SUM(loan_amount) FILTER (
            WHERE EXTRACT(MONTH FROM issue_date) = 11
        ),

        SUM(total_payment) FILTER (
            WHERE EXTRACT(MONTH FROM issue_date) = 11
        ),

        AVG(int_rate) FILTER (
            WHERE EXTRACT(MONTH FROM issue_date) = 11
        ),

        AVG(dti) FILTER (
            WHERE EXTRACT(MONTH FROM issue_date) = 11
        )

    FROM financial_loan

    UNION ALL

    -- TOTAL
    SELECT
        'Total',
        COUNT(*),
        SUM(loan_amount),
        SUM(total_payment),
        AVG(int_rate),
        AVG(dti)

    FROM financial_loan

) AS loan_summary;


-- ============================================================
-- 2. GOOD LOAN
-- Fully Paid + Current
-- ============================================================

SELECT
    COUNT(*) FILTER (
        WHERE loan_status IN ('Fully Paid', 'Current')
    ) AS good_loan_applications,

    SUM(loan_amount) FILTER (
        WHERE loan_status IN ('Fully Paid', 'Current')
    ) AS good_loan_funded_amount,

    SUM(total_payment) FILTER (
        WHERE loan_status IN ('Fully Paid', 'Current')
    ) AS good_loan_amount_received,

    COUNT(*) FILTER (
        WHERE loan_status IN ('Fully Paid', 'Current')
    ) * 100.0 / COUNT(*) AS good_loan_percentage

FROM financial_loan;


-- ============================================================
-- 3. BAD LOAN
-- Charged Off
-- ============================================================

SELECT
    COUNT(*) FILTER (
        WHERE loan_status = 'Charged Off'
    ) AS bad_loan_applications,

    SUM(loan_amount) FILTER (
        WHERE loan_status = 'Charged Off'
    ) AS bad_loan_funded_amount,

    SUM(total_payment) FILTER (
        WHERE loan_status = 'Charged Off'
    ) AS bad_loan_amount_received,

    COUNT(*) FILTER (
        WHERE loan_status = 'Charged Off'
    ) * 100.0 / COUNT(*) AS bad_loan_percentage

FROM financial_loan;


-- ============================================================
-- 4. LOAN STATUS
-- ============================================================

SELECT
    loan_status,
    COUNT(id) AS loan_count,
    SUM(total_payment) AS total_amount_received,
    SUM(loan_amount) AS total_funded_amount,
    AVG(int_rate) AS interest_rate,
    AVG(dti) AS dti

FROM financial_loan

GROUP BY loan_status

ORDER BY loan_status;


-- ============================================================
-- 5. MTD LOAN STATUS
-- ============================================================

SELECT
    loan_status,
    COUNT(id) AS loan_count,
    SUM(total_payment) AS mtd_total_amount_received,
    SUM(loan_amount) AS mtd_total_funded_amount

FROM financial_loan

WHERE EXTRACT(MONTH FROM issue_date) = 12

GROUP BY loan_status

ORDER BY loan_status;


-- ============================================================
-- B. OVERVIEW
-- ============================================================


-- ============================================================
-- 6. MONTHLY ANALYSIS
-- ============================================================

SELECT
    EXTRACT(MONTH FROM issue_date) AS month_number,
    TO_CHAR(issue_date, 'Month') AS month_name,
    COUNT(id) AS total_loan_applications,
    SUM(loan_amount) AS total_funded_amount,
    SUM(total_payment) AS total_amount_received

FROM financial_loan

GROUP BY
    EXTRACT(MONTH FROM issue_date),
    TO_CHAR(issue_date, 'Month')

ORDER BY
    month_number;


-- ============================================================
-- 7. STATE ANALYSIS
-- ============================================================

SELECT
    address_state AS state,
    COUNT(id) AS total_loan_applications,
    SUM(loan_amount) AS total_funded_amount,
    SUM(total_payment) AS total_amount_received

FROM financial_loan

GROUP BY address_state

ORDER BY address_state;


-- ============================================================
-- 8. TERM ANALYSIS
-- ============================================================

SELECT
    term,
    COUNT(id) AS total_loan_applications,
    SUM(loan_amount) AS total_funded_amount,
    SUM(total_payment) AS total_amount_received

FROM financial_loan

GROUP BY term

ORDER BY term;


-- ============================================================
-- 9. EMPLOYEE LENGTH ANALYSIS
-- ============================================================

SELECT
    emp_length AS employee_length,
    COUNT(id) AS total_loan_applications,
    SUM(loan_amount) AS total_funded_amount,
    SUM(total_payment) AS total_amount_received

FROM financial_loan

GROUP BY emp_length

ORDER BY emp_length;


-- ============================================================
-- 10. PURPOSE ANALYSIS
-- ============================================================

SELECT
    purpose,
    COUNT(id) AS total_loan_applications,
    SUM(loan_amount) AS total_funded_amount,
    SUM(total_payment) AS total_amount_received

FROM financial_loan

GROUP BY purpose

ORDER BY purpose;


-- ============================================================
-- 11. HOME OWNERSHIP ANALYSIS
-- ============================================================

SELECT
    home_ownership,
    COUNT(id) AS total_loan_applications,
    SUM(loan_amount) AS total_funded_amount,
    SUM(total_payment) AS total_amount_received

FROM financial_loan

GROUP BY home_ownership

ORDER BY home_ownership;


-- ============================================================
-- 12. GRADE A FILTER
-- Used to validate Power BI filters
-- ============================================================

SELECT
    purpose,
    COUNT(id) AS total_loan_applications,
    SUM(loan_amount) AS total_funded_amount,
    SUM(total_payment) AS total_amount_received

FROM financial_loan

WHERE grade = 'A'

GROUP BY purpose

ORDER BY purpose;