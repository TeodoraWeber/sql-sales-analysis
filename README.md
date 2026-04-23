# 📊 SQL Sales Analysis (SuperStore Dataset)

## 📌 Overview
This project performs a comprehensive sales analysis using a **PostgreSQL** database. The goal is to extract key business metrics from the "SuperStore" dataset, covering everything from basic sales totals to intermediate performance ranking using Window Functions.

## 🎯 Objectives
*   Calculate total revenue and record volume.
*   Identify high-performing regions and product categories.
*   Analyze customer segments and sub-category profitability.
*   Rank products using advanced SQL techniques (Window Functions).

## 🗂️ Dataset Description
The dataset contains transaction records with the following attributes:


| Column | Description |
| :--- | :--- |
| `Ship_Mode` | Delivery method |
| `Segment` | Customer segment (Consumer, Corporate, etc.) |
| `Country/City/State` | Geographical location |
| `Region` | Broad geographical area |
| `Category` | Main product category |
| `Sub_Category` | Specific product sub-group |
| `Sales` | Sale value per transaction |
| `Quantity` | Number of items sold |
| `Discount` | Discount applied |
| `Profit` | Net profit per sale |

## 🛠️ Tools & Technologies
*   **Database:** PostgreSQL
*   **Tool:** pgAdmin 4 / DBeaver / SQL Shell
*   **Language:** SQL (Postgres dialect)

## 📊 Key SQL Queries

### 1. Basic Metrics (Total Sales & Records)
```sql
-- Total Sales
SELECT SUM("Sales") AS TOTAL_SALES 
FROM SUPER_STORE;

-- Record Count
SELECT COUNT(*) AS TOTAL_RECORDS 
FROM SUPER_STORE;
```

### 2. Performance by Category & Region
```sql
-- Sales by Region
SELECT "Region", SUM("Sales") AS TOTAL_SALES
FROM SUPER_STORE
GROUP BY "Region"
ORDER BY TOTAL_SALES DESC;
```

### 3. Top 5 Sub-Categories (Window Function)
```sql
-- Using RANK() to identify top performance
SELECT * FROM (
    SELECT 
        "Sub_Category", 
        SUM("Sales") AS TOTAL_SALES,
        RANK() OVER (ORDER BY SUM("Sales") DESC) AS RNK
    FROM SUPER_STORE
    GROUP BY "Sub_Category"
) T 
WHERE RNK <= 5;
```

## 🔍 Key Insights
*   **Region:** Identified which geographical areas generate the most revenue.
*   **Segments:** Pinpointed the customer segment (e.g., Consumer/Corporate) with the highest contribution.
*   **Profitability:** Analyzed whether the highest-selling sub-categories are also the most profitable.

## 🚀 How to Run the Project
1.  **Clone the repository:**
    ```bash
    git clone https://github.com
    ```
2.  **Setup Database:** Create a table named `SUPER_STORE` in PostgreSQL and import your data.
3.  **Run Queries:** Execute the scripts found in the `queries/` folder.

## 📁 Project Structure
```text
sql-sales-analysis/
│
├── queries/           # All SQL scripts (Basic & Intermediate)
├── results/           # Screenshots of query outputs
└── README.md          # Project documentation
```
