# Local Analytics Data Warehouse (DuckDB)

## Project Overview
This project demonstrates the design and implementation of a local analytics data warehouse built using **DuckDB**. Originally designed as a final capstone for a Data Warehouse Fundamentals curriculum, I migrated the architecture out of traditional cloud/row-based systems into a modern, columnar, in-process database to optimize for local analytical performance (OLAP).

## Tech Stack & Core Concepts
* **Database Engine:** DuckDB
* **Language:** ANSI SQL
* **Data Modeling:** Kimball Star Schema methodology
* **Optimization:** Columnar storage & vector execution

## Data Architecture & Schema Design
The data warehouse is optimized for business intelligence and reporting using a centralized **Star Schema**. This design minimizes complex table joins and speeds up analytical query performance.

* **Fact Tables:** 
  * `FactSales` — Stores transactional metrics, numeric KPIs, and foreign keys. 
* **Dimension Tables:** 
  * `MyDimDate` — Conformed dimension tracking granular time components (Year, Quarter, Month, Weekday, etc.).
  * `DimProduct` — Provides context around inventory attributes, categorization, and item descriptions.
  * `DimCustomerSegment` — Store customer segment-related information.




 ## Key Business Queries & Insights

### 1. Top 5 Performing Products
This analytical query determines which inventory categories drove the most significant chunk of revenue.

\`\`\`sql
SELECT 
               p.producttype,
               SUM(price_perunit*quantitysold) AS total_revenue
           FROM FactSales f
           JOIN DimProduct p ON f.productid = p.productid
           GROUP BY 1
           ORDER BY total_revenue DESC
           LIMIT 5;
\`\`\`

### 2. Top City in Q1 2019
This query determines which city drove the most significant chunk of revenue in Q1 2019.

\`\`\`sql
SELECT 
               c.city, 
               SUM(price_perunit * quantitysold) AS total_revenue 
           FROM FactSales f 
           JOIN DimCustomerSegment c ON f.segmentid = c.segmentid 
           JOIN DimDate d ON f.dateid = d.dateid 
           WHERE d.quartername = 'Q1'  -- Fixed: Single quotes for text strings
             AND d.year = 2019 
           GROUP BY 1 
           ORDER BY total_revenue DESC 
           LIMIT 5;

\`\`\`

## Setup and Replication
To instantiate this data warehouse locally, ensure you have the DuckDB CLI installed and execute:

\`\`\`bash
# Create a new local database instance initialized with the schema
duckdb pracproj.db -init schema.sql
\`\`\`
