-- List the players with more than four years of experience from the teams who have not won a championship.



-- Find out the number of tickets sold for each price category of ticket
-- that were sold in the years bewteen 2016-2022.
select price, (count(price)) as ticket_count
from tickets 
where year between 2016 and 2022
group by price;

-- List the total no of subscriptions bought by those between age 20 to 30
select count(ref_num) as total_subscription
from online_viewers
where age between 20 and 30;

-- List top 3 regions with subscribers having watch hours more than 50 minutes
select region_code 
from online_viewers 
where watch_time > (
select avg(watch_time) 
from online_viewers)
limit 3;

-- List the regions with subscribers having average watch time more than 55 minutes:
select avg(watch_time) as average_watch_time, region_code
from online_viewers
group by region_code
having (avg(watch_time)> 55)
order by avg(watch_time) desc;

-- Assume avg subscription cost is 500 rs and avg ticket price as 200 rs. Calculate total revenue generated from tickets and subscription.  Also calculate the difference between the two.

-- Find the no of people watching from SOUTHERN region who are in the age group of below 22.
select count(oc.subscription_id) as total_subscribers
from ott_company as oc
join online_viewers as ov
on oc.subscription_id= ov.ref_num
where ov.age < 22 and  ov.region_code in('S','SE');

-- Find board_director and number of members where the budget was more than
select kb.board_director, kb.num_of_members, t.budget
from tournament as t
join kabaddi_board as kb
on t.year=kb.year
where budget > 70500000 
limit 10 ;

select p.player_id, p.name as player_name, t.team_id, p.buy_price, too.purse_amount_crores
from team_owner as too
join team as t
on too.team_id=t.team_id
join tp 
on tp.team_id=t.team_id
join players as p
on p.player_id= tp.player_id
where too.purse_amount_crores < 50
order by p.buy_price
limit 10;



-- List the players who were brought at a price lesser than 25000 and must have 
-- atleast three years of experience.
select p.player_id, p.name
from players p
where buy_price < 25000 and
years_of_experience >= 3
limit 10;


-- Fetch the most expensive player of teams having purse amount less than 50 crores.
select p.player_id, p.name as player_name, p.buy_price, too.purse_amount_crores
from team_owner as too
join team as t
on too.team_id=t.team_id
join tp 
on tp.team_id=t.team_id
join players as p
on p.player_id= tp.player_id
limit 10;


-- List down the winners of each year tournmanet having purse amount greater than 10 crores 
-- and their prize money.
select  too.team_id, tt.t_year, t.winner_amount, too.purse_amount_crores
from tt
join tournament as t
on t.year=tt.t_year
join team_owner as too
on too.team_id=tt.t_Team_ID
where too.purse_amount_crores > 10
and tt.Standings=1;

-- Calculate the revenue generated from online subscriptions from all the regions.
select count(ottc.sub_amount) as no_of_subscribers, 
count(ottc.sub_amount)* ottc.sub_amount as online_revenue, 
ov.region_code
from ott_company as ottc
join online_viewers as ov
on ottc.subscription_id=ov.Ref_num
group by ov.region_code
order by online_revenue desc;


-- Calculate the revenue generated from stadium viewers.
select (count(price)) as ticket_count,
(count(price))*price as total_stadium_revenue
from tickets t
join tickets_ref as tr
on t.ticket_num=tr.ticket_num;