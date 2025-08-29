create database school;
use school;

 -- Enrollemt data 2024/2025
CREATE TABLE enrollment (
  countycode    VARCHAR(8),
  countyname    VARCHAR(100),
  districtcode  VARCHAR(16),
  districtname  VARCHAR(255),
  schoolcode    VARCHAR(16),
  schoolname    VARCHAR(255),
  grade_5 INT, grade_6 INT, grade_7 INT, grade_8 INT
);

-- Directory of Schools
CREATE TABLE directory_schools (
  countycode    VARCHAR(8),
  countyname    VARCHAR(100),
  districtcode  VARCHAR(16),
  districtname  VARCHAR(255),
  schoolcode    VARCHAR(16),
  schoolname    VARCHAR(255)
);

-- Title 1 allocation districts
CREATE TABLE title1_districts (
  leaid            VARCHAR(16),
  districtname     VARCHAR(255),
  title1allocation INT
);


ALTER TABLE title1_districts
  MODIFY COLUMN title1allocation VARCHAR(128);

DESC title1_districts;

-- Replacing the comma spearated in between numbers  
SET SQL_SAFE_UPDATES = 0;
UPDATE title1_districts
SET title1allocation = REPLACE(REPLACE(REPLACE(title1allocation, ',', ''), '$', ''), ' ' ,'');
SET SQL_SAFE_UPDATES = 1;  

ALTER TABLE title1_districts
  MODIFY COLUMN title1allocation BIGINT;

SELECT * FROM enrollment LIMIT 10;
SELECT * FROM directory_schools;
SELECT * FROM title1_districts;

SELECT districtname
FROM enrollment
WHERE districtname LIKE ' %' OR districtname LIKE '% ';

SELECT DISTINCT districtname
FROM title1_districts
ORDER BY districtname;

SELECT DISTINCT districtname
FROM enrollment
ORDER BY districtname;

CREATE OR REPLACE VIEW v_title1_enrollment AS
SELECT
  d.countyname,
  d.districtname,
  d.schoolname,
  (e.grade_5 + e.grade_6 + e.grade_7 + e.grade_8) AS total_5_8,
  t.title1allocation
FROM enrollment e
JOIN directory_schools d
  ON e.countycode=d.countycode AND e.districtcode=d.districtcode AND e.schoolcode=d.schoolcode
JOIN title1_districts t
  ON UPPER(TRIM(d.districtname)) LIKE CONCAT('%', UPPER(TRIM(t.districtname)), '%')
WHERE t.title1allocation > 0;
SELECT * FROM v_title1_enrollment;
SELECT countyname, SUM(total_5_8) AS total_students_5_8
FROM v_title1_enrollment
GROUP BY countyname
ORDER BY total_students_5_8 DESC;

SELECT districtname, schoolname, total_5_8
FROM v_title1_enrollment
ORDER BY districtname ASC, total_5_8 DESC, schoolname ASC;

SELECT countyname,
       SUM(total_5_8) AS total_students_5_8
FROM v_title1_enrollment
GROUP BY countyname
ORDER BY total_students_5_8 DESC;

