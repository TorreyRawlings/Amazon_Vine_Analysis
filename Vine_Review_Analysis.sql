CREATE TABLE vine_table (
  review_id TEXT PRIMARY KEY,
  star_rating INTEGER,
  helpful_votes INTEGER,
  total_votes INTEGER,
  vine TEXT,
  verified_purchase TEXT
);

select *
into total_vine_votes_20_up
from vine_table
where total_votes >= 20

select *
into helpful_total_vine_votes
from total_vine_votes_20_up
WHERE CAST(helpful_votes AS FLOAT)/CAST(total_votes AS FLOAT) >=0.5

select *
into vine_program
from helpful_total_vine_votes
where vine = 'Y'

select *
into vine_program_unpaid
from helpful_total_vine_votes
where vine = 'N'


select count(total_votes) as "total_reviews", count(case when star_rating = 5 then 1 end) as "total_5_star", (count(case when star_rating = 5 then 1 end)::float/count(total_votes)::float)*100 as "percentage of 5 star"
from vine_program

select count(total_votes) as "total_reviews", count(case when star_rating = 5 then 1 end) as "total_5_star", (count(case when star_rating = 5 then 1 end)::float/count(total_votes)::float)*100 as "percentage of 5 star"
from vine_program_unpaid
