/* sp_help_revlogin script 
** Generated Feb 20 2023  9:39PM on EL-ARISE_SQL1 */
 
 
-- Login: ##MS_PolicyTsqlExecutionLogin##
CREATE LOGIN [##MS_PolicyTsqlExecutionLogin##] WITH PASSWORD = 0x0200F4D3CD7240860541DB60F529F2BF187D2BBD26D7479062592ED6DD27C935935138C4BC0201660A5AEE9F9EB1CF20532383A71114E391B7310F1396A897AB783D53874C3D HASHED, SID = 0xFB5428192C68DE479445435923D3CE58, DEFAULT_DATABASE = [master], CHECK_POLICY = ON, CHECK_EXPIRATION = OFF; ALTER LOGIN [##MS_PolicyTsqlExecutionLogin##] DISABLE
 
-- Login: POSHEM\administrator
CREATE LOGIN [POSHEM\administrator] FROM WINDOWS WITH DEFAULT_DATABASE = [master]
 
-- Login: EL-ARISE_SQL1\Administrator
CREATE LOGIN [EL-ARISE_SQL1\Administrator] FROM WINDOWS WITH DEFAULT_DATABASE = [master]
 
-- Login: NT SERVICE\SQLWriter
CREATE LOGIN [NT SERVICE\SQLWriter] FROM WINDOWS WITH DEFAULT_DATABASE = [master]
 
-- Login: NT SERVICE\Winmgmt
CREATE LOGIN [NT SERVICE\Winmgmt] FROM WINDOWS WITH DEFAULT_DATABASE = [master]
 
-- Login: NT Service\MSSQLSERVER
CREATE LOGIN [NT Service\MSSQLSERVER] FROM WINDOWS WITH DEFAULT_DATABASE = [master]
 
-- Login: NT AUTHORITY\SYSTEM
CREATE LOGIN [NT AUTHORITY\SYSTEM] FROM WINDOWS WITH DEFAULT_DATABASE = [master]
 
-- Login: NT SERVICE\SQLSERVERAGENT
CREATE LOGIN [NT SERVICE\SQLSERVERAGENT] FROM WINDOWS WITH DEFAULT_DATABASE = [master]
 
-- Login: ##MS_PolicyEventProcessingLogin##
CREATE LOGIN [##MS_PolicyEventProcessingLogin##] WITH PASSWORD = 0x02009624F0CA53925C3926ED21F74850BB74DAFA9FB10326C2712EE5F06F2FEC8BB05A47A8784D72874DE11899FAAE603E8A3885EC153AB3C512DAA4EBF8786F2E5EA83B2A95 HASHED, SID = 0xB71D4F51AF41ED47B28F981681617554, DEFAULT_DATABASE = [master], CHECK_POLICY = ON, CHECK_EXPIRATION = OFF; ALTER LOGIN [##MS_PolicyEventProcessingLogin##] DISABLE
 
-- Login: ElCam
CREATE LOGIN [ElCam] WITH PASSWORD = 0x02005CD6AB7CAC7E99B9478C03B18286DA8DEE1E82190939F5B4FDD29CF5905B8D5C2BB0543C8A22A3F0E7A90B4CFB951DE329420D2886A73E1D0F3D715A5FC5A7C7D38008FE HASHED, SID = 0x11CA42FC7AA6F149ABB7C59036A9FE6E, DEFAULT_DATABASE = [master], CHECK_POLICY = ON, CHECK_EXPIRATION = OFF
 
-- Login: POSHEM\She_Vaa
CREATE LOGIN [POSHEM\She_Vaa] FROM WINDOWS WITH DEFAULT_DATABASE = [master]
