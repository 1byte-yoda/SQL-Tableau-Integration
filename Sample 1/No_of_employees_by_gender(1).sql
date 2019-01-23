SELECT 
    e.gender,
    YEAR(de.from_date) AS calendar_year,
    COUNT(gender) AS num_of_employees
FROM
    t_employees e
        JOIN
    t_dept_emp de ON e.emp_no = de.emp_no
GROUP BY e.gender , calendar_year
HAVING calendar_year >= '1990'
ORDER BY calendar_year;