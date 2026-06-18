# E-Commerce Supply Chain & Delivery Performance Analysis

## 📊 Project Overview
This project presents an industry-standard, end-to-end data analytics workflow designed to evaluate the operational health of an e-commerce fulfillment network. By analyzing 5,000 recent shipments, the project accurately isolates internal warehouse processing bottlenecks from external carrier transit times to recover bleeding freight spend and resolve declining customer satisfaction.

## 📁 Repository Contents
This repository contains all the critical artifacts of the data analytics lifecycle:
* **`Business_Problem_Document.pdf`**: Outlines the core corporate objectives, operational pain points, and project scope.
* **`ecommerce_supply_chain_data.csv`**: Raw dataset containing 5,000 unique orders with multi-point transit timestamps, carrier splits, and freight costs.
* **`Supply_Chain_Delivery_Analysis.ipynb`**: Python Jupyter Notebook detailing data cleaning, handling missing value imputations, and feature engineering.
* **`supply_chain_queries.sql`**: Structured SQL scripts designed to run deep performance queries, isolate facility lags, and generate cost matrices.
* **`PowerBI_Dashboard_Guide.pdf`**: Comprehensive blueprint outlining the required Star Schema data model architecture, layout wireframes, and advanced DAX measures.
* **`Supply-Chain-Insights-and-Recommendations.pptx`**: Stakeholder presentation deck communicating core analytical findings and automated solutions.
* **`Solution_and_Insights_Report.pdf`**: Final comprehensive project report translating raw numbers into executive strategic plans.

## 🛠️ Tech Stack
* **Python** (Pandas, NumPy, Seaborn, Matplotlib): Data cleansing, outlier detection, processing vs. transit lag calculations, and exploratory data visualization.
* **SQL** (PostgreSQL/MySQL): Window functions, conditional aggregations, and subqueries to build deep-dive performance matrices.
* **Power BI**: Interactive executive tracking dashboard leveraging hierarchical drill-downs (Decomposition Trees) and time-series forecasting.

## 🚀 Methodology & Feature Engineering
1. **Data Prep & Cleaning:** Handled missing tracking attributes by applying localized median carrier cost distribution across 5,000 records. Standardized all schema variables to optimized `snake_case`.
2. **Operational Framework Definition:** Engineered dynamic tracking metrics:
   * `processing_time_days` = ($Ship\ Date - Order\ Date$) to isolate internal fulfillment efficiency.
   * `actual_transit_time_days` = ($Delivery\ Date - Ship\ Date$) to calculate courier efficiency.
   * `sla_breach` = Boolean indicator flagging transit delays exceeding the 5-day delivery window.
3. **Exploratory Analysis:** Ported processed flat files into a relational schema to cross-examine delivery velocity against carrier billing thresholds.
4. **Interactive Modeling:** Engineered dynamic DAX KPIs tracking On-Time Delivery (OTD) rates, rolling average shipping costs, and late shipment financial penalty metrics within Power BI.

## 💡 Key Insights
* **Carrier Performance Discrepancies:** A critical reliability gap was identified among partners. **USPS exhibited a ~23% late delivery rate**, severely depressing the aggregate OTD rate. Conversely, DHL led performance metrics at **95% OTD**, with FedEx holding steady at **90% OTD**.
* **Internal Warehouse Bottlenecks:** While overall processing was stable, the **IL-04 (Midwest) fulfillment center showed an internal processing variance of up to 5 days**, fundamentally guaranteeing an SLA breach before cargo ever reached the courier.
* **Regional Freight Cost Inefficiencies:** West Coast destination orders generated the highest average freight costs (**$29.40**) alongside the longest transit lags, uncovering a poorly optimized distribution matrix for western shipping volume.

## 🎯 Business Recommendations
* **Carrier Volume Reallocation:** Immediately redirect 15% of standard postal volume from USPS to FedEx or UPS. The minor upfront base-rate savings of USPS are completely wiped out by the compounding cost of order refunds and support center overhead stemming from their 23% delay rate.
* **Warehouse Optimization (IL-04):** Deploy a dedicated logistics operations team to warehouse IL-04 to run a time-in-motion study. Introduce optimized pick-and-pack warehouse automation to stabilize processing velocity strictly under a 2-day ceiling.
* **Fulfillment Network Expansion:** Establish a strategic Third-Party Logistics (3PL) center in California or Nevada to service West Coast demand locally, eliminating cross-country long-haul freight costs and expanding delivery speed.

## 📄 License
This project is licensed under the MIT License - see the LICENSE file for details.
