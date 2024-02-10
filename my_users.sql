DROP USER
IF EXISTS 'admin_001'@'%';

SELECT 'ADDING USER admin_001' AS 'INSTALLATION PROGRESSING';

CREATE USER
IF NOT EXISTS 'admin_001'@'%'
IDENTIFIED BY 'guttmanGrizzlies_2024'
WITH
MAX_QUERIES_PER_HOUR 20
MAX_UPDATES_PER_HOUR 10
MAX_CONNECTIONS_PER_HOUR 5
MAX_USER_CONNECTIONS 2

FAILED_LOGIN_ATTEMPTS 4
PASSWORD_LOCK_TIME UNBOUNDED
PASSWORD EXPIRE INTERVAL 90 DAY
PASSWORD HISTORY 5
PASSWORD REUSE INTERVAL 365 DAY;
REVOKE ALL, GRANT OPTION FROM 'admin_001'@'%';

SELECT user, show_db_priv, account_locked
FROM mysql.user;

FLUSH PRIVILEGES;

SELECT user, show_db_priv, account_locked
FROM mysql.user;

DROP ROLE
IF EXISTS 'read_only_classicmodels_db'@'%';

SELECT user, show_db_priv, account_locked
FROM mysql.user;

CREATE ROLE
IF NOT EXISTS
'read_only_classicmodels_db', 'admin_user',
'read_only_employees_db', 'app_user';

SELECT user, show_db_priv, account_locked
FROM mysql.user;
