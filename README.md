# Netflix Movies and TV Shows Data Analysis using SQL

## Overview
This project involves a comprehensive analysis of Netflix's movies and TV shows data using SQL. The goal is to extract valuable insights and 
answer various business questions based on the dataset. The following README provides a detailed account of the project's objectives, business problems, solutions, findings, and conclusions.

## Objectives

- Analyze the distribution of content types (movies vs TV shows).
- Identify the most common ratings for movies and TV shows.
- List and analyze content based on release years, countries, and durations.
- Explore and categorize content based on specific criteria and keywords.

## Dataset

The data for this project is sourced from the Kaggle dataset:

- **Dataset Link:** [Movies Dataset](https://www.kaggle.com/datasets/shivamb/netflix-shows?resource=download)

## Schema

```sql
DROP TABLE IF EXISTS netflix;
CREATE TABLE netflix
(
    show_id      VARCHAR(5),
    type         VARCHAR(10),
    title        VARCHAR(250),
    director     VARCHAR(550),
    casts        VARCHAR(1050),
    country      VARCHAR(550),
    date_added   VARCHAR(55),
    release_year INT,
    rating       VARCHAR(15),
    duration     VARCHAR(15),
    listed_in    VARCHAR(250),
    description  VARCHAR(550)
);
```


## 📌 Business Problems

### 1️⃣ Count the Number of Movies vs. TV Shows  
Determine how many **Movies** and **TV Shows** are available on Netflix.

### 2️⃣ Find the Most Common Rating for Movies and TV Shows  
Identify the most frequently occurring **rating** for both **Movies** and **TV Shows**.

### 3️⃣ List All Movies Released in a Specific Year  
Retrieve all **Movies** that were released in a given year (e.g., **2020**).

### 4️⃣ Find the Top 5 Countries with the Most Content  
Determine which **5 countries** have the highest amount of content available on Netflix.

### 5️⃣ Identify the Longest Movie  
Find the **Movie** with the longest **duration** on Netflix.

### 6️⃣ Find Content Added in the Last 5 Years  
Retrieve all **Movies** and **TV Shows** that have been **added** to Netflix in the last **5 years**.

### 7️⃣ Find All the Movies/TV Shows by Director ‘Rajiv Chilaka’  
List all **Movies and TV Shows** directed by **Rajiv Chilaka**.

### 8️⃣ List All TV Shows with More Than 5 Seasons  
Retrieve all **TV Shows** that have **more than 5 seasons**.

### 9️⃣ Count the Number of Content Items in Each Genre  
Find how many **content items** exist in each **genre**.

### 🔟 Find Each Year and the Average Number of Content Releases in India  
Determine the **top 5 years** with the **highest average content release** in India.

### 1️⃣1️⃣ List All Movies That Are Documentaries  
Retrieve all **Movies** categorized as **Documentaries**.

### 1️⃣2️⃣ Find All Content Without a Director  
Identify all **Movies** and **TV Shows** that do **not** have a **director** listed.

### 1️⃣3️⃣ Find How Many Movies Actor 'Salman Khan' Appeared in Last 10 Years  
Determine the number of **Movies** featuring **Salman Khan** in the **last 10 years**.

### 1️⃣4️⃣ Find the Top 10 Actors Who Have Appeared in the Most Movies Produced in India  
Identify the **top 10 actors** with the **highest number of movie appearances** in **India**.

### 1️⃣5️⃣ Categorize Content Based on Keywords ('Kill' and 'Violence')  
- Label content as **"Bad"** if the **description** contains keywords like **"kill"** or **"violence"**.  
- Label all other content as **"Good"**.  
- Count how many content items fall into each **category**.

---

## 🚀 Dataset  
The analysis is based on **Netflix's** dataset, which contains details about **Movies** and **TV Shows**, including:  
- **Title, Type, Genre, Director, Cast, Country, Release Year, Rating, Duration, and Description.**  

## 🛠️ Technologies Used  
- **SQL Server (SSMS)** for **querying and analysis**.  
- **GitHub** for version control.  

## 📈 Insights & Business Value  
- Helps **content strategists** understand **trends** in Netflix's content.  
- Assists in **market analysis** by showing content distribution **by country and genre**.  
- Identifies **top actors, directors, and most popular content types** on Netflix.  

--
## Findings and Conclusion

- **Content Distribution:** The dataset contains a diverse range of movies and TV shows with varying ratings and genres.
- **Common Ratings:** Insights into the most common ratings provide an understanding of the content's target audience.
- **Geographical Insights:** The top countries and the average content releases by India highlight regional content distribution.
- **Content Categorization:** Categorizing content based on specific keywords helps in understanding the nature of content available on Netflix.

This analysis provides a comprehensive view of Netflix's content and can help inform content strategy and decision-making.
