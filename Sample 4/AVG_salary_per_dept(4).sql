DROP PROCEDURE IF EXISTS average_dept_salary;

DELIMITER $$

CREATE PROCEDURE average_dept_salary(IN low FLOAT, IN high FLOAT)

BEGIN
	SELECT e.gender, d.dept_name, AVG(s.salary) as avg_salary
    FROM t_employees e
    JOIN t_salaries s ON s.emp_no = e.emp_no
    JOIN t_dept_emp de on de.emp_no = s.emp_no
    JOIN t_departments d on d.dept_no = de.dept_no
    WHERE s.salary BETWEEN low AND high
    GROUP BY d.dept_no, e.gender
    ;
END$$

DELIMITER ;

CALL average_dept_salary(50000, 90000)