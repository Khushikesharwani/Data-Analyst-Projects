# 1.TOTAL SALES BY REGION
SELECT Region, SUM(Sales) AS TotalSales
FROM Orders
GROUP BY Region
ORDER BY TotalSales DESC;

| Region  | TotalSales  |
|---------|-------------|
| West    | 725,514.00  |
| East    | 678,834.00  |
| Central | 501,256.00  |
| South   | 391,750.00  |

**Insight:**
> Regional sales analysis shows a clear gradient:
>
> - **West region leads** with \$725K in sales, followed closely by the East at \$678K.
> - **Central and South regions lag behind**, with \$501K and \$392K respectively.
>
> This suggests the business may have stronger market presence or customer base in the West and East. **Targeted marketing and sales initiatives** in the Central and South regions could help **balance regional performance and drive overall growth**.


# 2. PROFIT BY PRODUCT CATEGORY
SELECT P.Category, SUM(O.Profit) AS TotalProfit
FROM Orders O
JOIN Products P ON O.ProductID = P.ProductID
GROUP BY P.Category
ORDER BY TotalProfit DESC;

| Category        | TotalProfit  |
|------------------|--------------|
| Technology       | 875,140.00   |
| Office Supplies  | 855,332.00   |
| Furniture        | 171,897.00   |

**Insight:**
> Profit by category shows clear leaders:
>
> - **Technology and Office Supplies** are nearly tied as top profit drivers, each contributing over \$850K in profit.
> - **Furniture lags significantly** with only \$172K in profit.
>
> Recommendation: Maintain strong focus on **Technology and Office Supplies** marketing and sales, while investigating ways to improve **Furniture profitability** through pricing, cost control, or product mix optimization.


# 3. MONTHLY SALES TREND
SELECT DATE_FORMAT(OrderDate, '%Y-%m') AS Month, SUM(Sales) AS TotalSales
FROM Orders
GROUP BY DATE_FORMAT(OrderDate, '%Y-%m')
ORDER BY Month;

| Month    | TotalSales  |
|----------|-------------|
| 2014-01  | 28,959.00   |
| 2014-02  | 12,740.00   |
| 2014-03  | 54,796.00   |
| 2014-04  | 24,710.00   |
| 2014-05  | 29,640.00   |
| 2014-06  | 29,289.00   |
| 2014-07  | 35,348.00   |
| 2014-08  | 37,858.00   |
| 2014-09  | 66,113.00   |
| 2014-10  | 34,561.00   |
| 2014-11  | 64,816.00   |
| 2014-12  | 65,425.00   |
| 2015-01  | 29,351.00   |
| 2015-02  | 20,728.00   |
| 2015-03  | 40,881.00   |
| 2015-04  | 38,054.00   |
| 2015-05  | 30,934.00   |
| 2015-06  | 28,865.00   |
| 2015-07  | 28,732.00   |
| 2015-08  | 50,095.00   |
| 2015-09  | 66,734.00   |
| 2015-10  | 32,028.00   |
| 2015-11  | 50,738.00   |
| 2015-12  | 53,420.00   |
| 2016-01  | 38,056.00   |
| 2016-02  | 49,240.00   |
| 2016-03  | 49,614.00   |
| 2016-04  | 45,196.00   |
| 2016-05  | 64,967.00   |
| 2016-06  | 38,998.00   |
| 2016-07  | 42,778.00   |
| 2016-08  | 46,347.00   |
| 2016-09  | 41,989.00   |
| 2016-10  | 52,277.00   |
| 2016-11  | 66,839.00   |
| 2016-12  | 72,954.00   |
| 2017-01  | 64,740.00   |
| 2017-02  | 50,024.00   |
| 2017-03  | 74,779.00   |
| 2017-04  | 39,074.00   |
| 2017-05  | 40,884.00   |
| 2017-06  | 47,738.00   |
| 2017-07  | 54,392.00   |
| 2017-08  | 75,684.00   |
| 2017-09  | 74,175.00   |
| 2017-10  | 65,509.00   |
| 2017-11  | 89,313.00   |
| 2017-12  | 56,972.00   |

