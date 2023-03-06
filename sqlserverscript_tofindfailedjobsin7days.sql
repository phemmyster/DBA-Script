SELECT @@SERVERNAME,
j.name 'Job',
js.step_name,
jh.sql_severity,
jh.message,
msdb.dbo.agent_datetime(jh.run_date, jh.run_time) RunTime
FROM msdb.dbo.sysjobs AS j
INNER JOIN msdb.dbo.sysjobsteps AS js ON js.job_id = j.job_id
INNER JOIN msdb.dbo.sysjobhistory AS jh ON jh.job_id = j.job_id
WHERE jh.run_status = 0
AND msdb.dbo.agent_datetime(jh.run_date, jh.run_time) > GETDATE() - 7
ORDER BY msdb.dbo.agent_datetime(jh.run_date, jh.run_time) DESC;
