use publications;
# Challenge1
select a.au_id AS 'AUTHOR ID', a.au_lname AS 'LAST NAME', a.au_fname AS 'FIRST NAME', t.title AS 'TITLE', p.pub_name as 'PUBLISHERS'
from authors a
inner join titleauthor ta on a.au_id = ta.au_id
inner join titles t on ta.title_id = t.title_id
inner join publishers p on t.pub_id = p.pub_id ;

;

# Challenge2
select a.au_id AS AUTHOR_ID, a.au_lname AS LAST_NAME, a.au_fname AS FIRST_NAME, p.pub_name as PUBLISHERS, count(t.title) AS TITLE_COUNT
from authors a
inner join titleauthor ta on a.au_id = ta.au_id
inner join titles t on ta.title_id = t.title_id
inner join publishers p on t.pub_id = p.pub_id 
group by AUTHOR_ID, LAST_NAME, FIRST_NAME, PUBLISHERS;

;

# Challenge 3 
select a.au_id as 'AUTHOR_ID', a.au_lname AS 'LAST_NAME', a.au_fname AS 'FIRST_NAME', sum(s.qty) as 'TOTAL'
from authors a
inner join titleauthor t on a.au_id = t.au_id
inner join sales s on t.title_id = s.title_id
group by AUTHOR_ID, LAST_NAME, FIRST_NAME 
order by TOTAL desc
limit 3;

# Challenge 4
select a.au_id as 'AUTHOR_ID', a.au_lname AS 'LAST_NAME', a.au_fname AS 'FIRST_NAME', IFNULL(sum(s.qty),0) as 'TOTAL'
from authors a
left join titleauthor t on a.au_id = t.au_id
left join sales s on t.title_id = s.title_id
group by AUTHOR_ID, LAST_NAME, FIRST_NAME 
order by TOTAL desc ;

