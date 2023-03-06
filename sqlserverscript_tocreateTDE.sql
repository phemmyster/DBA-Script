--Create Master Key 
USE master; 
GO 
CREATE MASTER KEY ENCRYPTION BY PASSWORD= 'Password@1.'; 
GO 

--Create Certificate protected by master key 
CREATE CERTIFICATE TDE_Winner_Cert WITH SUBJECT='Database_Encryption'; 
GO 

--Create Database Encryption key 
USE ElRise
GO 
CREATE DATABASE ENCRYPTION KEY WITH ALGORITHM = AES_256 ENCRYPTION BY SERVER CERTIFICATE TDE_Winner_Cert; 
GO 

-- Enable Encryption 
ALTER DATABASE ElRise SET ENCRYPTION ON; 
GO 

---- BACKUP CERTIFICATE 
USE master;  
GO  
BACKUP CERTIFICATE TDE_Winner_Cert
TO FILE = 'C:\sql_backups\tde_bak\ElRise\TDE_CertFile.cer'
WITH PRIVATE KEY (file='C:\sql_backups\tde_bak\ElRise\Key.pvk',
ENCRYPTION BY PASSWORD='Password@1.') 
GO

--Create Master Key 
USE master; 
GO 
CREATE MASTER KEY ENCRYPTION BY PASSWORD= 'Password@1.'; 
GO 

--Restore Certificate 
USE MASTER 
GO 
CREATE CERTIFICATE TDE_Cert FROM FILE = 'C:\temp\TDE_Cert'
 WITH PRIVATE KEY (file= 'C:\temp\TDE_CertKey.pvk', DECRYPTION BY PASSWORD= 'Password@1.');