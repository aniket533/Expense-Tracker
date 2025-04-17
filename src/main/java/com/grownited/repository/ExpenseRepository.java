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
		    + "c.category_name as categoryName, sc.subcategory_name as subCategoryName "
		    + "FROM expenses e, users u, accounts a, vendors v, categories c, subcategories sc "
		    + "WHERE e.user_id = u.user_id AND a.account_id = e.account_id AND v.vendor_id = e.vendor_id "
		    + "AND c.category_id = e.category_id AND sc.subcategory_id = e.subcategory_id", 
		    nativeQuery = true)
		List<ExpenseDto> getAllExpenses();  // 👈 Keep original method name

	@Query(value = " select sum(amount),month(date) from expenses group by month(date)",nativeQuery = true)
	List<Integer[]> getExpenseSumByMonth();

	
	@Query(value = " select sum(amount),month(date) from expenses where user_id = :userId group by month(date)",nativeQuery = true)
	List<Integer[]> getExpenseSumByMonthByUser(Integer userId);


	@Query(value = "select sum(amount),c.category_name  from expenses e,categories c  where c.category_id = e.category_id group by e.category_id",nativeQuery = true)
	List<Integer[]> getMonthlyCategorywise();
	

	@Query(value = "select sum(amount),c.category_name  from expenses e,categories c  where c.category_id = e.category_id  and e.user_id = :userId group by e.category_id",nativeQuery = true)
	List<Integer[]> getMonthlyCategorywiseByUser(Integer userId);
	
	

}