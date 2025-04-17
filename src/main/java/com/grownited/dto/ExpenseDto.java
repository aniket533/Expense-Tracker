package com.grownited.dto;

public interface ExpenseDto {

	Integer getExpenseId();
	Integer getAmount();
	String getDescription();
	String getDate();
	String getFirstName();         // from users table
	String getExpenseTitle();      // from e.title AS expenseTitle
	String getAccountTitle();      // from a.title AS accountTitle
	String getVendorName();        // from vendors
	String getCategoryName();      // from categories
	String getSubCategoryName();   // from subcategories
}