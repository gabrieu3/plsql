select s.sid,
       s.serial#,
       'EXEC P_MATA_SESSAO('||s.sid||','||s.serial#||');' kill_,
       s.username "ORACLE_USER",
       s.osuser "OS_USER",
       (select sql_text
          from v$sql
         where address = sql_address
           and rownum = 1) sql_text,
       s.program,
       p.spid "PID UNIX",
       substr(s.machine, instr(s.machine, '\', 1, 1), length(s.machine)) machine,
       decode(s.command, 3, 'SELECT', 2, 'INSERT', 6, 'UPDATE', 7, 'DELETE', 47, 'PL/SQL', -86, 'CALL OBJECT', s.command) cmd,
       round((sysdate - logon_time) * 1440) min_logon,
       to_char(sysdate - last_call_et / 24 / 60 / 60, 'hh24:mi:ss') inic_exe,
       trunc(last_call_et / 60) || ' mins, ' || mod(last_call_et, 60) ||
       ' secs' duracao,
       (select sql_text
          from v$sql
         where address = sql_address
           and rownum = 1) sql_text
  from v$session s, v$process p
 where s.paddr = p.addr
   and s.status = 'ACTIVE'
   and s.username is not null
   and s.username not in ('SYS', 'SYSMAN', 'DBSNMP')
   and audsid != userenv('sessionid')
 order by inic_exe;