**Insight:**
> The monthly sales trend reveals strong seasonality and consistent year-end peaks:
>
> - **High sales months** include September to December in multiple years, with November often spiking over \$85,000 (e.g., 2017-11: \$89,313).
> - **Early-year months** tend to be weaker in sales.
>
> This pattern suggests **holiday and end-of-year demand surges**, making them ideal for promotions and inventory ramp-up. Targeted campaigns during peak months can maximize revenue, while off-peak periods may benefit from retention or cross-selling strategies.


# 4. TOP 10 CUSTOMERS BY TOTAL SALES
SELECT C.CustomerName, SUM(O.Sales) AS TotalSales
FROM Orders O
JOIN Customers C ON O.CustomerID = C.CustomerID
GROUP BY CustomerName
ORDER BY TotalSales DESC
LIMIT 10;

| Customer Name | TotalSales  |
|----------------|-------------|
| Ken Lonsdale   | 411,075.00  |
| Sean Miller    | 375,630.00  |
| Seth Vernon    | 367,104.00  |
| Greg Tran      | 342,809.00  |
| John Lee       | 333,166.00  |
| Edward Hooks   | 330,016.00  |
| Sanjit Chand   | 311,190.00  |
| Clay Ludtke    | 304,668.00  |
| Adrian Barton  | 289,520.00  |
| Raymond Buch   | 272,106.00  |

**Insight:**
> The top 10 customers account for significant sales volumes:
>
> - **Ken Lonsdale leads** with over \$411K in sales.
> - All top customers generate over \$270K each.
>
> These high-value customers are critical for revenue stability. **Recommendations:**
>
> - Prioritize **relationship management** and loyalty programs for these key accounts.
> - Analyze buying patterns to tailor promotions and increase repeat purchases.
> - Consider targeted offers or exclusive benefits to maintain their loyalty and expand share-of-wallet.

# 5. AVERAGE DISCOUNT BY REGION
SELECT Region, AVG(Discount) AS AvgDiscount
FROM Orders
GROUP BY Region;

| Region  | AvgDiscount |
|---------|-------------|
| South   | 0.147253    |
| West    | 0.109335    |
| Central | 0.240353    |
| East    | 0.145365    |

**Insight:**
> The average discount varies significantly by region:
>
> - **Central region** offers the highest average discount (~24%), nearly double the West's ~11%.
> - **South and East** have similar average discount rates (~14–15%).
>
> High discounting in the Central region may indicate **pricing pressures or promotional overuse**. This could erode profit margins. **Recommendations:**
>
> - Review discount strategy in Central to ensure it's sustainable and justified.
> - Align discount policies across regions to maintain healthy margins while remaining competitive.


# 6. PROFIT BY CATEGORY AND SUB-CATEGORY
SELECT P.Category, P.Subcategory, ROUND(SUM(O.Profit), 2) AS TotalProfit
FROM Orders O
JOIN Products P ON O.ProductID = P.ProductID
GROUP BY P.Category, P.Subcategory
ORDER BY TotalProfit DESC;

| Category        | Subcategory | TotalProfit  |
|------------------|-------------|--------------|
| Technology       | Accessories | 329,553.00   |
| Technology       | Copiers     | 295,342.00   |
| Technology       | Phones      | 255,704.00   |
| Office Supplies  | Binders     | 243,073.00   |
| Office Supplies  | Paper       | 228,868.00   |
| Furniture        | Chairs      | 206,146.00   |
| Office Supplies  | Storage     | 170,035.00   |
| Office Supplies  | Appliances  | 98,606.00    |
| Furniture        | Furnishings | 82,855.00    |
| Office Supplies  | Labels      | 39,347.00    |
| Office Supplies  | Art         | 38,026.00    |
| Office Supplies  | Envelopes   | 37,028.00    |
| Office Supplies  | Fasteners   | 6,320.00     |
| Technology       | Machines    | -5,459.00    |
| Office Supplies  | Supplies    | -5,971.00    |
| Furniture        | Bookcases   | -16,302.00   |
| Furniture        | Tables      | -100,802.00  |

