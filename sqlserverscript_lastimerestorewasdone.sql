SELECT
[d].[name] AS [Database],
[d].[create_date],
[d].[compatibility_level],
rh.restore_date,
rh.restore_history_id,
rh.restore_type
FROM master.sys.databases d
LEFT OUTER JOIN msdb.dbo.[restorehistory] rh
ON rh.[destination_database_name] = d.Name
ORDER BY [Database], restore_history_id