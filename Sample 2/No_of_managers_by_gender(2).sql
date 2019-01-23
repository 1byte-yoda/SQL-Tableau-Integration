SELECT 
    d.dept_name,
    e.gender,
    e.emp_no,
    dm.from_date,
    dm.to_date,
    ee.calendar_year,
    CASE
		WHEN (ee.calendar_year >= YEAR(dm.from_date) 
			 AND ee.calendar_year <= YEAR(dm.to_date)) THEN 1
        ELSE 0
    END as active
FROM
    (SELECT 
        YEAR(from_date) AS calendar_year
    FROM
        t_dept_manager) AS ee
        CROSS JOIN
    t_departments d
        JOIN
    t_dept_manager dm ON d.dept_no = dm.dept_no
        JOIN
    t_employees e ON dm.emp_no = e.emp_no
    GROUP BY calendar_year, e.emp_no
ORDER BY e.emp_no, calendar_year