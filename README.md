# NYC Transit Accessibility Dashboard

An end-to-end data analytics project analyzing accessibility disparities across NYC transit using Python, SQL, and Power BI.

---

## Overview

This project evaluates accessibility across NYC subway stations to determine whether ADA compliance at the asset level translates into real accessibility at the station level.

Using station, entrance, and elevator datasets, I built a full pipeline including data cleaning, SQL analysis, and an interactive Power BI dashboard.

---

## Objective

To measure accessibility across NYC transit boroughs and identify gaps between ADA compliance and actual accessibility coverage.

---

## Tools Used

* Python (Pandas, Matplotlib)
* SQL (SQLite)
* Power BI
* Data Cleaning & Feature Engineering

---

## Workflow

1. Loaded raw station, entrance, and elevator datasets
2. Cleaned and standardized borough and accessibility fields
3. Created accessibility and ADA compliance metrics
4. Stored cleaned data in SQL for structured querying
5. Ran SQL aggregation queries for borough-level insights
6. Built a Power BI dashboard to visualize results

---

## Key Metrics

* **Accessibility %** = Accessible Stations / Total Stations
* **ADA Asset %** = ADA-Compliant Assets / Total Assets
* **Accessibility Gap** = ADA Asset % − Accessibility %

---

## Key Findings

* Manhattan has the highest accessibility percentage
* Brooklyn has the lowest accessibility despite having the most stations
* Overall system accessibility is ~33%
* Correlation between ADA compliance and accessibility is **-0.713**
* Higher ADA compliance does not necessarily lead to better accessibility coverage

---

## Dashboard Preview

![Dashboard](images/dashboard-preview.png.png)
---

## Project Structure

```
nyc-transit-accessibility-dashboard/
│
├── powerbifinal.ipynb
├── nyc_transit_accessibility_dashboard.pdf
│
├── data/
│   ├── transit_borough_summary.csv
│   ├── stations_clean.csv
│   ├── elevators_clean.csv
│   └── sql_outputs.csv
│
├── images/
│   └── dashboard-preview.png
```

---

## Insight

This project highlights a key transit equity issue: improving ADA compliance alone does not guarantee widespread accessibility. Infrastructure improvements must focus on expanding access coverage across underserved areas.

---

## Author

Jaden Boothe
