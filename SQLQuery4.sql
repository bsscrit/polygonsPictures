select dbo.is_visit_first_time(a.visit_id,a.dd,a.h,a.mins,e.doctor_id),
'пациент '+ d.fio +'  к врачу  '+f.fio+' по рекомендации '+e.fio+' ' +
  convert(varchar, a.dd)+' '+cast (a.h as varchar)+':'+cast (a.mins as varchar),
  ' ',
  a.cost_with_discount

   from visits a
 inner join dbo.visits_services b on a.visit_id=b.visit_id
 inner join dbo.status c on c.status_id=a.status_id
 inner join doctors e on e.doctor_id =a.doctor_id
 inner join [dbo].[patients] d on d.patient_id=a.patient_id
 left outer join doctors f on f.doctor_id =a.doctor_id2

 where dbo.is_visit_first_time(a.visit_id,a.dd,a.h,a.mins,e.doctor_id)=3
 group by a.visit_id,d.fio,f.fio,e.fio,a.dd,a.h,a.mins,a.cost_with_discount,e.doctor_id
/*where c.service_done!=Null and a.doctor_id2!=Null;
*/