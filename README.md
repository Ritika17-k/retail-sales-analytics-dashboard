# Retail Sales Analytics Dashboard

An end-to-end retail sales analysis project using **SQL, Python, and Power BI** to explore sales performance, profitability, product categories, regional trends, and customer segments.

## Python Analysis

- [View Jupyter Notebook](data_exploration.ipynb)
- [View Complete Analysis and Visualizations](data_exploration.html)

## Project Overview

This project analyses the Sample Superstore retail dataset covering transactions from 2014 to 2017. The objective is to understand business performance, identify profitable and loss-making areas, and generate insights that can support better business decisions.

The analysis combines SQL-based querying, Python exploratory data analysis, and interactive Power BI visualisations.

## Business Problem

Retail businesses need to understand more than just their total revenue. High sales do not necessarily translate into high profits, and excessive discounting or poor product performance can negatively affect profitability.

This project addresses the following business questions:

- How are sales and profits changing over time?
- Which product categories generate the highest revenue?
- Which categories and sub-categories contribute most to profitability?
- Which regions have profitability challenges?
- How does discounting relate to profit?
- Which areas of the business require further investigation?

## Dataset Information

| Attribute | Details |
|---|---|
| Dataset | Sample Superstore |
| Period | 2014–2017 |
| Total records | 9,994 |
| Total columns | 21 |
| Business domain | Retail and E-commerce |
| Analysis level | Orders, products, customers and regions |

The dataset contains information about orders, sales, profit, discounts, products, categories, customers, geographical regions and shipping.

## Tools and Technologies

| Tool | Purpose |
|---|---|
| SQL Server (T-SQL) | Data querying, aggregations and analytical queries |
| Python | Exploratory data analysis |
| Pandas & NumPy | Data manipulation and analysis |
| Matplotlib & Seaborn | Data visualisation |
| Power BI | Interactive dashboards and business reporting |
| Git & GitHub | Project version control and documentation |

## Project Workflow

1. **Data Exploration:** Examined the retail dataset to understand its structure, variables and business dimensions.
2. **Data Analysis using SQL:** Used SQL queries, aggregations and window functions to investigate sales, profit and business performance.
3. **Python Analysis:** Used Pandas and NumPy for data analysis and explored patterns using visualisations.
4. **Power BI Reporting:** Developed dashboard pages containing KPI cards, trend analysis, category comparisons, profitability analysis and interactive filters.
5. **Business Insights:** Examined category performance, regional profitability and the relationship between discounts and profit.

## Dashboard Preview

### 1. Retail Sales Analytics – Overview

![Retail Sales Analytics Overview](images/retail-sales-overview.png)

The overview dashboard presents key business performance indicators:

**Key Performance Indicators**

| KPI | Reported Value |
|---|---:|
| Total Sales | $2.3M |
| Total Profit | $286.40K |
| Profit Margin | 12.47% |
| Total Orders | 5K |
| Average Order Value | $458.6 |

**Visualisations included:**
- Total Sales by Year and Month
- Total Sales by Category
- Profit by Category
- Category, Region and Segment filters
- Date range filtering

### 2. Category & Profitability Analysis

![Category and Profitability Analysis](images/category-profitability.png)

This dashboard provides a deeper understanding of category and sub-category performance.

**Visualisations included:**
- Sales and Profit by Category
- Profit Margin by Sub-Category
- Discount versus Profit analysis
- Category, Region and Segment filters
- Date range filtering

The sub-category analysis highlights differences in profitability, including negative profit margins for Tables, Bookcases and Supplies.

## Key Business Insights

1. **Technology leads category profitability:** Technology generates approximately $145K in profit, making it the highest-profit category in the dashboard.
2. **Office Supplies performs strongly:** Office Supplies contributes approximately $122K in profit.
3. **Furniture requires profitability attention:** Despite generating approximately $742K in sales, Furniture contributes only around $18K in profit.
4. **Negative sub-category margins:** Tables, Bookcases and Supplies show negative profit margins, indicating areas that require further investigation.
5. **Discount and profitability relationship:** The discount-versus-profit visualisation helps examine how profitability varies at different discount levels.
6. **Regional performance:** The analysis identified profitability concerns in Texas and Ohio, highlighting opportunities for regional business review.

## Repository Structure

```text
retail-sales-analytics-dashboard/
│
├── data/
│   └── Dataset files
│
├── notebook/
│   └── data_exploration.ipynb
│
├── superstore_queries.sql
│
├── images/
│   ├── retail-sales-overview.png
│   └── category-profitability.png
│
└── README.md
```

## How to Explore the Project

**1. Clone the repository**

```bash
git clone https://github.com/Ritika17-k/retail-sales-analytics-dashboard.git
```

**2. Navigate to the project directory**

```bash
cd retail-sales-analytics-dashboard
```

**3. Explore the SQL analysis**

Open `superstore_queries.sql` using SQL Server Management Studio or another compatible SQL environment.

**4. Explore the Python analysis**

Install the required libraries:

```bash
pip install pandas numpy matplotlib seaborn jupyter
```

Launch Jupyter Notebook:

```bash
jupyter notebook
```

Open `notebook/data_exploration.ipynb` and execute the analysis after configuring the dataset path.

**5. Explore the dashboard**

Refer to the dashboard screenshots in the `images/` directory for the visual reporting and analytical findings.

## Project Outcomes

- Analysed 9,994 retail transactions spanning four years.
- Explored sales and profitability using SQL and Python.
- Developed interactive Power BI reporting across multiple analytical dimensions.
- Identified category-level and sub-category-level profitability differences.
- Highlighted potential areas for business improvement through data analysis.

## Author

**Ritika Mishra**

BE – Information Technology  
Shree L. R. Tiwari College of Engineering

---

*This project was developed as a practical application of SQL, Python, data analysis and business intelligence techniques.*
