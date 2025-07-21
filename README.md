# Azure Database & Pipeline Optimization System 

## Project Overview 
This project demonstrates an end-to-end Data Engineering and DBA solution on Azure , focusing on: 
- Data ingestion from Azure Data Lake Storage to Azure SQL Database  
- Performance Tuning with query optimization and indexing 
- Cost Optimization using serverless compute & auto-pause features 
- Automation & Monitoring for real-time insights and alerts 

The project reflects real-world enterprise scenarios , showcasing both ETL pipelines and DBA optimization techniques , making it a perfect portfolio project for Data Engineer + SQL DBA roles . 

---

## Features Implemented 

### Data Engineering 
- Built a dynamic Azure Data Factory (ADF) pipeline using Lookup + ForEach + Copy Activity to load multiple CSV files into Azure SQL Database.
- Implemented parameterized pipelines for reusability and automation.
- Managed data consistency by introducing an alternative pipeline using Filter Activity to selectively reload failed datasets (Orders table).

### DBA & Performance Optimization 
- Captured query execution metrics (Elapsed Time & CPU Time) before and after optimization.
- Implemented non-clustered indexes for high-cost queries to improve performance.
- Designed and populated a PerformanceLog table to measure improvements and maintain auditability.

### Cost Optimization 
- Enabled Auto-Pause for idle Azure SQL Database to reduce costs.
- Switched from Serverless vCore to DTU-based tier for predictable cost management.

### Monitoring & Alerts 
- Configured Azure Monitor alerts for CPU utilization to track resource health.
- Integrated diagnostic settings for future insights and anomaly detection.

### Visualization 
- Created a PowerBI report




---

## Project Architecture 
 Azure Components Used:  
- Azure SQL Database (for structured data storage) 
- Azure Data Lake Gen2 (for raw data storage) 
- Azure Data Factory (for ETL pipeline orchestration) 
- Azure Monitor (for performance monitoring & alerts) 

---


## Steps Implemented in Project 

1. **Resource Setup**
    - Created Azure Resource Group , Azure SQL Database , Azure Data Lake Storage (ADLS Gen2) , and Azure Data Factory.
    - Structured storage with `raw` folder for CSVs and a mapping config file.
      <img width="50%" alt="rg-dataopsmonitor-dev" src="https://github.com/user-attachments/assets/ed8307aa-e4a4-49f5-bd85-95f8fdf68c1d" />
  

2. **ETL Pipeline Development**
    - Developed a dynamic pipeline in ADF:
      - Used Lookup to read file-to-table mapping from config CSV.
      - Used ForEach loop to iterate through mappings.
      - Parameterized source file path and target table name for dynamic ingestion.
    - Created an alternate pipeline with Filter Activity to:
      - Restrict reload to only the failed Orders table after a foreign key constraint error during the first run.
      - Prevent reloading Customers & Products again, ensuring data consistency and avoiding duplicates (similar to incremental load design).


3. **Database Design**
    - Created Customers , Orders , and Products tables with proper relationships.
    - Implemented foreign key constraints for referential integrity.

4. **Performance Tuning**
    - Executed complex queries involving large joins and aggregations.
    - Measured execution time & CPU time before optimization.
    - Added non-clustered indexes on critical columns (`customer_id`, `product_id`, `status`).
    - Logged before/after metrics in PerformanceLog for reporting.

5. **Cost Management**
    - Enabled Auto-Pause to suspend the DB during inactivity.
    - Changed to DTU-based pricing tier for predictable billing.

6. **Monitoring**
    - Configured CPU utilization alerts in Azure Monitor.

7. **Reporting**
    - Integrated with Power BI for visualization of performance and cost metrics.


---

## Key Queries Tested 
- **PendingOrdersWithProductDetails** : Join across Orders, Customers, Products 
- **CategoryWiseSalesSummary** : Aggregation by category 
- **CustomerPurchaseHistory** : Customer-level purchase summary 
- **TopSpendingCustomers** : Top 50 spenders 
- **CountryAndSalesBreakdown** : Revenue by country & status 

---

## Performance Improvement Snapshot 
| QueryName             | ElapsedTimeBefore | ElapsedTimeAfter | Improvement% |
|----------------------------------|--------------|-------------|-------------|
| PendingOrdersWithProductDetails | 6 ms    | 6 ms    | 0%     |
| CategoryWiseSalesSummary    | 12 ms    | 11 ms   | 8.33%   |
| CustomerPurchaseHistory     | 13 ms    | 11 ms   | 15.38%   |
| TopSpendingCustomers      | 12 ms    | 7 ms    | 41.67%   |
| CountryAndSalesBreakdown    | 24 ms    | 15 ms   | 37.50%   |

Note: Detailed execution time and screenshots for each query(before & after indexing) are available in the Screenshot folder:
- Query-ExecutionTime(ms)-BeforeTuning
- Query-ExecutionTime(ms)-AfterTuning
---

## Challenges Faced & Fixes 
- Firewall & SSMS Connection Issue → Resolved by adding client IP in Azure SQL Firewall settings. 
- Foreign Key Violation during Orders load → Fixed by Filter Activity pipeline . 
- Date Format Errors → Handled by adjusting source file formats and enforcing SQL-compatible datetime format during preprocessing (Note: This can also be handled using Mapping Data Flow for transformation, but due to budget constraints, we opted for a simpler approach)
- ADF Parameter Errors → Corrected by adding parameters at dataset level and passing values dynamically. 

---

## ARM Templates Included 
- Azure SQL DB
- Azure Data Lake Storage 
- ADF Pipelines (both versions)
- Resource Group 

---

## Future Enhancements  
- Introduce AI-based Query Optimization using Azure Machine Learning for predictive tuning.  
- Implement Data Quality Checks in ADF to validate schema and data types before loading.  

---

## Tech Stack 
 Azure Services: Azure SQL DB, ADF, ADLS, Monitor  
 Languages: SQL, T-SQL  
 Tools: SSMS, Azure Portal   
 Others: Power BI

---

### Author 
 Dilip Kumar Ramella  
*SQL DBA & Aspiring Data Engineer* 
