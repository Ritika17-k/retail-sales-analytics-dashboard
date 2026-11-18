# Power BI Dashboard

This folder holds the Power BI side of the project.

## What's here
- `dax_measures.dax` — starter DAX: a calculated Date table, core KPI measures
  (Total Sales, Total Profit, Average Order Value, Profit Margin %, Average
  Discount %), time-intelligence measures (YTD, MoM growth, YoY growth), and
  ranking helpers for top products/customers.

## What to add once the .pbix is ready
- `dashboard.pbix` — the Power BI file itself
- `screenshots/` — one PNG per page (Overview, Category, Regional, Customer/Product,
  Time Trend)
- `dashboard_demo.gif` — a short screen recording of the interactivity (slicers,
  drill-through, tooltips) for the main README

## Model notes
- Current build: a single flat `Superstore` table with measures attached directly to it.
- Before building out further pages, relate the `DateTable` in `dax_measures.dax`
  to `Superstore[Order_Date]` (1-to-many) and mark it as the official Date table
  (Modeling > Mark as Date Table). This fixes time-intelligence measures that
  behave unreliably on a flat table once a Year slicer is added.
- Move the measures listed above into a dedicated blank table (e.g. `_Measures`)
  via Home Table in the Properties pane, and group them into display folders
  (KPIs, Time Intelligence, Rankings) for a cleaner field list.
