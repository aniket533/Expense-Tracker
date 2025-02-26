
package com.grownited.controller;

import java.util.List;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.example.entity.MemberEntity;
import com.example.repository.MemberRepository;


@Controller
public class MemberController {

	@Autowired
	MemberRepository repositoryMember;

	@GetMapping("newmember")
	public String newMember() {
		return "NewMember";
	}

	@PostMapping("savemember")
	public String saveMember(MemberEntity entityMember) {
		repositoryMember.save(entityMember);
		return "NewMember";
	}

	@GetMapping("listmember")
	public String listMember(Model model) {
		List<MemberEntity> memberList = repositoryMember.findAll();
		
		
		model.addAttribute("memberList", memberList);
						
		
		return "ListMember";
	}
	
	@GetMapping("viewmember")
	public String viewmember(Integer memberId, Model model) {
		System.out.println("view Member Id:"+memberId);
		Optional<MemberEntity> op = repositoryMember.findById(memberId);
		if(op.isEmpty()) {
			
		}else {
			MemberEntity member = op.get();
			model.addAttribute("member", member);
		}
		return "ViewMember";
	}

	@GetMapping("deletemember")
	public String deletemember(Integer memberId) {
		repositoryMember.deleteById(memberId);
		
		return "redirect:/listmember";
	}


}
