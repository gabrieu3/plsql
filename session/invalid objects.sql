select 'TOTAL INVÁLIDO: ',to_char(count(1)),null  
 from all_objects a 
where a.owner = 'DBAUNIMED' 
  and a.status = 'INVALID'
union
select a.object_name, 
       a.object_type, 
       a.timestamp
from all_objects a 
where a.owner = 'DBAUNIMED' 
  and a.status = 'INVALID'
order by 2,1  
