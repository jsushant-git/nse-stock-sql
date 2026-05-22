create database stock_market;

use stock_market;


-- Q1) Retrieve all stock records for Reliance Industries.
SELECT *
FROM stock_market_data1
WHERE Company_Name = 'Reliance Industries Ltd';

-- Q2) Find the top 10 highest closing prices recorded in the dataset.
SELECT Date, Symbol, Company_Name, Close
FROM stock_market_data1
ORDER BY Close DESC
LIMIT 10;

-- Q3) Count the number of unique companies in the dataset.
SELECT COUNT(DISTINCT Company_Name) AS total_companies
FROM stock_market_data1;

-- Q4) Find all stocks with a BUY signal.
SELECT Date, Symbol, Company_Name, 'Signal'
FROM stock_market_data1
WHERE 'Signal' = 'BUY';

-- Q5) Calculate the average daily return percentage for each company.
SELECT Company_Name,
       AVG(`Daily_Return_%`) AS avg_daily_return
FROM stock_market_data1
GROUP BY Company_Name
ORDER BY avg_daily_return DESC;

-- Q6) Find the highest market capitalization company in each sector.
SELECT Sector,
       Company_Name,
       MAX(Market_Cap_Cr) AS highest_market_cap
FROM stock_market_data1
GROUP BY Sector, Company_Name
ORDER BY highest_market_cap DESC;

-- Q7) Find the average trading volume by sector.
SELECT Sector,
       AVG(Volume) AS avg_volume
FROM stock_market_data1
GROUP BY Sector
ORDER BY avg_volume DESC;

-- Q8) Find stocks trading above their 50-day moving average.
SELECT Date, Symbol, Company_Name, Close, MA_50
FROM stock_market_data1
WHERE Close > MA_50;

-- Q9) Detect potential breakout stocks using Bollinger Bands.
SELECT Date,
       Symbol,
       Company_Name,
       Close,
       BB_Upper
FROM stock_market_data1
WHERE Close > BB_Upper;

-- Q10) Find companies with an average RSI above 70 (overbought condition)
SELECT Company_Name,
       AVG(RSI_14) AS avg_rsi
FROM stock_market_data1
GROUP BY Company_Name
HAVING AVG(RSI_14) > 70;
