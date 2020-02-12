--Update statistcs
EXEC dbms_stats.gather_table_stats('OWNER','TABLE',cascade=>TRUE);
--View table statistics
SELECT * FROM dba_tab_statistics WHERE table_name = 'TABLE' and owner = 'OWNER';
