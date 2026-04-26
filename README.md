# Bright-Motor-Sales
1. Problem Statement
  Bright Motors, a growing automotive dealership network, has appointed a new Head of Sales with a mandate to expand the dealership footprint, improve sales performance, and optimise inventory management. Despite holding a large volume of historical car sales data spanning multiple years, regions, makes, and models, the organisation lacked a structured analytical framework to translate this data into actionable business intelligence.

Specifically, the dealership faced the following challenges:
•	No clear visibility into which car makes and models were driving the most revenue.
•	Limited understanding of how vehicle age, mileage, and model year influenced resale pricing.
•	Absence of regional performance benchmarks to guide inventory allocation and sales campaigns.
•	No systematic tracking of margin health — a significant proportion of deals were suspected to be below profitable thresholds.
•	Emerging customer preferences (e.g., shift toward SUVs) were not being captured or acted upon.

Without these insights, the incoming Head of Sales could not make informed decisions about where to invest, what inventory to prioritise, or which regions to target for growth.
 
2. Aim of the Project
The aim of this project is to analyse Bright Motors' historical car sales data to surface clear, evidence-based insights that will directly support the new Head of Sales in making strategic decisions around inventory, regional expansion, pricing, and customer targeting.

The project seeks to answer five core business questions:
•	Which car makes and models generate the most revenue?
•	What is the relationship between selling price, mileage, and model year?
•	Which regions or locations have the highest sales volumes and revenue?
•	What are the emerging trends in customer purchasing preferences?
•	What recommendations can be made to increase dealership profitability and efficiency?

The end deliverable is a presentation and interactive dashboard that communicates these findings to both technical and non-technical stakeholders, enabling data-driven sales and marketing strategy going forward.
3. Objectives: Steps Taken to Solve for the Aim
Step 1 — Data acquisition and understanding
1.	Loaded the raw car sales CSV dataset (558,811 records) containing fields including: year, odometer, mmr, sellingprice, units_sold, sale_date, make_clean, model_clean, body_clean, color_clean, vehicle_segment, condition_rating, pricing_performance, profit_band, state_full_name, and region.
2.	Conducted an initial data audit to understand column types, value ranges, null rates, and categorical distributions.
3.	Identified that sellingprice was the appropriate revenue proxy, and that profit_band and pricing_performance were pre-derived categorical fields suitable for margin and pricing analysis.

Step 2 — Data cleaning and preparation
4.	Parsed and validated numeric fields (sellingprice, mmr, odometer, units_sold, year) and handled any malformed rows.
5.	Standardised regional groupings, identifying that a large proportion of records fell into an 'Other' bucket outside the four named regions (North East, West, Mid West, South West).
6.	Confirmed that units_sold was 1 for virtually all records, meaning sellingprice alone served as a reliable per-transaction revenue figure.

Step 3 — Exploratory data analysis (EDA)
Aggregated revenue and unit counts by make, model, region, vehicle segment, model year, profit band, and pricing performance category.
Computed average selling price and average odometer readings per model year to examine the price-mileage-age relationship.
Identified the top 10 makes by revenue and top 8 models by total selling price contribution.
Analysed the distribution of profit_band values (Positive Margin, Negative Margin, High Margin) to assess dealership margin health.

Step 4 — Insight generation
Ford identified as the dominant brand at $1.36B in revenue — nearly 2x the third-placed Nissan.
Strong inverse relationship confirmed between model year and mileage: 2015 vehicles averaged 12K miles vs 101K for 2008 models, with price increasing 2.7x over the same period.
North East and West regions combined account for approximately 60% of named-region revenue.
51% of transactions fell into the Negative Margin band — a critical profitability risk flagged for management attention.
SUVs emerged as the highest avg-unit-value segment, signalling a shift in customer preference away from passenger cars.

Step 5 — Visualisation and presentation
Built an 8-slide PowerPoint presentation covering all five business questions with branded charts, KPI cards, and strategic recommendations.
Developed an interactive dashboard displaying KPI metrics, revenue by make, regional breakdown, model year trend, segment split, margin distribution, and pricing performance.
Prepared Looker Studio step-by-step guides for replicating key charts (time series by model year, margin distribution, pricing performance vs market) enabling the client to self-serve ongoing reporting.

4. Summary of Results
The analysis of 558,811 car sales transactions produced the following headline findings:
$7.61B: Total revenue	558,811
Total transactions:$13,613
Average selling price	Ford — $1.36B
Top revenue make: Ford F-150 ($272.7M)
#1 model by revenue	51% of deals: Negative margin rate

Revenue by make
Ford led all brands with $1.36B in revenue across 93,533 units. Chevrolet ($721M), Nissan ($633M), Toyota ($488M), BMW ($444M), and Mercedes-Benz ($370M) rounded out the top six. Ford's revenue was approximately 2x that of the third-placed brand.

Price, mileage & model year
A strong inverse correlation was found between odometer reading and selling price. Vehicles from 2015 averaged just 12,229 miles and sold for $25,966 on average, compared to 2008 vehicles averaging 101,555 miles at $9,508. Newer, low-mileage inventory commands a 2.7x price premium.

Regional performance
Among the four named regions, the North East generated the highest revenue at $1.30B (87,376 units), followed by the West at $1.18B (81,701 units), the Mid West at $889M, and the South West at $709M. Note that a large 'Other' category ($3.53B) captures transactions with unclassified regional data.

Customer trends
SUVs represent 25% of identified segment revenue at $1.90B and are growing in average unit value relative to passenger cars. Passenger cars still lead in unit volume (38% of transactions) but face margin pressure. The rise of below-market pricing (51.2% of deals) suggests aggressive discounting is eroding profitability.

Key recommendations
•	Prioritise Ford and Chevrolet inventory — particularly F-150, Escape, and Fusion — where proven demand exists.
•	Expand the SUV portfolio with 2013+ model years to capture the growing high-value segment.
•	Address margin erosion urgently: implement pricing guardrails, leverage MMR benchmarks, and train sales staff on value-based negotiation.
•	Concentrate marketing spend on the North East and West regions, which together represent nearly 60% of named-region revenue.
•	Source and aggressively market low-mileage (under 40K miles), recent model year (2013–2015) vehicles to maximise revenue per unit.

5.  Tools Used in the Case Study

Databricks (SQL): 	Data querying & transformation:	Used SQL on Databricks to query, filter, and aggregate the raw car sales dataset. Wrote queries to compute revenue by make, model, region, model year, and margin band, forming the analytical foundation for all downstream reporting.

Looker Studio	Interactive BI dashboard:	Built the live reporting dashboard to visualise key metrics. Charts included a revenue time series by model year, regional bar charts, margin distribution donut chart, and a pricing performance vs. market stacked bar.

Microsoft Excel	Data validation & exploration:	Used for initial data profiling, spot-checking query outputs from Databricks, and performing ad-hoc calculations. Pivot tables were used to cross-validate revenue totals by make, region, and model year before publishing to the dashboard.

Miro	Project planning & storyboarding:	Used as a collaborative whiteboard to map out the project structure, define the analytical workflow, and storyboard the presentation narrative before building the final deliverables.

Canva	Presentation design:	Designed the stakeholder-facing presentation slides using Canva’s templates. Used to lay out KPI summaries, chart screenshots from Looker Studio, and the strategic recommendations in a visually polished, branded format for the Head of Sales.


