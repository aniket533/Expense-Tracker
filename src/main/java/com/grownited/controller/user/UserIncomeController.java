package com.grownited.controller.user;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.grownited.entity.AccountEntity;
import com.grownited.entity.CategoryEntity;
import com.grownited.entity.IncomeEntity;
import com.grownited.entity.StatusEntity;
import com.grownited.entity.UserEntity;
import com.grownited.repository.AccountRepository;
import com.grownited.repository.CategoryRepository;
import com.grownited.repository.IncomeRepository;
import com.grownited.repository.StatusRepository;
import com.grownited.repository.UserRepository;

import jakarta.servlet.http.HttpSession;

@Controller
public class UserIncomeController {

    @Autowired
    IncomeRepository incomeRepo;
    @Autowired
    AccountRepository accountRepo;
    @Autowired
    StatusRepository statusRepo;
    @Autowired
    CategoryRepository categoryRepo;
    @Autowired
    UserRepository userRepo;

    @GetMapping("/usernewincome")
    public String userNewIncome(Model model, HttpSession session) {
        UserEntity user = (UserEntity) session.getAttribute("user");
        if (user != null) {
            session.setAttribute("userId", user.getUserId());
        }

        // ✅ Only current user's accounts
        List<AccountEntity> accountList = accountRepo.findByUserId(user.getUserId());
        List<CategoryEntity> categoryList = categoryRepo.findAll();
        List<StatusEntity> statusList = statusRepo.findAll();

        model.addAttribute("accountList", accountList);
        model.addAttribute("categoryList", categoryList);
        model.addAttribute("statusList", statusList);

        return "UserNewIncome";
    }

    @GetMapping("/userlistincome")
    public String userListIncome(Model model, HttpSession session) {
        Integer userId = (Integer) session.getAttribute("userId");
        List<IncomeEntity> incomeList = incomeRepo.findByUserId(userId);
        model.addAttribute("incomeList", incomeList);

        List<CategoryEntity> categoryList = categoryRepo.findAll();
        model.addAttribute("categoryList", categoryList);

        return "UserListIncome";
    }

    @PostMapping("/usersaveincome")
    public String userSaveIncome(IncomeEntity income, HttpSession session) {
        Integer userId = (Integer) session.getAttribute("userId");

        // Ensure userId is set in the income object
        if (income.getUserId() == null && userId != null) {
            income.setUserId(userId);
        }

        // Save income entry
        incomeRepo.save(income);

        // Update account balance
        AccountEntity account = accountRepo.findById(income.getAccountId()).orElse(null);
        if (account != null) {
            Double currentAmount = account.getAmount() != null ? account.getAmount() : 0.0;
            Double newAmount = currentAmount + income.getAmount();
            account.setAmount(newAmount);
            accountRepo.save(account);
        }

        return "redirect:/userlistincome";
    }

    @GetMapping("/userdeleteincome")
    public String userDeleteIncome(@RequestParam Integer incomeId) {
        incomeRepo.deleteById(incomeId);
        return "redirect:/userlistincome";
    }
}
