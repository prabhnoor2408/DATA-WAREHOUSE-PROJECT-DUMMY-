---THIS SCRIPT CHECK FOR DATA QUALITY ISSUES

--crm TABLE 1(crm_cust_info)
--CHECK NULLS AND DUPLICATES IN PRIMARY KEY
--EXPECTATION - NO RESULT
SELECT cst_id, COUNT(*)
FROM silver.crm_cust_info
GROUP BY cst_id
HAVING COUNT(*)>1 OR cst_id IS NULL
ORDER BY cst_id;

--CHECK FOR UNWANTED SPACES 
--EXPECTATION - NO RESULT
SELECT cst_firstname,cst_lastname
FROM silver.crm_cust_info
WHERE cst_firstname!= TRIM(cst_firstname) OR cst_lastname!=TRIM(cst_lastname)

--DATA STANDARDISATION AND CONSISTENCY
SELECT DISTINCT cst_material_status FROM silver.crm_cust_info
SELECT DISTINCT cst_gndr FROM silver.crm_cust_info


--crm TABLE 2(crm_prd_info)
--CHECK NULLS AND DUPLICATES IN PRIMARY KEY
--EXPECTATION - NO RESULT
SELECT prd_id, COUNT(*)
FROM silver.crm_prd_info
GROUP BY prd_id
HAVING COUNT(*)>1 OR prd_id IS NULL
ORDER BY prd_id;

--CHECK FOR UNWANTED SPACES 
--EXPECTATION - NO RESULT
SELECT prd_nm
FROM silver.crm_prd_info
WHERE prd_nm!= TRIM(prd_nm) 

--CHECK FOR NULLS AND NEGATIVE NUMBERS IN prd_cost
--EXPECTATION - NO RESULT
SELECT prd_cost FROM silver.crm_prd_info
WHERE prd_cost IS NULL OR prd_cost<0

--DATA STANDARDISATION AND CONSISTENCY
SELECT DISTINCT prd_line FROM silver.crm_prd_info

--CHECK FOR INVALID DATES
-- 1.START DATE SHOULD NOT BE GREATER THAN END DATE
-- 2.NO OVERLAPPING BETWEEN DATES
-- 3. EACH RECORD MUST HAVE A START DATE
SELECT prd_start_dt,prd_end_dt FROM silver.crm_prd_info 
WHERE prd_start_dt>prd_end_dt

--crm TABLE 3(crm_sales_details)
--CHECK INVALID DATES
SELECT sls_order_dt FROM silver.crm_sales_details
WHERE (sls_order_dt IS NULL OR sls_order_dt=<0 OR LENGTH(CAST(sls_order_dt AS VARCHAR))!=8)
		AND (sls_order_dt>sls_ship_dt OR sls_order_dt>sls_due_dt )

SELECT sls_order_dt FROM silver.crm_sales_details
WHERE sls_order_dt>sls_ship_dt OR sls_order_dt>sls_due_dt 

--CHECK FOR BUSINESS RULES IN -: sls_sales,sls_quantity,sls_price
-- 1.sales = quantitiy*price
-- 2.these 3 numbers should not be 0,NULL or negative

SELECT sls_sales,sls_quantity,sls_price 
FROM silver.crm_sales_details
WHERE abs(sls_sales) != abs(sls_quantity)*abs(sls_price)

SELECT sls_sales
FROM silver.crm_sales_details
WHERE sls_sales IS NULL OR sls_sales<=0 

SELECT sls_quantity
FROM silver.crm_sales_details
WHERE sls_quantity IS NULL OR sls_quantity<=0  

SELECT sls_price
FROM silver.crm_sales_details
WHERE sls_price IS NULL OR sls_price<=0
