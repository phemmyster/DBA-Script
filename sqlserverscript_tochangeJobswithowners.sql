USE msdb ;
GO
EXEC dbo.sp_manage_jobs_by_login
@action = N'REASSIGN',
@current_owner_login_name = N'Poshem\Administrator',
@new_owner_login_name = N'sa';
GO