# Netflix Movies and TV Shows Data Analysis Using SQL

## Project Overview
This project analyzes the Netflix Movies and TV Shows dataset using SQL to uncover meaningful insights about Netflix's content library.The analysis focuses on content types, genres, ratings, countries,release years, and other business-related trends that can help understand Netflix's content strategy.

## Objectives
- Analyze Netflix's catalog of Movies and TV Shows.
- Identify trends in content release over the years.
- Explore the distribution of ratings and genres.
- Find the top contributing countries and directors.
- Solve business problems using SQL queries.

 ## Dataset

The dataset used in this project is the **Netflix Movies and TV Shows Dataset** from Chatgpt.


# Business Problems and Solutions

#1. Which are the Top 10 most popular titles based on total views?
SELECT Title, SUM(Views_Million) AS Total_Views
FROM netflixreal
GROUP BY Title
ORDER BY Total_Views DESC
LIMIT 10;



#2. What is the average IMDb rating for each genre?
SELECT Genre,
       ROUND(AVG(IMDb_Rating),2) AS Average_IMDb_Rating
FROM netflixreal
GROUP BY Genre
ORDER BY Average_IMDb_Rating DESC;



#3. Which country has produced the highest number of Netflix titles?
SELECT Country,
       COUNT(*) AS Total_Titles
FROM netflixreal
GROUP BY Country
ORDER BY Total_Titles DESC;



#4. How has Netflix content grown over the years?
SELECT Release_Year,
       COUNT(*) AS Total_Titles
FROM netflixreal
GROUP BY Release_Year
ORDER BY Release_Year;


#5. What is the distribution of Movies vs TV Shows on Netflix?
SELECT Type,
       COUNT(*) AS Total_Content,
       ROUND(COUNT(*)*100.0/(SELECT COUNT(*) FROM netflixreal),2) AS Percentage
FROM netflixreal
GROUP BY Type;



#6. Which genre generates the highest total audience views?
SELECT Genre,
       SUM(Views_Million) AS Total_Views
FROM netflixreal
GROUP BY Genre
ORDER BY Total_Views DESC;



#7. Which release year generated the highest total views?
SELECT Release_Year,
       SUM(Views_Million) AS Total_Views
FROM netflixreal
GROUP BY Release_Year
ORDER BY Total_Views DESC
LIMIT 1;



#8. Which rating category (U, UA 13+, UA 16+, A) has the most content?
SELECT Rating,
       COUNT(*) AS Total_Content
FROM netflixreal
GROUP BY Rating
ORDER BY Total_Content DESC;


#9. Find the top 10 most frequently appearing actors in the Cast column.
SELECT Cast,
       COUNT(*) AS Frequency
FROM netflixreal
GROUP BY Cast
ORDER BY Frequency DESC
LIMIT 10;


#10. Which director has generated the highest total Views_Million across all their titles?
SELECT Director,
       SUM(Views_Million) AS Total_Views
FROM netflixreal
GROUP BY Director
ORDER BY Total_Views DESC
LIMIT 1;

# Findings
​- Genre Popularity: International Movies, Dramas, and Comedies dominate the platform's library, showing strong global appeal across diverse user segments.
​- Release Year & Addition Trends: Netflix saw exponential growth in content additions between 2016 and 2021. While movies make up the majority of total titles, TV show acquisitions and original series productions have grown rapidly.
​- Regional Content Distribution: The United States and India are the leading contributors to Netflix's library, followed by significant growth in South Korean and European titles.
​- Content Ratings: A large portion of Netflix's catalog consists of mature content (TV-MA and R), indicating a focus on young adult and adult audiences over children's programming.
​

# Conclusions
​The insights gathered from this analysis highlight Netflix’s strategic pivot toward global content expansion and original TV show production. By heavily investing in localized content across key markets like India, South Korea, and Latin America, Netflix drives subscriber retention and regional growth. Furthermore, the platform's focus on episodic TV series caters to high user engagement and longer viewing hours.
​
# Future Work
​- User Engagement Metrics: Integrate subscriber viewing hours, completion rates, and active user metrics to evaluate which titles drive long-term engagement.
​- Comparative Streaming Analysis: Perform a cross-platform comparative analysis against competitors (e.g., Amazon Prime Video, Disney+) to identify content gaps and market opportunities.
​- Recommendation & Sentiment Analysis: Perform sentiment analysis on user reviews/ratings to understand content satisfaction beyond catalog size.


