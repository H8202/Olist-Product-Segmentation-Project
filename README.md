# Olist Product Segmentation – Clustering & Actionable Insights

## Project Overview
This project uses **Brazilian e-commerce (Olist) data from Kaggle** to segment products based on profitability, customer satisfaction, and operational efficiency.  
The goal is to **uncover actionable business strategies** for each segment — demonstrating skills in **SQL (data extraction & feature engineering), Python (EDA, ML), and business analytics**. This project strives to demonstrate end-to-end data skills relevant to Industrial Engineering and Data Science — from data extraction to statistical analysis and segmentation modeling.

---

## Objectives
- Build a **feature table in PostgreSQL** from raw transactional data using advanced SQL queries.
- Preprocess and clean aggregated data for modeling.
- Engineer meaningful KPIs combining multiple metrics.
- Apply **KMeans** clustering and dimensionality reduction.
- Translate clusters into **actionable operational & marketing strategies**.

---

## Data Source
- **Dataset:** [Olist Brazilian E-Commerce Dataset](https://www.kaggle.com/datasets/olistbr/brazilian-ecommerce)
- **Tables Used:** `order_items`, `products`, `order_reviews`, `orders`

---

## Tech Stack & Tools
- **SQL (PostgreSQL / pgAdmin4):** Multi-CTE queries, aggregations, joins, feature engineering
- **Python Libraries:** pandas, NumPy, scikit-learn, matplotlib, seaborn
- **ML Techniques:** Data scaling, correlation analysis, pipelines, KMeans clustering, silhouette analysis
- **Visualization:** Heatmaps, violin plots, cluster plots

---

## Methodology

### 1. **SQL Feature Engineering**
Created a **feature table** in PostgreSQL using `WITH` clauses and aggregations to compute:
- **Sales & Revenue Metrics:** total items sold, total orders, total revenue, AOV
- **Customer Satisfaction Metrics:** avg review score, % low reviews
- **Operational Metrics:** avg delivery time, avg delay, avg lead time
- **Cost Metrics:** freight-to-price ratio
- **Pricing Metrics:** avg product price, price variability
- **Sales Frequency:** distinct order counts per product

### 2. **Python Data Cleaning & Preprocessing**
- Removed categories with fewer than 10 orders
- Handled missing values
- Dropped redundant correlated features
- Scaled numerical features and applied log and power transformation for skewed distributions

### 3. **Feature Engineering (Python)**
- **Profit Index** = high revenue & low shipping cost share
- **Customer Satisfaction Index** = average review scores
- **Shipping Efficiency** = delivery + lead time metric

### 4. **Clustering**
- Determined optimal clusters using **Elbow** & **Silhouette** methods
- Selected **k=5** clusters
- Created a 3D scatter plot and violin plots to visualize clusters

### 5. **Business Insight Generation**
- Interpreted each cluster profile
- Recommended operational, pricing, and marketing strategies

---

## Key Results – Product Segments

| Cluster | Name | Characteristics | Suggested Actions |
|---------|------|-----------------|-------------------|
| 0 | **Consistently Mediocre** | Low to Average profit, satisfaction, efficiency | Holistic process improvement, customer experience initiative |
| 1 | **Service Stars, Profit Laggards** | High satisfaction & efficiency, low profit | Cut production costs, optimize pricing |
| 2 | **Profit Hunters, Experience Neglecters** | High profit, low service/efficiency | Improve delivery reliability, loyalty programs |
| 3 | **Efficient but Low-Value** | High efficiency, low satisfaction/profit | Reposition products, bundle promotions |
| 4 | **High Profit but Inefficient** | Profitable but slow/poor service | Optimize supply chain & fulfillment |

---

## Skills Demonstrated
- **SQL:** Multi-table joins, CTEs, aggregation, feature engineering
- **SQL Feature Engineering:** Designed and executed complex queries in PostgreSQL (via pgAdmin4) to aggregate sales, pricing, and review metrics per product
- **Exploratory Data Analysis (EDA):** Analyzed distributions, trends, and outliers using pandas, matplotlib, and seaborn
- **Data Cleaning & Preparation:** Handled missing values, removed irrelevant columns, standardized formats, and prepared the dataset for modeling
- **Feature Engineering:** Created custom metrics such as average delivery delay, freight-to-price ratio, price variability, and low-review percentage
- **Scaling and Preprocessing:** Applied StandardScaler(), FunctionTransformer(), PowerTransformer(), ColumnTransformer() to prepare data for modeling
- **Unsupervised Machine Learning:** Applied K-Means clustering to segment products into categories such as Service Stars, Profit Laggards, and Fast Movers
- **Data Visualization:** Produced violin plots, bar charts, heatmaps, and box plots to illustrate product differences between clusters
- **Business Insight Generation:** Interpreted clusters to suggest product strategy improvements for different segments
- **Industrial Engineering:** Operational KPI analysis, supply chain optimization insights

---

## Future Improvements
- Automate SQL extraction & Python modeling pipeline
- Test hierarchical clustering for alternative insights
- Build an interactive dashboard (Power BI or Plotly Dash) for real-time exploration

## License & Data Attribution
This project uses data from the [Olist Brazilian E-Commerce Dataset](https://www.kaggle.com/datasets/olistbr/brazilian-ecommerce) on Kaggle, 
licensed under the [Creative Commons Attribution-NonCommercial-ShareAlike 4.0 International License](https://creativecommons.org/licenses/by-nc-sa/4.0/).

You are free to:
- **Share** — copy and redistribute the material in any medium or format.
- **Adapt** — remix, transform, and build upon the material.

Under the following terms:
- **Attribution** — You must give appropriate credit to Olist.
- **NonCommercial** — You may not use the material for commercial purposes.
- **ShareAlike** — If you remix, transform, or build upon the material, you must distribute your contributions under the same license.

This project is intended **solely for educational and non-commercial purposes**.

