package com.bookstrap.harry.controller;

import java.sql.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.bookstrap.harry.bean.MemberDetails;
import com.bookstrap.harry.bean.Members;
import com.bookstrap.harry.service.MemberDdetailService;
import com.bookstrap.harry.service.MemberService;

@Controller
public class MemberController {
	@Autowired
	private MemberService memberService;

	@Autowired
	private MemberDdetailService memberDetailService;

	@GetMapping("/member/signin")
	public String memberSignIn(HttpSession session) {
		if (session.getAttribute("member") != null) {
			return "redirect:/member/main";
		}
		return "member/SignInPage";
	}

	@GetMapping("/member/signup")
	public String memberSignUp() {

		return "member/SignUpPage";
	}

	// Registration
	@PostMapping("/member/post")
	public String memberSignUp(@RequestParam("memberName") String memberName,
			@RequestParam("memberEmail") String memberAccount, @RequestParam("memberEmail") String memberEmail,
			@RequestParam("memberPassword") String memberPassword,
			@RequestParam("re_memberPassword") String memberRePassword,
			@RequestParam("memberValid") Integer memberValid, @RequestParam("memberLevel") Integer memberLevel,
			@RequestParam("memberSex") Integer memberSex, @RequestParam("memberBirthday") Date memberBirthday,
			@RequestParam("memberPhone") String memberPhone, @RequestParam("memberPhone") String memberCellPhone,
			@RequestParam("memberAddress") String memberAddress, Model m) {

		java.util.Date jDate = new java.util.Date();
		long time = jDate.getTime();
		Date sDate = new Date(time);

		Map<String, String> errors = new HashMap<String, String>();
		m.addAttribute("errors", errors);

		if (memberName == null || memberName.length() == 0) {
			errors.put("errName", "memberName is require!");
		}

		if (memberEmail == null || memberEmail.length() == 0) {
			errors.put("errEmail;", "Email is required!");
		}
		if (memberPassword == null || memberPassword.length() == 0) {
			errors.put("errPassword;", "Password is required!");
		}

		if (memberRePassword == null || memberRePassword.length() == 0 && memberRePassword != memberPassword) {
			errors.put("rePassword", "Checked password is wrong!");
		}

		if (memberSex == 0) {
			errors.put("errGender;", "Please choose your gender!");
		}

		if (memberBirthday == null || memberBirthday == sDate) {
			errors.put("errBirthday;", "Birthday form is wrong");
		}

		if (memberEmail == null || memberEmail.length() == 0) {
			errors.put("errEmail;", "Email is required!");
		}

		Members member = new Members();
		MemberDetails memberDetail = new MemberDetails();
		memberDetail.setMemberName(memberName);
		member.setMemberAccount(memberAccount);
		memberDetail.setMemberEmail(memberEmail);
		member.setMemberPassword(memberPassword);
		member.setMemberValid(memberValid);
		member.setMemberLevel(memberLevel);
		memberDetail.setMemberSex(memberSex);
		memberDetail.setMemberBirthday(memberBirthday);
		memberDetail.setMemberPhone(memberPhone);
		memberDetail.setMemberAddress(memberAddress);
		memberService.insertMember(member);
		Integer rMemberId = member.getMemberId();
		System.out.println("rId: " + rMemberId);
		memberDetail.setMemberId(rMemberId);
		memberDetailService.insertMemberDetails(memberDetail);
		return "member/TestSuccess";
	}

