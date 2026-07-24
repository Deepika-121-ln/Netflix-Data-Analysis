Create Database Netflix;
use Netflix;

#1. Which are the Top 10 most popular titles based on total views?
#2. What is the average IMDb rating for each genre?
#3. Which country has produced the highest number of Netflix titles?
#4. How has Netflix content grown over the years?
#5. What is the distribution of Movies vs TV Shows on Netflix?
#6. Which genre generates the highest total audience views?
#7. Which release year generated the highest total views?
#8. Which rating category (U, UA 13+, UA 16+, A) has the most content?
#9. Find the top 10 most frequently appearing actors in the Cast column.
#10. Which director has generated the highest total Views_Million across all their titles?



#1. Which are the Top 10 most popular titles based on total views?
Create View Top_10_titles AS
SELECT Title, SUM(Views_Million) AS Total_Views
FROM netflixreal
GROUP BY Title
ORDER BY Total_Views DESC
LIMIT 10;

#1. Which are the Top 10 most popular titles based on total views?
SELECT * FROM  Top_10_titles;


#2. What is the average IMDb rating for each genre?
Create View average_rating AS
SELECT Genre,
       ROUND(AVG(IMDb_Rating),2) AS Average_IMDb_Rating
FROM netflixreal
GROUP BY Genre
ORDER BY Average_IMDb_Rating DESC;


#2. What is the average IMDb rating for each genre?
SELECT * FROM average_rating;

#3. Which country has produced the highest number of Netflix titles?
Create View H_N_T AS
SELECT Country,
       COUNT(*) AS Total_Titles
FROM netflixreal
GROUP BY Country
ORDER BY Total_Titles DESC;


#3. Which country has produced the highest number of Netflix titles?
SELECT * FROM H_N_T;

#4. How has Netflix content grown over the years?
Create View Netflix_growth AS
SELECT Release_Year,
       COUNT(*) AS Total_Titles
FROM netflixreal
GROUP BY Release_Year
ORDER BY Release_Year;

#4. How has Netflix content grown over the years?
SELECT * FROM Netflix_growth;


#5. What is the distribution of Movies vs TV Shows on Netflix?
Create View D_Movies_TVShows_Netflix AS
SELECT Type,
       COUNT(*) AS Total_Content,
       ROUND(COUNT(*)*100.0/(SELECT COUNT(*) FROM netflixreal),2) AS Percentage
FROM netflixreal
GROUP BY Type;


#5. What is the distribution of Movies vs TV Shows on Netflix?
SELECT * FROM D_Movies_TVShows_Netflix;

#6. Which genre generates the highest total audience views?
Create View total_audience_views AS
SELECT Genre,
       SUM(Views_Million) AS Total_Views
FROM netflixreal
GROUP BY Genre
ORDER BY Total_Views DESC;


#6. Which genre generates the highest total audience views?
SELECT * FROM total_audience_views;


#7. Which release year generated the highest total views?
Create View highest_total_views AS
SELECT Release_Year,
       SUM(Views_Million) AS Total_Views
FROM netflixreal
GROUP BY Release_Year
ORDER BY Total_Views DESC
LIMIT 1;


#7. Which release year generated the highest total views?
SELECT * FROM highest_total_views;


#8. Which rating category (U, UA 13+, UA 16+, A) has the most content?
Create View most_rating_category AS
SELECT Rating,
       COUNT(*) AS Total_Content
FROM netflixreal
GROUP BY Rating
ORDER BY Total_Content DESC;

#8. Which rating category (U, UA 13+, UA 16+, A) has the most content?
SELECT * FROM most_rating_category;

#9. Find the top 10 most frequently appearing actors in the Cast column.
Create View top_10_actors AS
SELECT Cast,
       COUNT(*) AS Frequency
FROM netflixreal
GROUP BY Cast
ORDER BY Frequency DESC
LIMIT 10;

#9. Find the top 10 most frequently appearing actors in the Cast column.
SELECT * FROM top_10_actors;

#10. Which director has generated the highest total Views_Million across all their titles?
Create View director_highest_views_their_titles AS
SELECT Director,
       SUM(Views_Million) AS Total_Views
FROM netflixreal
GROUP BY Director
ORDER BY Total_Views DESC
LIMIT 1;

#10. Which director has generated the highest total Views_Million across all their titles?
SELECT * FROM director_highest_views_their_titles;