**Insight:**
> Profitability varies widely across subcategories:
>
> - **Technology subcategories** lead profit generation, with Accessories, Copiers, and Phones all exceeding \$250K each.
> - **Office Supplies** has strong performers like Binders and Paper but also weaker subcategories with low or negative profit.
> - **Furniture** shows the biggest losses, especially in Tables (-\$100K) and Bookcases (-\$16K).
>
> Recommendations:
> - **Focus on top-performing Technology and Office Supplies subcategories** to drive growth.
> - **Reassess pricing, cost structure, or demand for Furniture**, especially loss-making subcategories, to improve overall profitability.



# 7. MONTHLY PROFIT TREND
SELECT DATE_FORMAT(OrderDate, '%Y-%m') AS Month, ROUND(SUM(Profit), 2) AS TotalProfit
FROM Orders
GROUP BY Month
ORDER BY Month;

# Month, TotalProfit
| Month    | Total Profit |
|----------|--------------|
| 2014-01  | 4549.00      |
| 2014-02  | 2650.00      |
| 2014-03  | 91.00        |
| 2014-04  | 4603.00      |
| 2014-05  | 3912.00      |
| 2014-06  | 4499.00      |
| 2014-07  | -1782.00     |
| 2014-08  | 2079.00      |
| 2014-09  | 10221.00     |
| 2014-10  | 4070.00      |
| 2014-11  | 6649.00      |
| 2014-12  | 7979.00      |
| 2015-01  | 1238.00      |
| 2015-02  | 2172.00      |
| 2015-03  | 9172.00      |
| 2015-04  | 6132.00      |
| 2015-05  | 2781.00      |
| 2015-06  | 4782.00      |
| 2015-07  | 668.00       |
| 2015-08  | 10111.00     |
| 2015-09  | 9927.00      |
| 2015-10  | 3430.00      |
| 2015-11  | 5580.00      |
| 2015-12  | 5613.00      |
| 2016-01  | 8499.00      |
| 2016-02  | 14686.00     |
| 2016-03  | 1951.00      |
| 2016-04  | 7426.00      |
| 2016-05  | 9970.00      |
| 2016-06  | 4481.00      |
| 2016-07  | 6122.00      |
| 2016-08  | 863.00       |
| 2016-09  | 5169.00      |
| 2016-10  | 8250.00      |
| 2016-11  | 3054.00      |
| 2016-12  | 11319.00     |
| 2017-01  | 10873.00     |
| 2017-02  | 4238.00      |
| 2017-03  | 18130.00     |
| 2017-04  | -5886.00     |
| 2017-05  | 7570.00      |
| 2017-06  | 7400.00      |
| 2017-07  | 4998.00      |
| 2017-08  | 11760.00     |
| 2017-09  | 9219.00      |
| 2017-10  | 6573.00      |
| 2017-11  | 11142.00     |
| 2017-12  | 7414.00      |


**Insight:**
> Monthly profit shows strong seasonality with clear spikes in certain months (e.g., Sept–Dec in multiple years). These likely correspond to holiday and year-end purchasing cycles. Strategic planning for promotions and inventory should focus on these peak periods.  
>
> There are also isolated negative profit months (e.g., 2014-07, 2017-04) suggesting possible issues with discounts, returns, or cost overruns. These months should be investigated further to identify root causes and mitigate future losses.


# 8. DISCOUNT IMPACT ON PROFIT
SELECT ROUND(Discount, 2) AS DiscountRate, ROUND(SUM(Profit), 2) AS TotalProfit, COUNT(*) AS OrderCount
FROM Orders
GROUP BY DiscountRate
ORDER BY DiscountRate;

| DiscountRate | TotalProfit  | OrderCount |
|---------------|--------------|------------|
| 0.00          | 320,946.00   | 4,798      |
| 0.10          | 9,025.00     | 94         |
| 0.15          | 1,416.00     | 52         |
| 0.20          | 90,344.00    | 3,657      |
| 0.30          | -10,362.00   | 227        |
| 0.32          | -2,390.00    | 27         |
| 0.40          | -23,052.00   | 206        |
| 0.45          | -2,493.00    | 11         |
| 0.50          | -20,508.00   | 66         |
| 0.60          | -5,944.00    | 138        |
| 0.70          | -40,089.00   | 418        |
| 0.80          | -30,546.00   | 300        |

