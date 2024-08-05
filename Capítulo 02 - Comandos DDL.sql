--Criando Tabelas
CREATE TABLE dept      
(deptno      NUMBER(2),
 dname       VARCHAR(14),
 loc         VARCHAR2(13),
 create_date DATE);
DESCRIBE DEPT;
--Alterando estruturas das Tabelas

--1. Adicionando uma nova Coluna
ALTER TABLE DEPT ADD total_sal number(10,2);
DESCRIBE DEPT;
--2. Modificando uma coluna existente 
ALTER TABLE DEPT MODIFY total_sal number(12,2);
DESC DEPT;
--3. Renomeando uma coluna
ALTER TABLE DEPT RENAME COLUMN total_sal TO Total_Salario;
DESC DEPT;
-- 4. Removendo uma coluna
ALTER TABLE DEPT DROP COLUMN Total_Salario;
DESC DEPT;
-------------------------------------------------------------------------
---1. Removendo uma tabela
DROP TABLE DEPT;
DESC DEPT;
--2. Removendo uma tabela sem enviar para lixeira (oracle)
DROP TABLE DEPT PURGE;

--3. Removendo uma tabela com referência de FK
DROP TABLE DEPT CASCADE CONSTRAINTS; 

-- Restaurando uma tabela da lixeira (oracle)
FLASHBACK TABLE DEPT TO BEFORE DROP;
-------------------------------------------------------------------------
-- Constraints

--1 - Constraint NOT NULL
CREATE TABLE employees(
    employee_id      NUMBER(6),
    last_name        VARCHAR2(25) NOT NULL,
    email            VARCHAR2(25) NOT NULL,
    salary           NUMBER(8,2),
    commission_pct   NUMBER(2,2),
    hire_date        DATE NOT NULL);
DESC EMPLOYEES;
--2- Constraint UNIQUE
DROP TABLE employees;

CREATE TABLE employees(
    employee_id      NUMBER(6),
    last_name        VARCHAR2(25) CONSTRAINT EMP_LAST_NAME_NN NOT NULL,
    email            VARCHAR2(25) UNIQUE ,
    salary           NUMBER(8,2),
    commission_pct   NUMBER(2,2),
    hire_date        DATE         CONSTRAINT EMP_HIRE_DATE_NN NOT NULL);

--3- Constraint PRIMARY KEY
DROP TABLE employees;

CREATE TABLE employees(
  employee_id   NUMBER(6)    CONSTRAINT emp_emp_id_pk     PRIMARY KEY,
  first_name    VARCHAR2(20) CONSTRAINT emp_first_name_nn NOT NULL,
  email         VARCHAR(100) CONSTRAINT emp_email_uk      UNIQUE 
                             CONSTRAINT emp_email_nn      NOT NULL,
  department_id NUMBER(6)    CONSTRAINT emp_dept_id_nn    NOT NULL);

--4- Constraint FOREIGN KEY
CREATE TABLE departments
( department_id   NUMBER(6)  CONSTRAINT dept_department_id PRIMARY KEY,
  department_name VARCHAR(50) NOT NULL);

ALTER TABLE employees
ADD CONSTRAINT emp_dept_fk
FOREIGN KEY (department_id)
REFERENCES departments (department_id); 

--5- Constraint CHECK KEY
DROP TABLE employees;

CREATE TABLE employees(
    employee_id      NUMBER(6),
    last_name        VARCHAR2(25) NOT NULL,
    email            VARCHAR2(25) CONSTRAINT emp_email_uk UNIQUE ,
    salary           NUMBER(8,2)  CONSTRAINT emp_salary_min CHECK (salary > 0),
    commission_pct   NUMBER(2,2),
    hire_date        DATE NOT NULL);

-- CREATE TABLE com todas as constraints
DROP TABLE employees PURGE;

CREATE TABLE employees
( employee_id    NUMBER(6)    CONSTRAINT emp_employee_id  PRIMARY KEY,
  first_name     VARCHAR2(20),
  last_name      VARCHAR2(25) CONSTRAINT emp_last_name_nn NOT NULL,
  email          VARCHAR2(25) CONSTRAINT emp_email_nn     NOT NULL
                              CONSTRAINT emp_email_uk     UNIQUE,
  phone_number   VARCHAR2(20),
  hire_date      DATE         CONSTRAINT emp_hire_date_nn NOT NULL,
  job_id         VARCHAR2(10) CONSTRAINT emp_job_id_nn    NOT NULL,
  salary         NUMBER(8,2)  CONSTRAINT emp_salary_ck    CHECK (salary>0),
  commission_pct NUMBER(2,2),
  manager_id     NUMBER(6),
  department_id  NUMBER(4));





