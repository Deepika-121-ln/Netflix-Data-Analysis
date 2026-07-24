Create Database Netflix;
use Netflix;

#1. Which are the Top 10 most popular titles based on total views?
#2. Which directors have directed the highest number of Movies and TV Shows?
#3. What is the average IMDb rating for each genre?
#4. Which country has produced the highest number of Netflix titles?
#5. How has Netflix content grown over the years?
#6. Which language has the highest average IMDb rating?
#7. What is the distribution of Movies vs TV Shows on Netflix?
#8. Which genre generates the highest total audience views?
#9. Which directors consistently produce highly rated content?
#10. Which titles have above-average IMDb ratings and above-average audience views
#11. Find the Top 5 countries with the highest average IMDb rating.
#12. Which release year generated the highest total views?
#13. Which rating category (U, UA 13+, UA 16+, A) has the most content?
#14. Find the top 10 most frequently appearing actors in the Cast column.
#15. Which director has generated the highest total Views_Million across all their titles?



#1. Which are the Top 10 most popular titles based on total views?
Create View Top_10_most_popular_titles_based_on_total_views AS
SELECT Title,
       SUM(Views_Million) AS Total_Views
FROM netflixreal
GROUP BY Title
ORDER BY Total_Views DESC
LIMIT 10;

#1. Which are the Top 10 most popular titles based on total views?
SELECT * FROM  Top_10_most_popular_titles_based_on_total_views;

#2. Which directors have directed the highest number of Movies and TV Shows?
Create View directed_highest_number_of_Movies_and_TV_Shows AS
SELECT Director,
       COUNT(*) AS Total_Titles
FROM netflixreal
GROUP BY Director
ORDER BY Total_Titles DESC;

#2. Which directors have directed the highest number of Movies and TV Shows?
SELECT * FROM directed_highest_number_of_Movies_and_TV_Shows;

#3. What is the average IMDb rating for each genre?
Create View average_IMDb_rating_for_each_genre AS
SELECT Genre,
       ROUND(AVG(IMDb_Rating),2) AS Average_IMDb_Rating
FROM netflixreal
GROUP BY Genre
ORDER BY Average_IMDb_Rating DESC;


#3. What is the average IMDb rating for each genre?
SELECT * FROM average_IMDb_rating_for_each_genre;

#4. Which country has produced the highest number of Netflix titles?
Create View country_produced_highest_number_of_Netflix_titles AS
SELECT Country,
       COUNT(*) AS Total_Titles
FROM netflixreal
GROUP BY Country
ORDER BY Total_Titles DESC;


#4. Which country has produced the highest number of Netflix titles?
SELECT * FROM country_produced_highest_number_of_Netflix_titles;

#5. How has Netflix content grown over the years?
Create View Netflix_content_grown_over_the_years AS
SELECT Release_Year,
       COUNT(*) AS Total_Titles
FROM netflixreal
GROUP BY Release_Year
ORDER BY Release_Year;

#5. How has Netflix content grown over the years?
SELECT * FROM Netflix_content_grown_over_the_years;

#6. Which language has the highest average IMDb rating?
Create View language_has_highest_average_IMDb_rating AS
SELECT Language,
       ROUND(AVG(IMDb_Rating),2) AS Average_IMDb
FROM netflixreal
GROUP BY Language
ORDER BY Average_IMDb DESC;


#6. Which language has the highest average IMDb rating?
SELECT * FROM language_has_highest_average_IMDb_rating;

#7. What is the distribution of Movies vs TV Shows on Netflix?
Create View distribution_Movies_vs_TVShows_on_Netflix AS
SELECT Type,
       COUNT(*) AS Total_Content,
       ROUND(COUNT(*)*100.0/(SELECT COUNT(*) FROM netflixreal),2) AS Percentage
FROM netflixreal
GROUP BY Type;


#7. What is the distribution of Movies vs TV Shows on Netflix?
SELECT * FROM distribution_Movies_vs_TVShows_on_Netflix;

#8. Which genre generates the highest total audience views?
Create View genre_generates_the_highest_total_audience_views AS
SELECT Genre,
       SUM(Views_Million) AS Total_Views
FROM netflixreal
GROUP BY Genre
ORDER BY Total_Views DESC;


#8. Which genre generates the highest total audience views?
SELECT * FROM genre_generates_the_highest_total_audience_views;


#9. Find the Top 5 countries with the highest average IMDb rating.
Create View Top_5_countries_with_the_highest_average_IMDb_rating AS
SELECT Country,
       ROUND(AVG(IMDb_Rating),2) AS Average_Rating
FROM netflixreal
GROUP BY Country
ORDER BY Average_Rating DESC
LIMIT 5;

#9. Find the Top 5 countries with the highest average IMDb rating.
SELECT * FROM Top_5_countries_with_the_highest_average_IMDb_rating;

#10. Which release year generated the highest total views?
Create View release_year_generated_the_highest_total_views AS
SELECT Release_Year,
       SUM(Views_Million) AS Total_Views
FROM netflixreal
GROUP BY Release_Year
ORDER BY Total_Views DESC
LIMIT 1;


#10. Which release year generated the highest total views?
SELECT * FROM release_year_generated_the_highest_total_views;


#11. Which rating category (U, UA 13+, UA 16+, A) has the most content?
Create View most_rating_category AS
SELECT Rating,
       COUNT(*) AS Total_Content
FROM netflixreal
GROUP BY Rating
ORDER BY Total_Content DESC;

#11. Which rating category (U, UA 13+, UA 16+, A) has the most content?
SELECT * FROM most_rating_category;

#12. Find the top 10 most frequently appearing actors in the Cast column.
Create View top_10_most_frequently_appearing_actors AS
SELECT Cast,
       COUNT(*) AS Frequency
FROM netflixreal
GROUP BY Cast
ORDER BY Frequency DESC
LIMIT 10;

#12. Find the top 10 most frequently appearing actors in the Cast column.
SELECT * FROM top_10_most_frequently_appearing_actors;

#13. Which director has generated the highest total Views_Million across all their titles?
Create View director_highest_views_their_titles AS
SELECT Director,
       SUM(Views_Million) AS Total_Views
FROM netflixreal
GROUP BY Director
ORDER BY Total_Views DESC
LIMIT 1;

#13. Which director has generated the highest total Views_Million across all their titles?
SELECT * FROM director_highest_views_their_titles;