select * from info;

select user_pw
from info;

update info set user_pw = 'd404559f602eab6fd602ac7680dacbfaadd13630335e951f097af3900e9de176b6db28512f2e000b9d04fba5133e8b1c6e8df59db3a8ab9d60be4b97cc9e81db'
where user_pw = 'D404559F602EAB6FD602AC7680DACBFAADD13630335E951F097AF3900E9DE176B6DB28512F2E000B9D04FBA5133E8B1C6E8DF59DB3A8AB9D60BE4B97CC9E81DB';


select * from ranking;

insert into 

select * from FILED_2;

select best_record from info;

select I.user_id, R.best_record
from info I join ranking R
on I.user_id = 'test' and I.user_pw = 'd404559f602eab6fd602ac7680dacbfaadd13630335e951f097af3900e9de176b6db28512f2e000b9d04fba5133e8b1c6e8df59db3a8ab9d60be4b97cc9e81db';

select * from info;

select * from Ranking;

select col_f, row_f from filed_2 where evt =1;

sql.append("select i.user_id, r.best_record"); //띄어쓰기 잘했는지 보세요.
	sql.append(" from info i inner join ranking r");
	sql.append(" on user_id = ? and user_pw = ?"
	
select i.user_id, r.best_record 
from info i inner join ranking r 
on i.user_id='test' and i.user_pw='d404559f602eab6fd602ac7680dacbfaadd13630335e951f097af3900e9de176b6db28512f2e000b9d04fba5133e8b1c6e8df59db3a8ab9d60be4b97cc9e81db';


select user_id,best_record
from info
where user_id = 'test1' and user_pw = 'd404559f602eab6fd602ac7680dacbfaadd13630335e951f097af3900e9de176b6db28512f2e000b9d04fba5133e8b1c6e8df59db3a8ab9d60be4b97cc9e81db';