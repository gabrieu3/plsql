 --select * from v$parameter v where v.NAME = 'open_cursors'
select sn.NAME, se.VALUE, sn.*
  from v$session ss, v$sesstat se, v$statname sn
 where se.STATISTIC# = sn.STATISTIC#
   and NAME LIKE 'opened cursors%'
   and se.SID = ss.SID
 order by VALUE desc
 