**Insight:**
> The analysis shows a clear threshold effect in discounting:
>
> - **0.00 and 0.20 discount rates are highly profitable**, with 0.00 (no discount) accounting for \$320,946 profit and 0.20 still generating \$90,344 profit.
> - **Higher discount tiers (>30%) consistently lead to negative profit.** For example, 0.70 discount has a \$40,089 loss over 418 orders, and 0.80 discount loses \$30,546 on 300 orders.
>
> This suggests aggressive discounting **erodes profitability substantially**. The business should consider:
>
> - Setting maximum allowed discounts below 30%.
> - Reviewing pricing strategy and discount approval processes.
> - Targeting promotions at 10–20% discounts, where profit remains positive.
>
> Controlling discount levels can significantly improve the bottom line.


# 9. SALES AND PROFIT BY CUSTOMER SEGMENT AND REGION
SELECT C.Segment, O.Region, ROUND(SUM(O.Sales), 2) AS TotalSales, ROUND(SUM(O.Profit), 2) AS TotalProfit
FROM Orders O
JOIN Customers C ON O.CustomerID = C.CustomerID
GROUP BY C.Segment, O.Region
ORDER BY TotalSales DESC;

| Segment      | Region   | TotalSales   | TotalProfit |
|--------------|----------|--------------|-------------|
| Consumer     | West     | 5,883,665.00 | 904,388.00  |
| Consumer     | East     | 5,643,333.00 | 725,481.00  |
| Consumer     | Central  | 4,139,692.00 | 116,999.00  |
| Corporate    | West     | 3,437,912.00 | 541,947.00  |
| Corporate    | East     | 3,188,835.00 | 382,841.00  |
| Consumer     | South    | 3,015,413.00 | 404,745.00  |
| Corporate    | Central  | 2,462,176.00 | 293,260.00  |
| Home Office  | West     | 1,935,602.00 | 242,745.00  |
| Home Office  | East     | 1,830,328.00 | 380,349.00  |
| Corporate    | South    | 1,770,495.00 | 271,096.00  |
| Home Office  | Central  | 1,394,346.00 | 197,835.00  |
| Home Office  | South    | 1,216,202.00 | 85,925.00   |

**Insight:**
> The data reveals strong geographic and segment variation in sales and profit:
>
> - **Consumer segment dominates sales**, especially in the West and East regions, with over \$5.8M and \$5.6M in sales respectively and the highest profits.
> - **Corporate segment** performs well across regions, particularly in the West and East, but lags behind Consumer in total sales.
> - **Home Office** shows the lowest sales overall but maintains respectable profit margins in some regions (e.g., East and West).
>
> Recommendation: Focus marketing and sales resources on **high-value Consumer regions (West, East)** while exploring growth opportunities for **Corporate** in underperforming regions like South and Central.


# 10. AVERAGE ORDER VALUE BY CUSTOMER SEGMENT
SELECT C.Segment, ROUND(SUM(O.Sales) / COUNT(DISTINCT O.OrderID), 2) AS AvgOrderValue
FROM Orders O
JOIN Customers C ON O.CustomerID = C.CustomerID
GROUP BY C.Segment
ORDER BY AvgOrderValue DESC;

| Segment      | AvgOrderValue |
|--------------|---------------|
| Consumer     | 7,224.32      |
| Corporate    | 7,172.67      |
| Home Office  | 7,014.83      |

**Insight:**
> Average order value is fairly consistent across segments:
>
> - **Consumer segment leads** slightly at \$7,224.
> - **Corporate and Home Office** follow closely with values around \$7,100.
>
> The narrow range suggests **pricing and order sizes are well-standardized** across segments. **Opportunities:**
>
> - Explore upselling or bundling strategies to **raise average order values** further.
> - Tailor targeted promotions by segment to encourage larger purchases.


