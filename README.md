# 📊 Customer Churn & Retention Strategy
### Built with Power BI | Data Analysis Project

![Dashboard Preview](Churn%20Dashboard.jpg)

---

## 📌 About This Project

This is my first end-to-end Power BI dashboard project where I analyzed customer churn data for a telecom company. The goal was to understand **why customers are leaving**, **how many are leaving**, and **what the business can do to retain them**.

I built this dashboard from scratch — starting from raw data, creating DAX measures, and designing the final report layout with interactive slicers and KPI cards.

---

## 🧩 Business Problem

A telecom company is **losing customers at an alarming rate**. Every month, a significant number of customers are cancelling their subscriptions and switching to competitors. This is a huge problem because:

- Acquiring a new customer costs **5x more** than retaining an existing one
- Every churned customer means **lost revenue** that is very hard to recover
- The company does not clearly understand **who is leaving, why they are leaving, and when**

The business needs answers to these questions:
- What is our current churn rate?
- Which type of customers are most likely to churn?
- What is the main reason customers are leaving?
- How much revenue are we losing because of churn?
- What can we do to improve retention?

Without a clear dashboard, the management team was making decisions based on guesswork. This project solves that by turning raw data into **clear, actionable insights**.

---

## 🌟 Project Details

### ⚡ Situation
The telecom company had a large customer database with over **6,400 customers** but had no clear visibility into churn patterns. The leadership team knew churn was happening but could not quantify it or identify root causes. The data existed in raw form but was never analyzed properly.

### 🎯 Task
My job was to:
1. Clean and understand the raw customer data
2. Build meaningful KPI measures using DAX in Power BI
3. Design an interactive dashboard that shows churn trends clearly
4. Identify the key drivers of churn and present recommendations

### 🛠️ Action
Here is what I actually did step by step:

**Step 1 — Understood the Data**
The dataset had one main table called `prod_Churn` with customer-level information including contract type, internet type, monthly charges, tenure, churn category, and customer status (Churned / Stayed / Joined).

**Step 2 — Created 10 KPI Measures in DAX**

| # | Measure | DAX Formula |
|---|---------|-------------|
| 1 | Total Customers | `COUNTROWS(prod_Churn)` |
| 2 | New Joiners | `CALCULATE(COUNTROWS(prod_Churn), prod_Churn[Customer_Status] = "Joined")` |
| 3 | Total Churned | `CALCULATE(COUNTROWS(prod_Churn), KEEPFILTERS(prod_Churn[Customer_Status] = "Churned"))` |
| 4 | Churn Rate % | `DIVIDE([Total Churned], [Total Customers], 0)` |
| 5 | Retained Customers | `CALCULATE(COUNTROWS(prod_Churn), KEEPFILTERS(prod_Churn[Customer_Status] = "Stayed"))` |
| 6 | Retention Rate % | `DIVIDE([Retained Customers], [Total Customers], 0)` |
| 7 | Avg Monthly Charge | `AVERAGE(prod_Churn[Monthly_Charge])` |
| 8 | Total Revenue | `SUM(prod_Churn[Total_Revenue])` |
| 9 | Revenue Lost to Churn | `CALCULATE(SUM(prod_Churn[Total_Revenue]), KEEPFILTERS(prod_Churn[Customer_Status] = "Churned"))` |
| 10 | Avg Revenue Per Customer | `DIVIDE([Total Revenue], [Total Customers], 0)` |


**Step 3 — Designed the Dashboard**
- Arranged all 10 KPI cards in 2 rows of 5 cards each
- Added slicers for Contract Type, Internet Type, and Customer Status
- Used a cool slate background color (`#F4F6FB`) for a clean, professional look
- Color-coded the KPI cards by category (Blue = Volume, Red = Churn, Green = Retention, Amber = Revenue)
- Set canvas size to 1920 × 1080 px for a proper widescreen layout

**Step 4 — Analyzed the Results**
After building the dashboard, I dug into the numbers to find patterns.

### 📈 Result

Here are the key numbers from the dashboard:

| KPI | Value |
|-----|-------|
| Total Customers | 6,418 |
| New Joiners | 411 |
| Total Churned | 1,732 |
| **Churn Rate** | **26.99%** |
| Retained Customers | 4,275 |
| Retention Rate | 66.61% |
| Total Revenue | ₹19.47M |
| Revenue Lost to Churn | ₹3.41M |
| Avg Monthly Charge | ₹63.65 |

**Key findings from the analysis:**

- 🔴 **Month-to-Month contracts** have the highest churn — 1,529 out of 3,286 customers churned (nearly 47%)
- 🔴 **Fiber Optic** internet users churn the most — 1,136 churned out of 2,764 customers
- 🔴 **Competitor** is the #1 churn reason with 761 customers lost to competition
- 🟢 **Two Year contract** customers are the most loyal — only 47 churned out of 1,719

---

## 💡 Recommendations

Based on what I found in this analysis, here are my suggestions for the business:

### 1. 🎯 Focus on Month-to-Month Contract Customers
Almost half of all month-to-month customers are churning. The company should offer **special discounts or incentives** to encourage these customers to switch to a 1-year or 2-year plan. Locked-in contracts create loyalty.

### 2. 📡 Investigate Fiber Optic Service Quality
Fiber Optic customers are leaving at a very high rate even though they are paying for a premium service. This suggests there may be **quality issues, outages, or better deals from competitors**. The company should urgently collect feedback from Fiber Optic customers and fix any service problems.

### 3. 🏆 Win Back Customers Lost to Competitors
The biggest churn reason is competitors. The company needs to do a **competitor analysis** — what are competitors offering that we are not? Better pricing? Faster speeds? More data? Matching or beating competitor offers could significantly reduce churn.

### 4. 💰 Re-evaluate Pricing Strategy
With an average monthly charge of ₹63.65 and a 27% churn rate, pricing may be a concern. Consider introducing **loyalty pricing** — customers who have been with the company for 2+ years should get automatic discounts as a reward.

### 5. 🆕 Improve New Joiner Experience
Only 411 new customers joined. To grow the customer base while reducing churn, the company needs a better **onboarding experience** so new customers feel valued from day one. First 3 months are critical — customers who are happy early tend to stay longer.

### 6. 📊 Set Up Monthly Churn Monitoring
Right now, churn is being analyzed after it happens. The company should set up a **monthly churn review meeting** using this dashboard to track trends and act fast before churn spikes.

---

## 🛠️ Tools Used

- **MS SQL Server** — Database
- **SQL** - Data cleaning and Data Exploration
- **Power BI Desktop** — data modeling, DAX measures, dashboard design
- **DAX** — for all KPI calculations

