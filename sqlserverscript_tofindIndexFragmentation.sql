SELECT DB_NAME(ips.database_id) AS DatabaseName,
       SCHEMA_NAME(ob.[schema_id]) SchemaNames,
       ob.[name] AS ObjectName,
       ix.[name] AS IndexName,
       ob.type_desc AS ObjectType,
       ix.type_desc AS IndexType,
       -- ips.partition_number AS PartitionNumber,
       ips.page_count AS [PageCount], -- Only Available in DETAILED Mode
       ips.record_count AS [RecordCount],
       ips.avg_fragmentation_in_percent AS AvgFragmentationInPercent
-- FROM sys.dm_db_index_physical_stats (NULL, NULL, NULL, NULL, 'DETAILED') ips
FROM sys.dm_db_index_physical_stats (NULL, NULL, NULL, NULL, 'SAMPLED') ips -- QuickResult
INNER JOIN sys.indexes ix ON ips.[object_id] = ix.[object_id] 
                AND ips.index_id = ix.index_id
INNER JOIN sys.objects ob ON ix.[object_id] = ob.[object_id]
WHERE ob.[type] IN('U','V')
AND ob.is_ms_shipped = 0
AND ix.[type] IN(1,2,3,4)
AND ix.is_disabled = 0
AND ix.is_hypothetical = 0
AND ips.alloc_unit_type_desc = 'IN_ROW_DATA'
AND ips.index_level = 0
-- AND ips.page_count >= 1000 -- Filter to check only table with over 1000 pages
-- AND ips.record_count >= 100 -- Filter to check only table with over 1000 rows
-- AND ips.database_id = DB_ID() -- Filter to check only current database
-- AND ips.avg_fragmentation_in_percent > 50 -- Filter to check over 50% indexes
ORDER BY DatabaseName