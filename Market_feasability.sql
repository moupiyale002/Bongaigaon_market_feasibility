create database market_feseability;
use market_feseability;
# Best Area to Open a New Restaurant
SELECT 
    area,
    population,
    avg_monthly_income_INR,
    footfall_level
FROM areas
ORDER BY 
    CASE footfall_level
        WHEN 'Very High' THEN 1
        WHEN 'High' THEN 2
        WHEN 'Medium' THEN 3
        ELSE 4
    END,
    population DESC;
    
   # Cuisine Demand vs Competition (Market Gap)
    SELECT
    c.cuisine,
    COUNT(r.restaurant_name) AS competitor_count,
    AVG(r.rating) AS avg_rating
FROM restaurants c
LEFT JOIN restaurants r 
    ON c.cuisine = r.cuisine
GROUP BY c.cuisine
ORDER BY competitor_count ASC;

# High Rating but Low Price Competitors
SELECT
    restaurant_name,
    avg_price_for_two_INR,
    rating,
    review_count
FROM restaurants
WHERE rating >= 4.0
ORDER BY avg_price_for_two_INR ASC;

# Area-wise Competition Density
SELECT
    a.area,
    COUNT(r.restaurant_Name) AS total_restaurants
FROM areas a
LEFT JOIN restaurants r
    ON a.area = r.area
GROUP BY a.area
ORDER BY total_restaurants DESC;

# Average Pricing by Area
SELECT
    a.area,
    AVG(r.avg_price_for_two_INR) AS avg_price_for_two
FROM restaurants r
JOIN areas a
    ON r.area = a.area
GROUP BY a.area
ORDER BY avg_price_for_two;

# Most Demanded Dishes (Menu Planning)
SELECT
    popular_dish,
    avg_dish_price_INR,
    demand_level
FROM menu_items
WHERE demand_level IN ('High', 'Very High')
ORDER BY avg_dish_price_INR;


# Monthly Cost Breakdown
SELECT
    cost_type,
    estimated_monthly_cost_INR
FROM costs
ORDER BY estimated_monthly_cost_INR  DESC;


#Estimated Monthly Revenue
SELECT
    day_type,
    avg_customers_per_day,
    avg_bill_value_INR,
    estimated_daily_revenue_INR,
    estimated_daily_revenue_INR * 30 AS estimated_monthly_revenue
FROM daily_sales;






