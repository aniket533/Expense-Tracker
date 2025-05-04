package com.grownited.repository;

import java.util.List;
import org.springframework.data.repository.query.Param;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.grownited.dto.ExpenseDto;
import com.grownited.entity.ExpenseEntity;

public interface ExpenseRepository extends JpaRepository<ExpenseEntity, Integer> {

	 List<ExpenseEntity> findByUserId(Integer userId); 
	
	@Query(value = " select * from expenses where month(date) = :month and user_id = :userId",nativeQuery = true)
	List<ExpenseEntity> getCurrentMonthExpByUserId(Integer month,Integer userId);

	
	@Query(value = " select sum(amount) from expenses where month(date) = :month and user_id = :userId",nativeQuery = true)
	Integer getCurrentMonthExpAmountByUserId(Integer month,Integer userId);

	@Query(value = " select sum(amount) from expenses where year(date) = :year and user_id = :userId",nativeQuery = true)
	Integer getCurrentYearExpAmountByUserId(Integer year,Integer userId);

	@Query(value = "SELECT e.title as expenseTitle, e.expense_id as expenseId, e.amount, e.description, e.date, "
	        + "u.first_name as firstName, a.title as accountTitle, v.vendor_name as vendorName, "
	        + "c.category_name as categoryName, sc.subcategory_name as subCategoryName, e.user_id as userId "
	        + "FROM expenses e, users u, accounts a, vendors v, categories c, subcategories sc "
	        + "WHERE e.user_id = u.user_id AND a.account_id = e.account_id AND v.vendor_id = e.vendor_id "
	        + "AND c.category_id = e.category_id AND sc.subcategory_id = e.subcategory_id", 
	        nativeQuery = true)
	List<ExpenseDto> getAllExpenses();

	@Query(value = " select sum(amount),month(date) from expenses group by month(date)",nativeQuery = true)
	List<Integer[]> getExpenseSumByMonth();

	
	@Query(value = " select sum(amount),month(date) from expenses where user_id = :userId group by month(date)",nativeQuery = true)
	List<Integer[]> getExpenseSumByMonthByUser(Integer userId);


	@Query(value = "select sum(amount),c.category_name  from expenses e,categories c  where c.category_id = e.category_id group by e.category_id",nativeQuery = true)
	List<Integer[]> getMonthlyCategorywise();
	

	@Query(value = "select sum(amount),c.category_name  from expenses e,categories c  where c.category_id = e.category_id  and e.user_id = :userId group by e.category_id",nativeQuery = true)
	List<Integer[]> getMonthlyCategorywiseByUser(Integer userId);
	
	@Query(value = "SELECT u.user_id, u.first_name, SUM(e.amount) as total_expense " +
            "FROM expenses e JOIN users u ON e.user_id = u.user_id " +
            "GROUP BY u.user_id", nativeQuery = true)
List<Object[]> getTotalExpensesByUser();

@Query(value = "SELECT e.expense_id as expenseId, e.title as expenseTitle, e.amount, e.description, e.date, "
        + "a.title as accountTitle, c.category_name as categoryName, sc.subcategory_name as subCategoryName, "
        + "v.vendor_name as vendorName "
        + "FROM expenses e "
        + "JOIN accounts a ON e.account_id = a.account_id "
        + "JOIN categories c ON e.category_id = c.category_id "
        + "JOIN subcategories sc ON e.subcategory_id = sc.subcategory_id "
        + "JOIN vendors v ON e.vendor_id = v.vendor_id "
        + "WHERE e.user_id = :userId", 
        nativeQuery = true)
List<ExpenseDto> getExpensesByUserIdWithAccountTitle(@Param("userId") Integer userId);



}