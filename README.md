# Budgie - Budget Tracker

## Categories

Income

- Paycheck
- Interest
- Other

Home

- Rent
- Mortgage
- Utilities
- Maintenance
- Insurance
- Property Tax
- Other

Auto

- Loan Payment
- Insurance
- Maintenance
- Fuel
- Registration
- Other

Essentials

- Groceries
- Personal Care
- Medical
- Clothing
- Other

Subscriptions

- Internet
- Phone
- Streaming
- Other

Savings

- Emergency Fund
- Retirement
- College
- Other

## Models

### Account

Name - Name of the account
Type - Type of account (Checking, Savings, Credit Card, etc.)
Is Budget - Whether the account is part of the budget
Is Credit - Whether the account is a credit account

### Transaction

Account - Account the transaction is associated with
Entry - Date and time of the transaction
Category - Category of the transaction (Groceries, Gas, Rent, etc.)
Description - Description of the transaction
Amount - Amount of the transaction

### Category Group

Name - Name of the category group

### Category

Name - Name of the category

### Budget

Month - Month the budget is for (Index)
Year - Year the budget is for (Index)
Income - Total income for the month
Assigned - Total amount assigned to categories

### Budget Category

Budget - Budget the category is associated with
Category - Category the budget is for
Starting Amount - Amount at the start of the budget month
Assigned Amount - Amount assigned to the category
Required Amount - Amount required for the category (Target Amount - Assigned - Starting)

### Category Target

Category - Category the target is for
Amount - Amount to target for the category
Frequency - Frequency of the target (Weekly, Monthly, Yearly)
Frequency Target - Target frequency (Every Sun, Mon, Tues, 1st, 2nd, 3rd, etc.)
Due Year - Year the target is due
Due Month - Month the target is due
Due Day - Day the target is due
