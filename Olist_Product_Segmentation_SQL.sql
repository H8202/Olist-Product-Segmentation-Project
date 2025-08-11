WITH items_with_category AS (
    SELECT 
        oi.order_id,
        oi.product_id,
        p.category_name,
        r.review_score,
        oi.price, 
        oi.freight_value,
        o.order_purchased_time,
        o.delivered_date,
        o.est_delivery_date,
		o.order_status,
        oi.shipping_limit_date
    FROM order_items oi
    INNER JOIN products p
        ON p.product_id = oi.product_id
    LEFT JOIN order_reviews r
        ON oi.order_id = r.order_id 
    INNER JOIN orders o
        ON oi.order_id = o.order_id
),

product_metrics AS (
    SELECT 
        product_id,
        category_name,

        -- Sales & orders
        COUNT(*) AS total_items_sold, 
        COUNT(DISTINCT order_id) AS total_orders,
        
        -- Revenue
        SUM(price + freight_value) AS total_revenue,
        ROUND(SUM(price + freight_value) / NULLIF(COUNT(DISTINCT order_id), 0), 2) 
		AS aov,
        
        -- Review metrics
        ROUND(AVG(review_score), 2) AS avg_review_score,
        ROUND(100.0 * SUM(CASE WHEN review_score <= 2 THEN 1 ELSE 0 END) / 
		NULLIF(COUNT(review_score), 0), 2) AS low_review_perc,
        
        -- Delivery performance
        ROUND(AVG(EXTRACT(day FROM delivered_date - order_purchased_time)), 2) 
		AS avg_delivery_time,
        ROUND(AVG(EXTRACT(day FROM delivered_date - est_delivery_date)), 2) 
		AS avg_delivery_delay,
        
        -- Price
        ROUND(AVG(price), 2) AS avg_product_price,
        
        -- Freight cost % of price
        ROUND(AVG(freight_value / NULLIF(price, 0)), 2) AS avg_freight_ratio,
        
        -- Lead time (purchase to shipping limit)
        ROUND(AVG(EXTRACT(day FROM shipping_limit_date - order_purchased_time)), 2) 
		AS avg_lead_time,

		-- sales frequency per product

		COUNT(Distinct order_id) as sales_freq,
		

		-- price variability

		STDDEV(price) as price_var
		
    FROM items_with_category
    GROUP BY product_id, category_name
)


SELECT * 
FROM product_metrics
ORDER BY total_items_sold DESC;

