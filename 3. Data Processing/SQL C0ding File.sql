---------------------------------------------------------------------------------------------
 ---SQL Code for Car Sales
 ---------------------------------------------------------------------------------------------
 SELECT
      year,
      AVG(odometer) AS avg_odometer,
 --------------------------------------------------------------------------------
 ---Adding Revenue Columns
 ----------------------------------------------------------------------------------     
---Add Column 1
     COUNT(*) AS units_sold,
 ---------------------------------------------------------------------------------------------
 
    ---Adding clean columns 
-------------------------------------------------------------------------------------------------------
      COALESCE(make, 'unknown') AS make_clean,

      COALESCE(model, 'unknown') AS model_clean,

      COALESCE(body, 'unknown') AS body_clean,

      COALESCE( to_date(to_timestamp(substring(saledate, 5), 'MMM dd yyyy HH:mm:ss')),
      DATE '1900-01-01'
      ) AS sale_date,

      COALESCE (NULLIF(color,'—'), 'Unknown') AS color_clean,

      COALESCE(sellingprice,0) AS sellingprice,
      COALESCE(mmr,0) AS mmr,
---------------------------------------------------------------------------------------------------
---Adding the CASE Statements
----------------------------------------------------------------------------------------------------
    
     ---Add new column: vehicle_segment
      CASE
         WHEN body IN ('SUV', 'Crossover') THEN 'SUV'
         WHEN body IN ('Sedan', 'Coupe') THEN 'Passenger Car'
         WHEN body IN ('Truck', 'Pickup') THEN 'Truck'
         ELSE 'Other'
     END AS vehicle_segment,

     ---Add new column: condition_rating
     CASE
        WHEN condition >= 4.5 THEN 'Excellent'
        WHEN condition >= 3.5 THEN 'Good'
        WHEN condition >= 2.5 THEN 'Fair'
        ELSE 'Poor'
     END AS condition_rating,

     ---Add new column: price_performance
     CASE
        WHEN sellingprice > mmr THEN 'Above Market'
        WHEN sellingprice = mmr THEN 'At Market'
        ELSE 'Below Market'
     END AS pricing_performance,

     ---Add new column: profit analysis
     CASE
        WHEN sellingprice-mmr >= 3000 THEN 'High Margin'
        WHEN sellingprice-mmr BETWEEN 0 AND 2999 THEN 'Positive Margin'
        ELSE 'Negative Margin'
     END AS profit_band,
   
    ---Add new column: names of states in full
      CASE 
   
         WHEN UPPER(state) = 'CA' THEN 'California'
         WHEN UPPER(state) = 'TX' THEN 'Texas'
         WHEN UPPER(state) = 'NY' THEN 'New York'
         WHEN UPPER(state) = 'FL' THEN 'Florida'
         WHEN UPPER(state) = 'PA' THEN 'Pennsylvania'
         WHEN UPPER(state) = 'NJ' THEN 'New Jersey'
         WHEN UPPER(state) = 'IL' THEN 'Illinois'
         WHEN UPPER(state) = 'OH' THEN 'Ohio'
         WHEN UPPER(state) = 'MI' THEN 'Michigan'
         WHEN UPPER(state) = 'GA' THEN 'Georgia'
         WHEN UPPER(state) = 'VA' THEN 'Virginia'
         WHEN UPPER(state) = 'NC' THEN 'North Carolina'
         WHEN UPPER(state) = 'SC' THEN 'South Carolina'
         WHEN UPPER(state) = 'AZ' THEN 'Arizona'
         WHEN UPPER(state) = 'WA' THEN 'Washington'
         WHEN UPPER(state) = 'OR' THEN 'Oregon'
         WHEN UPPER(state) = 'CO' THEN 'Colorado'
         WHEN UPPER(state) = 'UT' THEN 'Utah'
         WHEN UPPER(state) = 'MA' THEN 'Massachusetts'
         WHEN UPPER(state) = 'MN' THEN 'Minnesota'
         WHEN UPPER(state) = 'WI' THEN 'Wisconsin'
         WHEN UPPER(state) = 'TN' THEN 'Tennessee'
         WHEN UPPER(state) = 'MD' THEN 'Maryland'
         WHEN UPPER(state) = 'NE' THEN 'Nebraska'
         WHEN UPPER(state) = 'MO' THEN 'Missouri'
         WHEN UPPER(state) = 'LA' THEN 'Louisiana'
         WHEN UPPER(state) = 'PR' THEN 'Puerto Rico'
     ELSE 'Unknown'
     END AS state_full_name, 
 
     CASE 
         WHEN state IN ( 'ca', 'wa','or') THEN 'West'
         WHEN state IN ('tx', 'az', 'nm') THEN 'South West'
         WHEN state IN ('ny', 'nj', 'pa') THEN 'North East'
         WHEN state IN ('il', 'oh', 'mi') THEN 'Mid West'
         ELSE 'Other'
     END AS region
     FROM workspace.default.car_sales_data
     GROUP BY year, saledate, make, model, body, color, state, condition, sellingprice, mmr
     ORDER BY avg_odometer, sellingprice DESC;
