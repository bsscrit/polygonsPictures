select 
'пациент '+ d.fio +'  к врачу  '+f.fio+' по рекомендации '+e.fio+' ' +
  convert(varchar, a.dd)+' '+cast (a.h as varchar)+':'+cast (a.mins as varchar),
 case when (
   (select COUNT(vis.visit_id) from visits vis where vis.patient_id=a.patient_id and vis.dd<a.dd ))>0
   then 
   'ошибка'
   else
   '' end [Примечание]
   ,
   (select COUNT(vis.visit_id) from visits vis where vis.patient_id=a.patient_id and vis.dd<a.dd)  [Оказано услуг],
  sum(a.cost_with_discount),

   case when (
   (select COUNT(vis.visit_id) from visits vis where vis.patient_id=a.patient_id and vis.dd<a.dd ))=0
   then 
   case when (
   select count(va.visit_id)
   from visits va inner join doctors vb on va.doctor_id=vb.doctor_id 
   inner join doctors_professions vc on vc.profession_id=vb.profession_id
   where vc.profession_name like '%маникюр%'
   and va.visit_id=a.visit_id
    )>0
	then
	cast(max(a.cost_with_discount)/100*5 as money)
	else
   cast(sum(a.cost_with_discount)/100*5 as money) end
   else
   '' end [Премия]
   from visits a
 inner join dbo.visits_services b on a.visit_id=b.visit_id
 inner join dbo.status c on c.status_id=a.status_id
 inner join doctors e on e.doctor_id =a.doctor_id
 inner join [dbo].[patients] d on d.patient_id=a.patient_id
 inner join doctors f on f.doctor_id =a.doctor_id2

 --where dbo.is_visit_first_time(a.visit_id,a.dd,a.h,a.mins,e.doctor_id)=3
 --where a.Data between @d1 and @d2


 group by a.visit_id,d.fio,f.fio,e.fio,a.dd,a.h,a.mins,a.cost_with_discount,e.doctor_id,a.patient_id

    order by d.fio,a.dd desc



--union all
select ' ', d.fio, ' ' , sum(a.cost_with_discount)


   from visits a
 inner join dbo.visits_services b on a.visit_id=b.visit_id
 inner join dbo.status c on c.status_id=a.status_id
 inner join doctors e on e.doctor_id =a.doctor_id
 inner join [dbo].[patients] d on d.patient_id=a.patient_id
 inner join doctors f on f.doctor_id =a.doctor_id2
 group by a.visit_id,d.fio,f.fio,e.fio,a.dd,a.h,a.mins,a.cost_with_discount,e.doctor_id

