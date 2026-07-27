-- Google Play Store SQL Analysis
-- Author: Harshal Agrawal

USE google_play_store;

#Query 1:Total number of apps
select count(*) as total_Apps
from playstore;

#Query 2:Total number of categories
select count(distinct category) as total_categories
from playstore;

#Query 3:List all categories
select distinct category
from playstore
order by category;

#Query 4:Free vs Paid apps
SELECT Type, COUNT(*) AS Number_of_Apps
FROM playstore
GROUP BY Type;

#Query 5:Average rating of all apps
select round(avg(rating),2) as average_rating
from playstore;

#Query 6:Highest rated apps
select app, rating
from playstore 
order by rating desc
limit 10;

#Query 7:Most reviewed apps
select app, reviews
from playstore 
order by reviews desc
limit 10;

#Query 8:Apps with the highest installs
SELECT App, Installs
FROM playstore
ORDER BY CAST(REPLACE(REPLACE(Installs,'+',''),',','') AS UNSIGNED) DESC
LIMIT 10;

#Query 9:Number of apps in each category
SELECT Category, COUNT(*) AS Total_Apps
FROM playstore
GROUP BY Category
ORDER BY Total_Apps DESC;

#Query 10:Average rating by category
SELECT Category, ROUND(AVG(Rating),2) AS Avg_Rating
FROM playstore
GROUP BY Category
ORDER BY Avg_Rating DESC;

#Query 11:Top 10 expensive paid apps
SELECT App, Price
FROM playstore
WHERE Type='Paid'
ORDER BY CAST(REPLACE(Price,'$','') AS DECIMAL(10,2)) DESC
LIMIT 10;

#Query 12:Content rating distribution
SELECT Content_Rating, COUNT(*) AS Total
FROM playstore
GROUP BY Content_Rating
ORDER BY Total DESC;

#Query 13:Genre distribution
SELECT Genres, COUNT(*) AS Total
FROM playstore
GROUP BY Genres
ORDER BY Total DESC
LIMIT 10;

#Query 14:Apps rated above 4.5
SELECT App, Rating
FROM playstore
WHERE Rating > 4.5
ORDER BY Rating DESC;

#Query 15:Categories with rating above 4.3
SELECT Category, ROUND(AVG(Rating),2) AS Avg_Rating
FROM playstore
GROUP BY Category
HAVING AVG(Rating) > 4.3
ORDER BY Avg_Rating DESC;

#Query 16:Number of free apps in each category
SELECT Category, COUNT(*) AS Free_Apps
FROM playstore
WHERE Type='Free'
GROUP BY Category
ORDER BY Free_Apps DESC;

#Query 17:Number of paid apps in each category
SELECT Category, COUNT(*) AS Paid_Apps
FROM playstore
WHERE Type='Paid'
GROUP BY Category
ORDER BY Paid_Apps DESC;

#Query 18:Top 10 categories by reviews
SELECT Category, SUM(Reviews) AS Total_Reviews
FROM playstore
GROUP BY Category
ORDER BY Total_Reviews DESC
LIMIT 10;

#Query 19:Lowest rated apps
SELECT App, Rating
FROM playstore
ORDER BY Rating ASC
LIMIT 10;

#Query 20:Total reviews in the Play Store
SELECT SUM(Reviews) AS Total_Reviews
FROM playstore;

