# 11. BEST SELLING PRODUCTS
SELECT P.ProductName, ROUND(SUM(O.Sales), 2) AS TotalSales, SUM(O.Quantity) AS TotalUnitsSold
FROM Orders O
JOIN Products P ON O.ProductID = P.ProductID
GROUP BY P.ProductName
ORDER BY TotalSales DESC
LIMIT 10;

| ProductName                                                               | TotalSales   | TotalUnitsSold |
|---------------------------------------------------------------------------|--------------|-----------------|
| Canon imageCLASS 2200 Advanced Copier                                     | 308,000.00   | 100             |
| Fellowes PB500 Electric Punch Plastic Comb Binding Machine with Manual Bind | 274,540.00   | 310             |
| GBC DocuBind TL300 Electric Binding System                                | 218,064.00   | 407             |
| HON 5400 Series Task Chairs for Big and Tall                              | 174,960.00   | 312             |
| GBC Ibimaster 500 Manual ProClick Binding System                          | 171,234.00   | 432             |
| Bretford Rectangular Conference Table Tops                                | 155,964.00   | 552             |
| Hewlett Packard LaserJet 3310 Copier                                      | 150,720.00   | 304             |
| SAFCO Arco Folding Chair                                                  | 150,475.00   | 689             |
| Hon Deluxe Fabric Upholstered Stacking Chairs, Rounded Back               | 127,656.00   | 612             |
| Tennsco 6- and 18-Compartment Lockers                                     | 120,175.00   | 473             |

**Insight:**
> The top 10 products by sales reveal clear patterns:
>
> - **High-ticket items like copiers** (e.g., Canon imageCLASS at \$308K) lead total sales despite lower unit volume (100 units).
> - **Seating and storage solutions** (e.g., SAFCO Arco Folding Chair, 689 units) sell in high volume but at lower price points.
>
> This suggests a balanced product mix strategy:
>
> - **Maintain focus on high-margin, high-value items** to drive revenue.
> - **Optimize inventory and pricing** for high-volume items to maximize overall profitability.



# 12. ORDERS THAT ARE NOT PROFITABLE
SELECT O.OrderID, O.ProductID, O.Quantity, O.Sales, O.Discount, O.Profit
FROM Orders O
WHERE O.Profit < 0
ORDER BY O.Profit ASC;

| OrderID          | ProductID              | Quantity | Sales     | Discount | Profit     |
|-------------------|-----------------------|----------|-----------|----------|------------|
| CA-2016-108196    | TEC-MA-10000418       | 5        | 4,500.00  | 0.70     | -6,600.00  |
| US-2017-168116    | TEC-MA-10004125       | 4        | 8,000.00  | 0.50     | -3,840.00  |
| CA-2014-169019    | OFF-BI-10004995       | 8        | 2,178.00  | 0.80     | -3,702.00  |
| CA-2017-134845    | TEC-MA-10000822       | 5        | 2,550.00  | 0.70     | -3,400.00  |
| US-2017-122714    | OFF-BI-10001120       | 5        | 1,890.00  | 0.80     | -2,929.00  |
| CA-2015-147830    | TEC-MA-10000418       | 2        | 1,800.00  | 0.70     | -2,640.00  |
| CA-2017-131254    | OFF-BI-10003527       | 6        | 1,525.00  | 0.80     | -2,288.00  |
| CA-2015-116638    | FUR-TA-10000198       | 13       | 4,298.00  | 0.40     | -1,862.00  |
| CA-2016-130946    | OFF-BI-10004995       | 4        | 1,089.00  | 0.80     | -1,851.00  |
| CA-2014-145317    | TEC-MA-10002412       | 6        | 22,638.00 | 0.50     | -1,811.00  |
| US-2015-150630    | FUR-BO-10004834       | 7        | 3,083.00  | 0.50     | -1,665.00  |
| CA-2014-165309    | OFF-BI-10001359       | 5        | 897.00    | 0.80     | -1,480.00  |
| CA-2014-139892    | TEC-MA-10000822       | 8        | 8,160.00  | 0.40     | -1,360.00  |
| US-2017-120390    | OFF-BI-10004995       | 4        | 1,633.00  | 0.70     | -1,307.00  |

