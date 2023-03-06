
SELECT [schema_name] = s.name, table_name = o.name,
MAX(i1.type_desc) ClusteredIndexorHeap,
MAX(COALESCE(I2.NonClusteredIndex,0)) NonClusteredIndex,
MAX(COALESCE(I4.NC_ColumnStoreIndex,0)) NC_ColumnStoreIndex,
MAX(COALESCE(I3.OtherIndex,0)) OtherIndex
FROM sys.objects o
INNER JOIN sys.schemas s ON o.[schema_id] = s.[schema_id]
LEFT JOIN sys.indexes i1 ON o.OBJECT_ID = i1.OBJECT_ID AND i1.TYPE IN (0,1,5)
LEFT JOIN (SELECT object_id,COUNT(Index_id) NonClusteredIndex
FROM sys.indexes
WHERE type = 2
GROUP BY object_id) I2
ON o.OBJECT_ID = i2.OBJECT_ID
LEFT JOIN (SELECT object_id,COUNT(Index_id) OtherIndex
FROM sys.indexes
WHERE type IN (3,4,7)
GROUP BY object_id) I3
ON o.OBJECT_ID = i3.OBJECT_ID
LEFT JOIN (SELECT object_id,COUNT(Index_id) NC_ColumnStoreIndex
FROM sys.indexes
WHERE type = 6
GROUP BY object_id) I4
ON o.OBJECT_ID = i4.OBJECT_ID
WHERE o.TYPE IN ('U')
GROUP BY s.name, o.name
ORDER BY schema_name, table_name