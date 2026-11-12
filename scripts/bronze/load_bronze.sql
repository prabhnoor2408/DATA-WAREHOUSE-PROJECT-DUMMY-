/* This script loads and truncates all data in bronze tables*/

TRUNCATE TABLE  bronze.crm_cust_info;
--This copy statements have to be run in 'PSQL TOOL' only then these will work
\COPY bronze.crm_cust_info(cst_id,cst_key,cst_firstname,cst_lastname,cst_material_status,cst_gndr,cst_create_date)
FROM 'C:\Users\prabh\OneDrive\Desktop - Copy\skills\SQL\Baraa\sql-data-warehouse-project\sql-data-warehouse-project\datasets\source_crm\cust_info.csv'
WITH (FORMAT csv,HEADER true,DELIMITER ',');

TRUNCATE TABLE  bronze.crm_prd_info;
\COPY bronze.crm_prd_info(prd_id,prd_key,prd_nm,prd_cost,prd_line,prd_start_dt,prd_end_dt)
FROM 'C:\Users\prabh\OneDrive\Desktop - Copy\skills\SQL\Baraa\sql-data-warehouse-project\sql-data-warehouse-project\datasets\source_crm\prd_info.csv'
WITH (FORMAT csv,HEADER true,DELIMITER ',');

TRUNCATE TABLE  bronze.crm_sales_details;
\COPY bronze.crm_sales_details(sls_ord_num,sls_prd_key,sls_cust_id,sls_order_dt,sls_ship_dt,sls_due_dt,sls_sales,sls_quantity,sls_price)
FROM 'C:\Users\prabh\OneDrive\Desktop - Copy\skills\SQL\Baraa\sql-data-warehouse-project\sql-data-warehouse-project\datasets\source_crm\sales_details.csv'
WITH (FORMAT csv,HEADER true,DELIMITER ',');

TRUNCATE TABLE  bronze.erp_CUST_AZ12;
\COPY bronze.erp_CUST_AZ12(CID,BDATE,GEN)
FROM 'C:\Users\prabh\OneDrive\Desktop - Copy\skills\SQL\Baraa\sql-data-warehouse-project\sql-data-warehouse-project\datasets\source_erp\CUST_AZ12.csv'
WITH (FORMAT csv,HEADER true,DELIMITER ',');

TRUNCATE TABLE  bronze.erp_LOC_A101;
\COPY bronze.erp_LOC_A101(CID,CNTRY)
FROM 'C:\Users\prabh\OneDrive\Desktop - Copy\skills\SQL\Baraa\sql-data-warehouse-project\sql-data-warehouse-project\datasets\source_erp\LOC_A101.csv'
WITH (FORMAT csv,HEADER true,DELIMITER ',');

TRUNCATE TABLE  bronze.erp_PX_CAT_G1V2;
\COPY bronze.erp_PX_CAT_G1V2(ID,CAT,SUBCAT,MAINTAINENCE)
FROM 'C:\Users\prabh\OneDrive\Desktop - Copy\skills\SQL\Baraa\sql-data-warehouse-project\sql-data-warehouse-project\datasets\source_erp\PX_CAT_G1V2.csv'
WITH (FORMAT csv,HEADER true,DELIMITER ',');
