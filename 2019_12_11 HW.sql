CREATE TABLE regions (
        region_id NUMBER,
        region_name VARCHAR2(25),
        CONSTRAINT pk_regions PRIMARY KEY (region_id)
    );
 
CREATE TABLE countries (
        country_id CHAR (2) CONSTRAINT  pk_countries PRIMARY KEY,
        country_name VARCHAR2(40),
        region_id NUMBER,
        CONSTRAINT fk_countries_regions_region_id FOREIGN KEY (region_id) REFERENCES regions (region_id)
    );
   
CREATE TABLE locations (
        location_id NUMBER(4) CONSTRAINT pk_locations PRIMARY KEY,
        street_address VARCHAR2(40),
        postal_code VARCHAR2(12),
        city VARCHAR2(30) NOT NULL,
        state_province VARCHAR2(25),
        country_id CHAR(2),
        CONSTRAINT  fk_loc_cou_country_id FOREIGN KEY (country_id) REFERENCES countries (country_id)
);

CREATE TABLE jobs (
        job_id VARCHAR2(10) PRIMARY KEY,
        job_title VARCHAR2(35) NOT NULL,
        min_salary NUMBER(6),
        max_salary NUMBER (6)
);

CREATE TABLE job_history (
        employee_id NUMBER(6), 
        start_date DATE,
        end_date DATE NOT NULL,
        job_id VARCHAR2(10) NOT NULL,
        CONSTRAINT pk_job_history PRIMARY KEY (employee_id, start_date),
        CONSTRAINT fk_job_his_jobs FOREIGN KEY (job_id) REFERENCES jobs (job_id)
);

---여기까지 완료★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆

CREATE TABLE employees(
        employee_id NUMBER(6) CONSTRAINT pk_employees PRIMARY KEY,
        first_name VARCHAR2(20),
        last_name VARCHAR2(25) NOT NULL,
        email VARCHAR2(25) NOT NULL,
        phone_number VARCHAR2(20),
        hiredate DATE NOT NULL,
        job_id VARCHAR2(10) NOT NULL,
        salary NUMBER (8,2),
        commission_pct NUMBER (8,2),
        manager_id NUMBER(6),
       department_id NUMBER(4),
       CONSTRAINT fk_emp_job_job_id FOREIGN KEY (job_id) REFERENCES jobs (job_id)
);

CREATE TABLE department(
        department_id NUMBER(4) CONSTRAINT pk_department PRIMARY KEY,
        department_name VARCHAR2(30) NOT NULL,
        manager_id NUMBER(6),
        location_id NUMBER(4),
        CONSTRAINT fk_dep_loc_loc_id FOREIGN KEY (location_id) REFERENCES locations (location_id)
        );

--ALTER 
        ALTER TABLE department ADD CONSTRAINT fk_dep_department FOREIGN KEY (employee_id) REFERENCES employees (employee_id);
        ALTER TABLE department ADD CONSTRAINT fk_emp_dep_dep_id FOREIGN KEY (department_id) REFERENCES department (department_id);