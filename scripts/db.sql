CREATE TABLE `users`
(
    `id`             INT          NOT NULL PRIMARY KEY AUTO_INCREMENT,
    `username`       VARCHAR(255) NOT NULL UNIQUE,
    `password`       VARCHAR(255) NOT NULL,
    `first_name`     VARCHAR(255),
    `last_name`      VARCHAR(255),
    `first_surname`  VARCHAR(255),
    `second_surname` VARCHAR(255),
    `birthdate`      DATE,
    `gender`         ENUM ('M', 'F'),
    `email_1`        VARCHAR(255),
    `email_2`        VARCHAR(255),
    `email_3`        VARCHAR(255),
    `department`     VARCHAR(255),
    `municipality`   VARCHAR(255),
    `postal_code`    VARCHAR(255),
    `document`       VARCHAR(255),
    `document_type`  ENUM ('DPI', 'PASAPORTE'),
    `work_place`     VARCHAR(255),
    `work_since`     VARCHAR(255),
    `work_salary`    DECIMAL(10, 2),
    `deleted`        BOOLEAN   DEFAULT FALSE,
    `created_at`     TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    `updated_at`     TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8;

CREATE TABLE `accounts`
(
    `id`                 INT          NOT NULL PRIMARY KEY AUTO_INCREMENT,
    `user_id`            INT          NOT NULL,
    `account_number`     VARCHAR(255) NOT NULL UNIQUE,
    `account_type`       ENUM ('SAVINGS', 'CHECKING'),
    `pin`                VARCHAR(4),
    `notification_sms`   BOOLEAN   DEFAULT FALSE,
    `notification_email` BOOLEAN   DEFAULT FALSE,
    `online_banking`     BOOLEAN   DEFAULT FALSE,
    `checkbook`          BOOLEAN   DEFAULT FALSE,
    `deleted`            BOOLEAN   DEFAULT FALSE,
    `created_at`         TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    `updated_at`         TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8;

CREATE TABLE `transactions`
(
    `id`               INT            NOT NULL PRIMARY KEY AUTO_INCREMENT,
    `account_id`       INT            NOT NULL,
    `transfer_account` VARCHAR(255),
    `amount`           DECIMAL(10, 2) NOT NULL,
    `type`             ENUM ('DEPOSIT', 'WITHDRAWAL', 'TRANSFER'),
    `reference`        VARCHAR(255),
    `description`      TEXT,
    `deleted`          BOOLEAN   DEFAULT FALSE,
    `created_at`       TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    `updated_at`       TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (`account_id`) REFERENCES `accounts` (`id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8;

-- Fixtures

INSERT INTO `users`
(`username`, `password`, `first_name`, `last_name`, `first_surname`, `second_surname`, `birthdate`, `gender`, `email_1`,
 `email_2`, `email_3`, `department`, `municipality`, `postal_code`, `document`, `document_type`, `work_place`,
 `work_since`, `work_salary`)
VALUES ('jdoe', 'password123', 'John', 'Doe', 'Doe', 'Smith', '1985-06-15', 'M', 'jdoe@example.com',
        'john.doe@work.com', NULL, 'Engineering', 'Cityville', '12345', '123456789', 'DPI', 'TechCorp', '2010-08-01',
        50000.00),
       ('asmith', 'mypassword', 'Alice', 'Smith', 'Smith', 'Johnson', '1990-02-20', 'F', 'asmith@example.com', NULL,
        NULL, 'HR', 'Townsville', '67890', '987654321', 'PASAPORTE', 'Consulting Inc.', '2015-04-12', 40000.00),
       ('bwayne', 'batman', 'Bruce', 'Wayne', 'Wayne', 'Pennyworth', '1972-04-17', 'M', 'bwayne@wayneindustries.com',
        'bruce.wayne@gmail.com', NULL, 'Operations', 'Gotham', '11111', '999999999', 'DPI', 'Wayne Enterprises',
        '2000-09-30', 1000000.00),
       ('pwalker', 'fast123', 'Paul', 'Walker', 'Walker', 'OConner', '1980-09-12', 'M', 'pwalker@racing.com', NULL,
        NULL, 'Racing', 'Los Angeles', '54321', '543216789', 'DPI', 'FastCars Inc.', '2012-05-01', 70000.00),
       ('tswift', 'taytay', 'Taylor', 'Swift', 'Swift', 'Alison', '1989-12-13', 'F', 'tswift@music.com', NULL, NULL,
        'Music', 'Nashville', '87654', '987654321', 'PASAPORTE', 'Swift Enterprises', '2008-03-05', 150000.00),
       ('rgosling', 'bladerunner', 'Ryan', 'Gosling', 'Gosling', 'Reynolds', '1980-11-12', 'M',
        'rgosling@hollywood.com', NULL, NULL, 'Acting', 'Los Angeles', '65432', '654321987', 'DPI', 'Hollywood Films',
        '2006-08-18', 120000.00),
       ('mwatson', 'hermione', 'Emma', 'Watson', 'Watson', 'Granger', '1990-04-15', 'F', 'mwatson@films.com', NULL,
        NULL, 'Acting', 'London', '09876', '098761234', 'PASAPORTE', 'British Cinema', '2005-11-10', 90000.00),
       ('clee', 'dragon123', 'Bruce', 'Lee', 'Lee', 'KungFu', '1940-11-27', 'M', 'clee@martialarts.com', NULL, NULL,
        'Martial Arts', 'San Francisco', '44556', '777889999', 'DPI', 'Martial Arts School', '1970-01-01', 200000.00),
       ('neil', 'moonman', 'Neil', 'Armstrong', 'Armstrong', 'Aldrin', '1930-08-05', 'M', 'neil@nasa.com', NULL, NULL,
        'NASA', 'Houston', '11223', '123654789', 'DPI', 'NASA', '1965-02-20', 180000.00),
       ('elon', 'teslaking', 'Elon', 'Musk', 'Musk', 'Rive', '1971-06-28', 'M', 'elon@tesla.com', 'elon@spacex.com',
        NULL, 'Technology', 'Palo Alto', '90001', '111222333', 'PASAPORTE', 'SpaceX', '2002-07-15', 500000.00);

INSERT INTO `accounts`
(`user_id`, `account_number`, `account_type`, `pin`, `notification_sms`, `notification_email`, `online_banking`,
 `checkbook`)
VALUES (1, '001122334455', 'SAVINGS', '1234', TRUE, TRUE, TRUE, FALSE),
       (1, '003344556677', 'CHECKING', '5678', FALSE, TRUE, TRUE, TRUE),
       (2, '005566778899', 'CHECKING', '9876', FALSE, TRUE, FALSE, FALSE),
       (2, '007788990011', 'SAVINGS', '3456', TRUE, FALSE, TRUE, FALSE),
       (3, '009988776655', 'SAVINGS', '4321', TRUE, FALSE, TRUE, FALSE),
       (4, '002233445566', 'SAVINGS', '1212', TRUE, TRUE, TRUE, FALSE),
       (5, '004455667788', 'CHECKING', '3434', TRUE, TRUE, FALSE, TRUE),
       (6, '006677889900', 'SAVINGS', '5656', FALSE, FALSE, TRUE, FALSE),
       (7, '008899001122', 'SAVINGS', '7878', TRUE, TRUE, TRUE, FALSE),
       (8, '001010121314', 'CHECKING', '9012', FALSE, TRUE, TRUE, TRUE),
       (9, '003131415161', 'SAVINGS', '3456', TRUE, TRUE, FALSE, FALSE),
       (10, '005151617181', 'SAVINGS', '7890', TRUE, TRUE, TRUE, FALSE),
       (10, '007171819202', 'CHECKING', '1234', TRUE, TRUE, TRUE, TRUE),
       (3, '002020303030', 'CHECKING', '7654', TRUE, TRUE, TRUE, FALSE),
       (5, '003030404040', 'SAVINGS', '9876', TRUE, TRUE, TRUE, TRUE);

INSERT INTO `transactions`
(`account_id`, `transfer_account`, `amount`, `type`, `reference`, `description`)
VALUES (1, NULL, 1500.00, 'DEPOSIT', 'Salary Deposit', 'Monthly salary deposit for John Doe.'),
       (2, '005566778899', 200.00, 'TRANSFER', 'Bill Payment', 'Utility bill payment.'),
       (3, NULL, 1000.00, 'DEPOSIT', 'Freelance Work', 'Payment for freelance project work.'),
       (4, NULL, 500.00, 'WITHDRAWAL', 'ATM Withdrawal', 'Cash withdrawal from ATM.'),
       (5, '009988776655', 250.00, 'TRANSFER', 'Transfer to Savings', 'Transfer to Bruce Wayne"s savings account.'),
       (6, NULL, 600.00, 'DEPOSIT', 'Dividend Payment', 'Investment dividend payment.'),
       (7, NULL, 700.00, 'DEPOSIT', 'Investment Income', 'Income from stock market investments.'),
       (8, '001010121314', 100.00, 'TRANSFER', 'Utility Payment', 'Payment of utility bills.'),
       (9, NULL, 800.00, 'DEPOSIT', 'Bonus', 'End-of-year performance bonus.'),
       (10, '005151617181', 200.00, 'TRANSFER', 'Loan Payment', 'Monthly loan repayment.'),
       (11, NULL, 1200.00, 'DEPOSIT', 'Salary', 'Monthly salary deposit for Paul Walker.'),
       (12, NULL, 300.00, 'WITHDRAWAL', 'Cash Withdrawal', 'ATM cash withdrawal for daily expenses.'),
       (13, '003030404040', 400.00, 'TRANSFER', 'Transfer to Bruce', 'Transfer to Bruce Lee"s account.'),
       (14, NULL, 900.00, 'DEPOSIT', 'Consulting Fee', 'Payment for consulting services.'),
       (15, '004455667788', 500.00, 'TRANSFER', 'Transfer to Taylor', 'Transfer to Taylor Swift"s checking account.'),
       (1, NULL, 1000.00, 'DEPOSIT', 'Bonus Payment', 'Performance bonus for the quarter.'),
       (2, NULL, 750.00, 'WITHDRAWAL', 'Car Payment', 'Monthly car loan repayment.'),
       (3, '005566778899', 200.00, 'TRANSFER', 'Gift Payment', 'Gift payment to Alice Smith.'),
       (4, '003344556677', 600.00, 'TRANSFER', 'Bill Payment', 'Payment of various bills.'),
       (5, NULL, 900.00, 'DEPOSIT', 'Performance Bonus', 'Performance-based bonus for the year.'),
       (6, '007788990011', 300.00, 'TRANSFER', 'Loan Repayment', 'Repayment of personal loan.'),
       (7, NULL, 500.00, 'WITHDRAWAL', 'Shopping', 'Funds withdrawn for shopping expenses.'),
       (8, '008899001122', 400.00, 'TRANSFER', 'Transfer to Emma', 'Transfer to Emma Watson"s savings account.'),
       (9, NULL, 1100.00, 'DEPOSIT', 'Contract Work', 'Payment for contract-based work.'),
       (10, '001010121314', 600.00, 'TRANSFER', 'Credit Card Payment', 'Payment towards credit card bill.'),
       (11, NULL, 1000.00, 'DEPOSIT', 'Freelance Payment', 'Freelance payment for project completion.'),
       (12, NULL, 250.00, 'WITHDRAWAL', 'ATM Withdrawal', 'Cash withdrawal for weekend use.'),
       (13, '006677889900', 300.00, 'TRANSFER', 'Payment to Ryan', 'Payment to Ryan Gosling"s account.'),
       (14, NULL, 700.00, 'DEPOSIT', 'Project Payment', 'Income from completed project.'),
       (15, '003344556677', 500.00, 'TRANSFER', 'Savings Transfer', 'Transfer to savings account.'),
       (1, NULL, 1200.00, 'DEPOSIT', 'Salary Deposit', 'Monthly salary deposit for John Doe.'),
       (2, '007171819202', 200.00, 'TRANSFER', 'Bill Payment', 'Monthly utility bill payment.'),
       (3, NULL, 1500.00, 'WITHDRAWAL', 'Car Loan', 'Car loan repayment for the month.'),
       (4, '008899001122', 100.00, 'TRANSFER', 'Phone Bill', 'Payment for mobile phone bill.'),
       (5, NULL, 800.00, 'DEPOSIT', 'Consulting Fee', 'Consulting fee for services rendered.'),
       (6, NULL, 450.00, 'WITHDRAWAL', 'Vacation Expenses', 'Cash withdrawn for vacation expenses.'),
       (7, '001010121314', 600.00, 'TRANSFER', 'Rent Payment', 'Monthly rent payment.'),
       (8, '002233445566', 700.00, 'TRANSFER', 'Investment Transfer', 'Transfer to investment account.'),
       (9, NULL, 1300.00, 'DEPOSIT', 'Project Work', 'Payment for completed project work.'),
       (10, NULL, 200.00, 'WITHDRAWAL', 'ATM Withdrawal', 'Cash withdrawal for daily use.'),
       (11, '005151617181', 300.00, 'TRANSFER', 'Credit Card Bill', 'Payment for credit card bill.'),
       (12, NULL, 500.00, 'DEPOSIT', 'Side Project', 'Income from side project work.'),
       (13, '007171819202', 100.00, 'TRANSFER', 'Bill Payment', 'Payment for utility bill.'),
       (14, NULL, 900.00, 'DEPOSIT', 'Freelance Income', 'Income from freelance work.'),
       (15, '004455667788', 500.00, 'TRANSFER', 'Rent Transfer', 'Monthly rent transfer to landlord.');

-- Queries

-- 1. Get account balance
SELECT `account_id`,
       SUM(
               CASE
                   WHEN `type` = 'DEPOSIT' THEN `amount`
                   WHEN `type` = 'WITHDRAWAL' THEN -`amount`
                   WHEN `type` = 'TRANSFER' THEN -`amount`
                   END
       ) AS `balance`
FROM `transactions`
WHERE `account_id` = 1
GROUP BY `account_id`;