	@PostMapping("/member/checklogin")
	public String checkLogin(@RequestParam("memberEmail") String memberEmail,
			@RequestParam("memberPassword") String memberPassword, HttpSession session) {

		Map<String, String> errors = new HashMap<String, String>();
		session.setAttribute("errors", errors);

		if (memberEmail == null || memberEmail.length() == 0) {
			errors.put("Email", "Email is required");
		}

		if (memberPassword == null || memberPassword.length() == 0) {
			errors.put("Password", "password is required");
		}

		if (errors != null && !errors.isEmpty()) {
			return "member/SignInPage";
		}

		Members logInmember = new Members(memberEmail, memberPassword);

		boolean status = memberService.checkLogin(logInmember);

		if (status) {

			// 要先得到由Email找出的Id
			Members mEmail = memberService.useEmailFindId(memberEmail);
			Integer result = mEmail.getMemberId();

			System.out.println("ID: " + result);

			// 還要再去資料庫要資料 要寫dao 與 service 透過 id 回傳MemberDetail 中的Name
			MemberDetails idFindName = memberDetailService.useIdFindName(result);
			String memberName = idFindName.getMemberName();

			System.out.println("Name: " + memberName);

			session.setAttribute("member", logInmember);

			session.setAttribute("memberName", memberName);

			return "redirect:main";
		}

		errors.put("msg", "username or password is not correct");
		return "member/SignInPage";

	}

	@GetMapping("/member/main")
	public String toMemberMain(HttpSession session) {
		if (session.getAttribute("member") != null) {
			return "member/MemberMainPage";
		}

		return "member/SignInPage";
	}

	@GetMapping("/member/logout")
	public String logOut(HttpSession session) {

		if (session.getAttribute("member") != null) {
			session.invalidate();

			return "redirect:/index";
		}
		return "member/SignInPage";

	}

//	//First: Get the page of edition target
//	@GetMapping("/member/edit")
//	public String editMember(@RequestParam("memberId") Integer memberId, Model m) {
//		Members findById = memberService.findById(memberId);
//		MemberDetails findMemberDetailsById = memberDetailService.findMemberDetailsById(memberId);
//		//When add ModelAttribute, that need spriing's form tag to get attribute.
//		m.addAttribute("member", findById);
//		m.addAttribute("memberDetails", findMemberDetailsById);
//		
//		return "member/EditMember";
//	}
//	
//	
//	//Need spring's form; the spring's form:input need path="memberId" (for example)
//	@PutMapping("/member/edit")
//	public String sendEditedMember(@ModelAttribute("member") Members member, 
//			@ModelAttribute("memberDetails") MemberDetails memberdetail, Model m) {
//		memberService.insertMember(member);
//		
//		
//		memberDetailService.insertMemberDetails(memberdetail);
//		return "redirect:/member/MemberMainPage";
//	}

	// First: Get the page of edition target
	@GetMapping("/member/edit")
	public String editMember(@RequestParam("memberId") Integer memberId, ModelMap map) {
		Members findById = memberService.findById(memberId);
		Integer id = findById.getMemberId();
		System.out.println("ID: " + id);
		MemberDetails findMemberDetailsById = memberDetailService.findMemberDetailsById(id);
		System.out.println("Name: " + findMemberDetailsById.getMemberName());
		// When add ModelAttribute, that need spriing's form tag to get attribute.
		map.addAttribute("member", findById);
		map.addAttribute("memberDetails", findMemberDetailsById);

		return "member/EditMember";
	}

	// Need spring's form; the spring's form:input need path="memberId" (for
	// example)
	@PutMapping("/member/edit")
	public String sendEditedMember(@ModelAttribute("member") Members member, BindingResult resultMember,
			@ModelAttribute("memberDetails") MemberDetails memberdetails, BindingResult resultMemberdetail) {
		memberService.insertMember(member);

		memberDetailService.insertMemberDetails(memberdetails);
		return "redirect:/member/main";
	}

	@GetMapping("/member/getphoto")
	public ResponseEntity<byte[]> getPhoto(@RequestParam("memberId") Integer memberId) {
		MemberDetails photoId = memberDetailService.getPhotoById(memberId);
		byte[] photoFile = photoId.getMemberPhoto();
		HttpHeaders header = new HttpHeaders();
		header.setContentType(MediaType.IMAGE_JPEG);

		return new ResponseEntity<byte[]>(photoFile, header, HttpStatus.OK);
	}

}