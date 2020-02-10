select vitima.sid              sid_vitima
      ,vitima.osuser           osuser_vitima
      ,vitima.event            event_vitima
      ,vitima.state            state_vitima
      ,vitima.blocking_session sid_vilao
      ,vilao.serial#           serial_vilao
      ,vilao.osuser            osuser_vilao
      ,vilao.state             state_vilao
  from gv$session vilao
      ,gv$session vitima
 where vilao.sid = vitima.blocking_session
   and vitima.status = 'ACTIVE'
   and vitima.blocking_session is not null;
