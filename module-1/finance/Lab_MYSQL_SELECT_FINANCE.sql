USE finance1;

select * 
from client;

select (case  
		when birth_number%10000>1300 then 'F' 
        else 'M'
        end) as gender,
        birth_number,
        birth_number%10000
from client;

select (case when substr(birth_number,3,2)>12 then 'F' else 'M' end) as gender, birth_number
from client;

# Challenge1

select a.district_id, count(a.account_id) as ac_freq
from account a
group by a.district_id
order by ac_freq desc
limit 5;

# Challenge2

select account_id, group_concat(distinct(bank_to)), count(order_id) as diff, group_concat(amount) as rent
from finance1.order
where k_symbol = 'SIPO'
group by account_id
having diff>=2;
;

# Challenge3

select l.account_id as 'Account_ID', l.amount as 'Amount', a.district_id as 'District_ID'
from loan l
left join account a on l.account_id = a.account_id
order by l.amount desc;

# Challenge4

select sum(step1.Amount) as 'Total_Amount', step1.District_ID 
from (select l.account_id as 'Account_ID', l.amount as 'Amount', a.district_id as 'District_ID'
from loan l
left join account a on l.account_id = a.account_id
order by l.amount desc) as step1
group by step1.District_ID
order by Total_Amount desc
;

# Challenge5

select avg(step1.Amount) as 'Total_Amount', step1.District_ID 
from (select l.account_id as 'Account_ID', l.amount as 'Amount', a.district_id as 'District_ID'
from loan l
left join account a on l.account_id = a.account_id
order by l.amount desc) as step1
group by step1.District_ID
order by Total_Amount desc
;

select a.district_id as 'District_ID', l.account_id as 'Account_ID', l.amount as 'Amount'
from loan l
left join account a on l.account_id = a.account_id
order by a.district_id desc, l.amount desc;
;


