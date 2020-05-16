-- ETL PROJECT -SQL SCRIPT  
-- MACLEAN ASANTE & HANS ENGELBRECHT-- MAY 13, 2020
-- YOUTUBE DATABASE: VIEWS AND CLICKS ANALYSIS

-- -- -- -- -- -- -- -- -- -- [DATA ENGINEERING]  -- -- -- -- -- -- -- -- -- -- -- -- --
-- Creating tables and importing csv files to tables to SQL DATABASE

CREATE  TABLE trending_videos (
  	"video_id" varchar(1000) NOT NULL,
	"trending_date"  date NOT NULL,
	"title" varchar(5000) NOT NULL,
	"channel_title" varchar(100) NOT NULL,
	"category_id" int NOT NULL,
    "Publish_time" date NOT NULL,
    "views" int NOT NULL,
	"likes" int NOT NULL,
	"dislikes" int NOT NULL,
	"comment_count" int NOT NULL,
	"country_id" int NOT NULL);

CREATE TABLE categories (
  	"category_id" int Primary key NOT NULL,
	"category_name" varchar(50) NOT NULL);
	
CREATE TABLE country (
   "country_id" int primary key NOT NULL,
	"country_name" varchar(50) NOT NULL,
	"country_code" varchar(10) NOT NULL);

DROP TABLE trending_videos;
DROP TABLE categories;
DROP TABLE country;

-- -- -- -- -- -- -- -- -- -- [EXAMPLE QUERIES]  -- -- -- -- -- -- -- -- -- -- -- -- --

SELECT * FROM "trending_videos";
SELECT * FROM "Categories";
SELECT * FROM "Country";

SELECT COUNT(video_id) FROM "trending_videos";

SELECT v.video_id, v.trending_date, v.title, v.channel_title, v.views, v.comment_count, ca.category_name, co.country_name
FROM trending_videos AS v
INNER JOIN categories AS ca
ON v.category_id = ca.category_id
INNER JOIN country AS co
ON v.country_id = co.country_id
WHERE co.country_name like 'Germany'
ORDER BY v.views desc
LIMIT 25;

