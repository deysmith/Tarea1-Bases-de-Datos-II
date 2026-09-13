-- Ver cómo se llaman los archivos que están dentro del backup.
RESTORE FILELISTONLY
FROM DISK = '/var/opt/mssql/backup/AdventureWorks2025.bak';

-- Restuarar la bd desde el backup que está en Ubuntu, almacenado
-- el archivo .mdf y .ldf en /var/opt/mssql/data/
RESTORE DATABASE AdventureWorks2025
FROM DISK = '/var/opt/mssql/backup/AdventureWorks2025.bak'
WITH
	MOVE 'AdventureWorks'
		TO '/var/opt/mssql/data/AdventureWorks2025.mdf',
	MOVE 'AdventureWorks_log'
		TO '/var/opt/mssql/data/AdventureWorks2025_log.ldf',
	RECOVERY,
	STATS = 10;

USE AdventureWorks2025;
SELECT name FROM sys.tables