create or alter procedure bronze.load_bronze as 
begin
	DECLARE @start_time DATETIME ,@end_time DATETIME,@bronze_start_time DATETIME,@bronze_end_time DATETIME ;
	SET @bronze_start_time =GETDATE();
	begin try 
		print'=======================================================';
		print'LOADING BRONZE LAYER';
		print'=======================================================';

		print'-------------------------------------------------------';
		print'LOADING CRM TABLES ';
		print'-------------------------------------------------------';
	SET @start_time=GETdate();
	truncate table bronze.crm_cust_info;

	bulk insert bronze.crm_cust_info
	from 'C:\Users\VASHNAVI\Downloads\38833FF26BA1D.UnigramPreview_g9c9v27vpyspw!App\sql-data-warehouse-project-main\01_datasets\source_crm\cust_info.csv'
	with(
		firstrow =2,
		fieldterminator =',',
		tablock
	);
	SET @end_time=GETdate();
	print'>>load duration: '+ cast(DATEDIFF(second,@start_time,@end_time) AS VARCHAR) + 'seconds';
	print'------------------';

	SET @start_time=GETdate();

	truncate table bronze.crm_prd_info;

	bulk insert bronze.crm_prd_info
	from 'C:\Users\VASHNAVI\Downloads\38833FF26BA1D.UnigramPreview_g9c9v27vpyspw!App\sql-data-warehouse-project-main\01_datasets\source_crm\prd_info.csv'
	with(
		firstrow =2,
		fieldterminator =',',
		tablock
	);
	SET @end_time=GETdate();
	print'>>load duration: '+ cast(DATEDIFF(second,@start_time,@end_time) AS VARCHAR) + 'seconds';
	print'------------------';

	SET @start_time=GETdate();

	truncate table bronze.crm_sales_details;

	bulk insert bronze.crm_sales_details
	from 'C:\Users\VASHNAVI\Downloads\38833FF26BA1D.UnigramPreview_g9c9v27vpyspw!App\sql-data-warehouse-project-main\01_datasets\source_crm\sales_details.csv'
	with(
		firstrow =2,
		fieldterminator =',',
		tablock
	);
	SET @end_time=GETdate();
	print'>>load duration: '+ cast(DATEDIFF(second,@start_time,@end_time) AS VARCHAR) + 'seconds';
	print'------------------';

		print'-------------------------------------------------------';
		print'LOADING ERP TABLES ';
		print'-------------------------------------------------------';

	SET @start_time=GETdate();

	truncate table bronze.erp_CUST_AZ12;

	bulk insert bronze.erp_CUST_AZ12
	from 'C:\Users\VASHNAVI\Downloads\38833FF26BA1D.UnigramPreview_g9c9v27vpyspw!App\sql-data-warehouse-project-main\01_datasets\source_erp\CUST_AZ12.csv'
	with(
		firstrow =2,
		fieldterminator =',',
		tablock
	);
	SET @end_time=GETdate();
	print'>>load duration: '+ cast(DATEDIFF(second,@start_time,@end_time) AS VARCHAR) + 'seconds';
	print'------------------';


	SET @start_time=GETdate();

	truncate table bronze.erp_LOC_A101;

	bulk insert bronze.erp_lOC_A101
	from 'C:\Users\VASHNAVI\Downloads\38833FF26BA1D.UnigramPreview_g9c9v27vpyspw!App\sql-data-warehouse-project-main\01_datasets\source_erp\LOC_A101.csv'
	with(
		firstrow =2,
		fieldterminator =',',
		tablock
	);
	SET @end_time=GETdate();
	print'>>load duration: '+ cast(DATEDIFF(second,@start_time,@end_time) AS VARCHAR) + 'seconds';
	print'------------------';

	SET @start_time=GETdate();

	truncate table bronze.erp_PX_CAT_G1V2;

	bulk insert bronze.erp_PX_CAT_G1V2
	from 'C:\Users\VASHNAVI\Downloads\38833FF26BA1D.UnigramPreview_g9c9v27vpyspw!App\sql-data-warehouse-project-main\01_datasets\source_erp\PX_CAT_G1V2.csv'
	with(
		firstrow =2,
		fieldterminator =',',
		tablock
	);
	SET @end_time=GETdate();
	print'>>load duration: '+ cast(DATEDIFF(second,@start_time,@end_time) AS VARCHAR) + 'seconds';
	print'------------------';

end try 
begin catch
	print'=========================================='
	print'ERROR OCCURED DURING LOADING BRONZE LAYER'
	print'ERROR message'+ CAST (ERROR_NUMBER()AS VARCHAR); 
	print'=========================================='

end catch
SET @bronze_end_time=GETdate();
	print'>>bronze load duration: '+ cast(DATEDIFF(second,@bronze_start_time,@bronze_end_time) AS VARCHAR) + 'seconds';
	
end
