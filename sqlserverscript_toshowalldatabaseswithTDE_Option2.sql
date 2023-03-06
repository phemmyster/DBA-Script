use master;
go

select
    database_name = d.name,
    dek.encryptor_type,
    cert_name = c.name
from sys.dm_database_encryption_keys dek
left join sys.certificates c
on dek.encryptor_thumbprint = c.thumbprint
inner join sys.databases d
on dek.database_id = d.database_id;