**Insight:**
> These are the top loss-making orders in the dataset:
>
> - Many high-discount orders (50–80%) are **driving significant losses**, with profits negative by thousands of dollars per order.
> - Technology and Office Supplies products appear frequently among the highest-loss items.
>
> Recommendations:
>
> - **Review discount policies**, especially at 70–80% levels that consistently create losses.
> - Implement stricter approval workflows for large discounts on high-value items.
> - Analyze product-level margins to set more sustainable discount ceilings.


# 13. CUSTOMER LIFETIME VALUE (CLV)
SELECT C.CustomerID, C.CustomerName, ROUND(SUM(O.Sales), 2) AS CustomerLifetimeValue
FROM Orders O
JOIN Customers C ON O.CustomerID = C.CustomerID
GROUP BY C.CustomerID, C.CustomerName
ORDER BY CustomerLifetimeValue DESC;

| CustomerID | CustomerName     | CustomerLifetimeValue |
|------------|------------------|-----------------------|
| KL-16645   | Ken Lonsdale     | 411,075.00            |
| SM-20320   | Sean Miller      | 375,630.00            |
| SV-20365   | Seth Vernon      | 367,104.00            |
| GT-14710   | Greg Tran        | 342,809.00            |
| JL-15835   | John Lee         | 333,166.00            |
| EH-13765   | Edward Hooks     | 330,016.00            |
| SC-20095   | Sanjit Chand     | 311,190.00            |
| CL-12565   | Clay Ludtke      | 304,668.00            |
| AB-10105   | Adrian Barton    | 289,520.00            |
| RB-19360   | Raymond Buch     | 272,106.00            |
| ZC-21910   | Zuschuss Carroll | 248,868.00            |
| PP-18955   | Paul Prost       | 246,636.00            |
| JD-15895   | Jonathan Doherty | 243,488.00            |
| ME-17320   | Maria Etezadi    | 234,630.00            |
| SE-20110   | Sanjit Engle     | 231,971.00            |
| KD-16495   | Keith Dawkins    | 229,152.00            |
| TC-20980   | Tamara Chand     | 228,600.00            |

**Insight:**
> Customer Lifetime Value (CLV) analysis highlights the most valuable customers:
>
> - **Ken Lonsdale** tops the list with over \$411K in lifetime value.
> - Multiple customers have CLVs exceeding \$300K, indicating a strong base of high-value repeat buyers.
>
> Recommendations:
>
> - Prioritize **relationship management and loyalty programs** for top customers.
> - Develop **personalized marketing strategies** to retain these high-CLV customers.
> - Consider **upselling and cross-selling opportunities** to further grow their lifetime value.


# 14. YEARLY SALES AND PROFIT TREND
SELECT YEAR(OrderDate) AS Year, ROUND(SUM(Sales), 2) AS TotalSales, ROUND(SUM(Profit), 2) AS TotalProfit
FROM Orders
GROUP BY Year
ORDER BY Year;

| Year | TotalSales  | TotalProfit |
|------|-------------|-------------|
| 2014 | 484,255.00  | 49,520.00   |
| 2015 | 470,560.00  | 61,606.00   |
| 2016 | 609,255.00  | 81,790.00   |
| 2017 | 733,284.00  | 93,431.00   |

**Insight:**
> Year-over-year analysis reveals strong growth trends:
>
> - **Total sales increased consistently**, from ~\$484K in 2014 to over \$733K in 2017.
> - **Total profit also improved steadily**, nearly doubling from ~\$49K in 2014 to ~\$93K in 2017.
>
> Recommendations:
>
> - **Maintain momentum** with effective sales and marketing strategies.
> - **Analyze drivers of profit growth** to reinforce successful practices.
> - Invest in scaling operations to support continued growth while safeguarding margins.


# AUTHOR
## MOHAMED DILROSE P M
