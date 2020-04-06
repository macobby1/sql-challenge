-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/9hk1fh
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


CREATE TABLE employee (
    emp_no int   NOT NULL,
    birth_date date   NOT NULL,
    first_name varchar   NOT NULL,
    last_name varchar   NOT NULL,
    gender varchar   NOT NULL,
    hire_date date   NOT NULL,
    CONSTRAINT pk_employee PRIMARY KEY (
        emp_no
     )
);

select * from employee;

CREATE TABLE employeedepartment (
    emp_no int   NOT NULL,
    dept_no varchar   NOT NULL,
    from_date date   NOT NULL,
    to_date date   NOT NULL
);

select * from employeedepartment;

CREATE TABLE departmentmanager (
    dept_no varchar   NOT NULL,
    emp_no int   NOT NULL,
    from_date date   NOT NULL,
    to_date date   NOT NULL
);

select * from departmentmanager;

CREATE TABLE departments (
    dept_no varchar   NOT NULL,
    dept_name varchar   NOT NULL,
    CONSTRAINT pk_departments PRIMARY KEY (
        dept_no
     )
);

select * from departments;

CREATE TABLE salary (
    emp_no int   NOT NULL,
    salary money   NOT NULL,
    from_date date   NOT NULL,
    to_date date   NOT NULL
);

select * from salary;

CREATE TABLE titles (
    emp_no int   NOT NULL,
    title varchar   NOT NULL,
    from_date date   NOT NULL,
    to_date date   NOT NULL
);

select * from titles;

ALTER TABLE employeedepartment ADD CONSTRAINT fk_employeedepartment_emp_no FOREIGN KEY(emp_no)
REFERENCES employee (emp_no);

ALTER TABLE employeedepartment ADD CONSTRAINT fk_employeedepartment_dept_no FOREIGN KEY(dept_no)
REFERENCES departments (dept_no);

ALTER TABLE departmentmanager ADD CONSTRAINT fk_departmentmanager_dept_no FOREIGN KEY(dept_no)
REFERENCES departments (dept_no);

ALTER TABLE departmentmanager ADD CONSTRAINT fk_departmentmanager_emp_no FOREIGN KEY(emp_no)
REFERENCES employee (emp_no);

ALTER TABLE salary ADD CONSTRAINT fk_salary_emp_no FOREIGN KEY(emp_no)
REFERENCES employee (emp_no);

ALTER TABLE titles ADD CONSTRAINT fk_titles_emp_no FOREIGN KEY(emp_no)
REFERENCES employee (emp_no);

