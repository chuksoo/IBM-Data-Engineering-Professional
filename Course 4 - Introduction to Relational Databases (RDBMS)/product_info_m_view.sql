CREATE MATERIALIZED VIEW IF NOT EXISTS product_info_m_view 
AS
	SELECT 
		product.product_name
		, product.description
		, product_type.product_category
	FROM product
	JOIN product_type
	ON product.product_type_id = product_type.product_type_id;
	
-- To load data into materialized views:
REFRESH MATERIALIZED VIEW product_info_m_view;