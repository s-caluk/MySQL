USE SYS;
CREATE TABLE Worker (
	WORKER_ID INT PRIMARY KEY ,
	FIRST_NAME CHAR(25),
	LAST_NAME CHAR(25),
	SALARY INT(15),
	JOINING_DATE DATETIME,
	DEPARTMENT CHAR(25)
);

INSERT INTO Worker 
	(WORKER_ID, FIRST_NAME, LAST_NAME, SALARY, JOINING_DATE, DEPARTMENT) VALUES
		(001, 'Monika', 'Arora', 100000, '14-02-20 09.00.00', 'HR'),
		(002, 'Niharika', 'Verma', 80000, '14-06-11 09.00.00', 'Admin'),
		(003, 'Vishal', 'Singhal', 300000, '14-02-20 09.00.00', 'HR'),
		(004, 'Amitabh', 'Singh', 500000, '14-02-20 09.00.00', 'Admin'),
		(005, 'Vivek', 'Bhati', 500000, '14-06-11 09.00.00', 'Admin'),
		(006, 'Vipul', 'Diwan', 200000, '14-06-11 09.00.00', 'Account'),
		(007, 'Satish', 'Kumar', 75000, '14-01-20 09.00.00', 'Account'),
		(008, 'Geetika', 'Chauhan', 90000, '14-04-11 09.00.00', 'Admin');

CREATE TABLE Bonus (
	WORKER_REF_ID INT,
	BONUS_AMOUNT INT(10),
	BONUS_DATE DATETIME,
	FOREIGN KEY (WORKER_REF_ID)
		REFERENCES Worker(WORKER_ID)
        ON DELETE CASCADE
);

INSERT INTO Bonus 
	(WORKER_REF_ID, BONUS_AMOUNT, BONUS_DATE) VALUES
		(001, 5000, '16-02-20'),
		(002, 3000, '16-06-11'),
		(003, 4000, '16-02-20'),
		(001, 4500, '16-02-20'),
		(002, 3500, '16-06-11');
CREATE TABLE Title (
	WORKER_REF_ID INT,
	WORKER_TITLE CHAR(25),
	AFFECTED_FROM DATETIME,
	FOREIGN KEY (WORKER_REF_ID)
		REFERENCES Worker(WORKER_ID)
        ON DELETE CASCADE
);

INSERT INTO Title 
	(WORKER_REF_ID, WORKER_TITLE, AFFECTED_FROM) VALUES
 (001, 'Manager', '2016-02-20 00:00:00'),
 (002, 'Executive', '2016-06-11 00:00:00'),
 (008, 'Executive', '2016-06-11 00:00:00'),
 (005, 'Manager', '2016-06-11 00:00:00'),
 (004, 'Asst. Manager', '2016-06-11 00:00:00'),
 (007, 'Executive', '2016-06-11 00:00:00'),
 (006, 'Lead', '2016-06-11 00:00:00'),
 (003, 'Lead', '2016-06-11 00:00:00');
 
 SELECT * FROM WORKER;
 SELECT * FROM BONUS;
 SELECT * FROM TITLE;
 
 
 
 -- Q-12. Write an SQL query to print all Worker details from the Worker table
 -- order by FIRST_NAME Ascending
 -- and DEPARTMENT Descending.
 select * 
 from worker
 order by (FIRST_NAME) asc, (DEPARTMENT) desc;
  
 -- Q-13. Write an SQL query to print details for Workers with the first name as “Vipul” and “Satish” 
 -- from Worker table.
 
 select *
 from worker
 where FIRST_NAME in ('Vipul','Satish');
 
 -- Q-16. Write an SQL query to print details of the Workers whose FIRST_NAME contains ‘a’.
 
 select *
 from worker
 where FIRST_NAME like '%a%';
  
 -- Q-18. Write an SQL query to print details of the Workers whose 
 -- FIRST_NAME ends with ‘h’ and contains six alphabets.
 
 select *
 from worker
 where first_name like  '_____h';
 
  
 -- Q-20. Write an SQL query to print details of the Workers who have joined in Feb’2014.
 
 select *
 from worker
 where JOINING_DATE like '2014-02%';
 
 
 
 -- Q-22. Write an SQL query to fetch worker names with salaries >= 50000 and <= 100000.
 -- maasa gore en yuksek maastan itibaren olacak sekilde yazdirin.
 
 select first_name, last_name, salary
 from worker
 where salary between 50000 and 100000
 order by salary  desc ;
 
  
 
 
 -- Q-26. Write an SQL query to show only odd rows from a table.;
 
 select * 
 from worker
 where mod (worker_id,2) <> 0;
 
  
 -- Q-27. Write an SQL query to show only even rows from a table.

  select * 
 from worker
 where mod (worker_id,2) = 0;
 
 
 -- personel ismi ve tolam aldigi bonus miktarini yazdir.
 
 select first_name,(select sum(bonus_amount)
					from bonus
                    where worker.worker_id= bonus.worker_ref_id) as toplam_bonus
 from worker;
 
 
 -- bonus alanlara gore kisilerin unvanlari yazdirin
 select bonus_amount ,(select  worker_title
							from title
							where  bonus.worker_ref_id=title.worker_ref_id) as unvan
from bonus;                        
 
 
 -- worker id 'si 5'den buyuk olan isclierin maaslarini ve worker_title listeleyiniz
 
 select worker_id,salary ,(select worker_title 
				from title
                where  worker.worker_id=title.worker_ref_id) as unvan
from worker
where worker_id>5
order by salary desc;                
 
 

-- gorevi yeri account olan isciniin  id, ismi ,soysimi, worker_title  ve katilim tarihini


select worker_id, first_name, last_name, joining_date,(select worker_title 
												from title
                                                where worker.worker_id=title.worker_ref_id) as unvan
from worker
where department='account';                                                



 
-- Monika isimli personelin calistigi sirketin department ve unvanini ve varsa bonus miktarini yazdirin

select first_name,department,(select worker_title 
							 from title
							 where  worker.worker_id=title.worker_ref_id) as unvan,
                             (select sum(bonus_amount)
                             from bonus
                             where worker.worker_id=bonus.worker_ref_id
                             group by worker_ref_id) as total_bonus
from worker
where First_name='vipul';       
                        
                        
select worker_ref_id, sum(bonus_amount)

from bonus
group by worker_ref_id;                      



--  lead lerin isimlerini maas miktarini azalan sekilde yazdiran

select first_name,last_name,salary,(select worker_title from title where title.worker_ref_id= worker.worker_id) as unvan
from worker
where worker_id in(select worker_ref_id 
				from title
                where worker_title='lead')
order by salary desc;
 
 
 