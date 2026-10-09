# Retail Sales & Profitability Analysis

## Project Overview

This project is an end-to-end retail sales analytics project built using **SQL and Power BI**.

The goal was to analyze a fictional retail company's sales data and identify business insights related to revenue, profit, customers, products, store locations, sales channels, discounts, and returns.

The project includes data cleaning, relational data modelling, SQL analysis, DAX measures, and an interactive Power BI dashboard.

---

## Business Questions

The analysis answers questions such as:

- Which product categories generate the most revenue and profit?
- Which products are the top performers?
- Which store locations generate the highest revenue?
- Which customer segments contribute the most revenue?
- How do Store and Online sales channels compare?
- How does revenue change month by month?
- How do discounts affect profitability?
- What percentage of orders are returned?
- What is the company's average order value and profit margin?

---

## Dataset

The project contains four tables:

### FactSales

Transaction-level sales table.

**Grain:** One row represents one product line within an order.

Because one order can contain multiple products, the same `OrderID` can appear on multiple rows.

### DimCustomers

Contains customer information such as:

- Customer ID
- Customer Name
- Segment
- City
- State
- Region

### DimProducts

Contains product information such as:

- Product ID
- Product Name
- Category
- Subcategory
- Unit Price
- Unit Cost

### DimStores

Contains store information such as:

- Store ID
- Store Name
- City
- State
- Region

---

## Dataset Size

- 705 sales line records
- 360 unique orders
- 120 customers in the customer dimension
- 113 customers with sales transactions
- 24 products
- 8 stores

---

## Tools & Technologies

- **SQL:** MySQL
- **Business Intelligence:** Power BI
- **Data Transformation:** Power Query
- **Data Modelling:** Star Schema
- **Analytics:** DAX
- **Spreadsheet Analysis:** Microsoft Excel

---

## Data Model

The Power BI model follows a star-schema design.

```text
DimCustomers (1) ───── (*)
                       |
DimProducts  (1) ───── (*) FactSales
                       |
DimStores    (1) ───── (*)

Data Cleaning
Power Query was used to prepare the dataset before analysis.
Cleaning steps included:
- Trimming and cleaning customer names
- Standardizing city capitalization
- Handling missing payment methods
- Checking and correcting data types
- Preserving repeated Order IDs because FactSales is stored at product-line grain

SQL Analysis
SQL was used to analyze:
- Overall business KPIs
- Category performance
- Top 5 products
- Store-city performance
- Customer-segment performance
- Monthly revenue and profit trends
- Returned vs non-returned sales
- Discount impact
- Online vs Store channel performance

SQL concepts used include:
- INNER JOIN
- GROUP BY
- ORDER BY
- SUM()
- COUNT()
- COUNT(DISTINCT)
- DATE_FORMAT()
- LIMIT
- Aggregate calculations
The complete analysis is available in:
sql/retail_sales_analysis.sql
Power BI Measures

Key DAX measures include:
- Total Revenue
- Total Profit
- Unique Orders
- Unique Customers
- Average Order Value
- Profit Margin %
- Returned Revenue
- Returned Orders
- Return Rate %
- Electronics Revenue
- Company Revenue
- City Revenue Share %

DAX functions used include:
- SUM()
- DISTINCTCOUNT()
- DIVIDE()
- CALCULATE()
- ALL()

Key Business KPIs
KPI	Result
Total Revenue	₹15,276,715
Total Profit	₹3,869,395
Unique Orders	360
Unique Customers	113
Average Order Value	₹42,435.32
Profit Margin	25.33%
Return Rate	8.89%


Key Insights
- Electronics is the highest-revenue category and also generates the highest total profit.
- Laptop Air 13 is the highest-revenue product.
- Pune is the highest-revenue store city, generating approximately ₹2.45 million.
- The Consumer segment generates the highest customer-segment revenue.
- The Store channel generates more revenue and profit than the Online channel.
- August is the highest-revenue month, generating approximately ₹1.94 million in revenue.
- Higher discount percentages are associated with lower profit margins.
- The overall order return rate is 8.89%.

Power BI Dashboard
The dashboard contains:
- Revenue, Profit, Orders, Customers, AOV and Profit Margin KPI cards
- Revenue & Profit by Category
- Top 5 Products by Revenue
- Revenue by Store City
- Monthly Revenue & Profit Trend
- Revenue & Profit by Customer Segment
- Revenue & Profit by Sales Channel
- Discount Impact on Profitability
- Revenue by Return Status
- Interactive Category, City, Segment and Channel slicers

Project Structure
Retail-Sales-Analytics/
│
├── data/
│   ├── FactSales.csv
│   ├── DimCustomers.csv
│   ├── DimProducts.csv
│   └── DimStores.csv
│
├── sql/
│   └── retail_sales_analysis.sql
│
├── powerbi/
│   └── Retail_Sales_Dashboard.pbix
│
├── screenshots/
│   └── Dashboard.png
│
└── README.md



Skills Demonstrated
This project demonstrates practical experience with:
- SQL business analysis
- Data cleaning
- Power Query
- Star-schema data modelling
- Table relationships
- DAX measures
- Filter context
- Power BI dashboard development
- KPI reporting
- Data visualization
- Business insight generation



Author
Shubham Chaurasiya
BSc Computer Science
Mumbai, Maharashtra
- LinkedIn: linkedin.com/in/shubham-chaurasiya-77213b337
- GitHub: github.com/shubham230506-crypto