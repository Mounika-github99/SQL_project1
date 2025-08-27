# Layoffs Data Cleaning & Exploratory Data Analysis (SQL)

This repository contains SQL scripts to clean, deduplicate, standardize, and analyze a dataset of layoffs across various companies, industries, and countries. The project demonstrates advanced SQL techniques such as window functions, common table expressions (CTEs), data standardization, and exploratory data analysis (EDA).

---

## 📂 Project Structure

- `layoffs.sql` — Contains the full SQL script with data cleaning, duplicate handling, standardization, and EDA queries.

---

## 🚀 Project Overview

The goal of this project is to:

1. **Clean raw layoffs data** by:
   - Removing duplicates using `ROW_NUMBER()` and CTEs.
   - Trimming and standardizing text fields like company names, industries, and countries.
   - Correcting and formatting date fields.
   - Handling NULL values and missing data.

2. **Perform Exploratory Data Analysis** to understand:
   - Total layoffs by company, industry, country, and date.
   - Trends in layoffs over time (monthly and yearly).
   - Identification of companies with the highest layoffs.
   - Rolling totals of layoffs for trend analysis.

---

## 🔧 Technologies Used

- SQL (MySQL dialect)
- Window functions (`ROW_NUMBER()`, `DENSE_RANK()`, `SUM() OVER()`)
- Common Table Expressions (CTEs)
- Data cleaning and transformation SQL techniques

---

## 📊 Sample Queries & Analysis

- Remove duplicates by partitioning on multiple columns.
- Standardize industry names (e.g., all variations of “Crypto” standardized to “Crypto”).
- Convert string dates to SQL `DATE` type.
- Calculate rolling sums of layoffs by month.
- Rank companies by layoffs per year.
- Aggregate layoffs by different dimensions like country, industry, and funding stage.

---

## 🧠 What I Learned

- How to use window functions for deduplication and ranking.
- Techniques for data cleaning directly in SQL.
- Aggregation and time-series analysis using SQL.
- Creating CTEs to organize complex queries.
- Best practices for handling missing or inconsistent data in SQL.

---

## ⚙️ How to Use

1. Load your raw layoffs data into a table named `layoffs`.
2. Run the SQL scripts in this repo step-by-step to:
   - Create staging tables.
   - Clean and standardize data.
   - Remove duplicates.
   - Analyze layoffs trends and produce summary tables.
3. Modify queries as needed to suit your dataset or specific questions.

---

## 📁 Optional Extensions

- Export cleaned data for visualization in tools like Tableau or Power BI.
- Automate data refreshes using SQL jobs or cron jobs.
- Add predictive analytics using SQL or integration with Python/R.

---

## 📞 Contact

For questions or collaboration, please reach out:

- GitHub: [your_github_username](https://github.com/your_github_username)
- LinkedIn: [Your LinkedIn](https://linkedin.com/in/yourprofile)

---

## License

This project is licensed under the MIT License. See `LICENSE` for details.

---

*Happy querying and analyzing!* 🚀
