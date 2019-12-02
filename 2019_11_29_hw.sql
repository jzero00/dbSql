--join 8

SELECT regions.region_id, regions.region_name, countries.country_name
FROM regions, countries
WHERE regions.region_id = countries.region_id
AND regions.region_id = 1;


--join9
--(row 9 -France, Denmark, Belgium 3개 국가에 속하는 locations 정보는 미존재
-- 나머지 5개 중에 다수의 locations 정보를 갖고 있는 국가가 존재한다.

SELECT regions.region_id, regions.region_name, countries.country_name , locations.city
FROM regions, countries, locations
WHERE regions.region_id = countries.region_id
AND countries.country_id = locations.country_id
AND regions.region_id = 1;

--join10
SELECT  regions.region_id, regions.region_name, countries.country_name,
        locations.city, departments.department_name
FROM regions, countries, locations, departments
WHERE regions.region_id = countries.region_id
AND countries.country_id = locations.country_id
AND locations.location_id = departments.location_id
AND regions.region_id = 1;

--join11
SELECT  regions.region_id, regions.region_name, countries.country_name,
        locations.city, departments.department_name,
        (employees.first_name || employees.last_name) name
FROM regions, countries, locations, departments, employees
WHERE regions.region_id = countries.region_id
AND countries.country_id = locations.country_id
AND locations.location_id = departments.location_id
AND departments.department_id = employees.department_id
AND regions.region_id = 1;

--join12
SELECT  employees.employee_id, (employees.first_name || employees.last_name) name,
        jobs.job_id, jobs.job_title
FROM employees, jobs
WHERE employees.job_id = jobs.job_id;

--join13
SELECT  b.manager_id,
                (b.first_name || b.last_name) mgr_name,
                a.employee_id,
               (a.first_name || a.last_name) name,
               jobs.job_id, jobs.job_title
FROM employees a, employees b, jobs
WHERE a.manager_id = b.employee_id;
