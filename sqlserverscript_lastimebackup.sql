SELECT  

   CONVERT(CHAR(100), SERVERPROPERTY('Servername')) AS Server, 

      msdb.dbo.backupset.database_name,  

	     MAX(msdb.dbo.backupset.backup_finish_date) AS last_db_backup_date 

		 FROM 

		    msdb.dbo.backupmediafamily  

			   INNER JOIN msdb.dbo.backupset ON msdb.dbo.backupmediafamily.media_set_id = msdb.dbo.backupset.media_set_id  

			   WHERE msdb..backupset.type = 'D' 

			   GROUP BY 

			      msdb.dbo.backupset.database_name  

				  ORDER BY  

				     msdb.dbo.backupset.database_name 