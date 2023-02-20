package com.bookstrap.harry.controller;

import java.io.UnsupportedEncodingException;
import java.sql.Date;
import java.util.HashMap;
import java.util.Map;

import javax.mail.MessagingException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.bookstrap.harry.bean.MemberDetails;
import com.bookstrap.harry.bean.Members;
import com.bookstrap.harry.service.MemberDdetailService;
import com.bookstrap.harry.service.MemberService;
import com.bookstrap.harry.service.SendEmailService;

@Controller
//@SessionAttributes("memberDetail")
public class MemberController {
	@Autowired
	private MemberService memberService;

	@Autowired
	private MemberDdetailService memberDetailService;

	@Autowired
	private SendEmailService emailService;
	
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
			@RequestParam("memberAddress") String memberAddress, Model m,
			HttpServletRequest request) throws UnsupportedEncodingException, MessagingException {

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
		
		memberService.sendVertificationEnail(member, memberDetail);
		
		return "member/TestSuccess";
	}
	
//	@ResponseBody
//	@GetMapping("/member/checkaccount")
//	public boolean checkAccount(@RequestParam("memberEmail") String memberAccount) {
//		
//		boolean account = memberService.checkAccount(memberAccount);
//		
//		if(account) {
//			
//			return true;
//		}
//		
//		return false;
//	}
	

	@PostMapping("/member/checklogin")
	public String checkLogin(@RequestParam("memberEmail") String memberEmail,
			@RequestParam("memberPassword") String memberPassword, HttpSession session, Model m) {

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
		
//		Integer valid = logInmember.getMemberValid();
		
		boolean status = memberService.checkLogin(logInmember);
		Integer valid = memberService.checkValid(logInmember);
		System.out.println("V:" + valid);
		
		
		if (status && valid == 1) {

			// 要先得到由Email找出的Id
			Members mEmail = memberService.useEmailFindId(memberEmail);
			Integer result = mEmail.getMemberId();

			System.out.println("ID: " + result);

			// 還要再去資料庫要資料 要寫dao 與 service 透過 id 回傳MemberDetail 中的Name
			MemberDetails idFindName = memberDetailService.useIdFindName(result);
			String memberName = idFindName.getMemberName();

			System.out.println("Name: " + memberName);

			session.setAttribute("memberId", result);

			session.setAttribute("member", logInmember);

			session.setAttribute("memberName", memberName);
			
//			session.setAttribute("memberDetail", idFindName);
//				m.addAttribute("memberDetail", idFindName);
			return "redirect:main";
		}
		
		if (status && valid == 0) {
			return "member/VertifyStatus";
		}

		
		errors.put("msg", "username or password is not correct");
		return "member/SignInPage";

	}
	
	@GetMapping("/member/verify")
	public String verify(@RequestParam("code") String code, Model m, HttpSession session) {
		boolean verified = memberService.verify(code);
		
		Members member = memberService.findByVerifyCode(code);
		Integer memberValid = member.getMemberValid();
		System.out.println("MemberV: " + memberValid);
		
				member.setMemberValid(1);
			Integer newValid =	member.getMemberValid();
			System.out.println("newV: " + newValid);
		memberService.insertMemberValid(newValid, memberValid);
		

		String pageTitle = verified ? "驗證成功" : "驗證失敗";
		m.addAttribute("pageTitle", pageTitle);
		return "member/" + (verified ? "VerifySuccess" : "VerifyFail");
	}

	@GetMapping("/member/main")
	public String toMemberMain(HttpSession session) {

		if (session.getAttribute("member") != null) {

			return "member/Main/MemberMainPage";
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

	////////////////////
//	// First: Get the page of edition target
//	@GetMapping("/member/edit")
//	public String editMember(@RequestParam("memberId") Integer memberId, ModelMap map) {
//		Members findById = memberService.findById(memberId);
//		Integer id = findById.getMemberId();
//		System.out.println("ID: " + id);
//		MemberDetails findMemberDetailsById = memberDetailService.findMemberDetailsById(id);
//		System.out.println("Name: " + findMemberDetailsById.getMemberName());
//		// When add ModelAttribute, that need spriing's form tag to get attribute.
//		map.addAttribute("member", findById);
//		map.addAttribute("memberDetails", findMemberDetailsById);
//
//		return "member/Main/EditMember";
//	}
//
//	// Need spring's form; the spring's form:input need path="memberId" (for
//	// example)
//	@PutMapping("/member/edit")
//	public String sendEditedMember(@ModelAttribute("member") Members member, BindingResult resultMember,
//			@ModelAttribute("memberDetails") MemberDetails memberdetails, BindingResult resultMemberdetail) {
//		memberService.insertMember(member);
//
//		memberDetailService.insertMemberDetails(memberdetails);
//		return "redirect:/member/main";
//	}
//////////////////////

	@GetMapping("/member/information")
	public String personalInfo() {
		return "member/Main/MyInfo";
	}

	@GetMapping("/member/editpasswordpage")
	public String editPasswordpage(@RequestParam("memberId") Integer memberId, Model m) {
		//因為session有直接設memberId所以在jsp頁面可透過${memberId}得到，並且放在input標籤中，且命名memberId既可在此方法由@RequestParam("memberId")得到
		m.addAttribute("memberId", memberId);
		System.out.println("MemberId3: " + memberId);
		return "member/Main/EditPassword";
	}

	@PostMapping("/member/editpassword")
	public String editPassword(@RequestParam("oldPassword") String oldPassword,
			@RequestParam("newPassword") String newPassword, @RequestParam("re_Password") String re_Password,
			@RequestParam("memberId") Integer memberId, Model m) {

		Map<String, String> errors = new HashMap<String, String>();
		m.addAttribute("errors", errors);

		Members member = memberService.findById(memberId);
		System.out.println("old: " + oldPassword);
		System.out.println("new: " + newPassword);
		System.out.println("Re: " + re_Password);
		System.out.println("memberPassword:" + member.getMemberPassword());

		if (oldPassword.equals(member.getMemberPassword()) && newPassword.equals(re_Password)) {
			member.setMemberPassword(newPassword);
			memberService.insertMember(member);
			return "redirect:/member/main";

		}

		if (!oldPassword.equals(member.getMemberPassword()) || oldPassword.equals(null) || oldPassword.isEmpty()) {

			errors.put("WrongPassword", "請輸入正確之原有密碼");
		}

		if (!newPassword.equals(re_Password) || newPassword.equals(null) || re_Password.equals(null)) {

			errors.put("checkProblem", "新密碼與確認新密碼不符");
		}

		return "member/Main/EditPassword";
	}

	@PostMapping("/member/editinfopage")
	public String toEditInfo(@RequestParam("memberId") Integer memberId,
			@RequestParam("memberPassword") String memberPassword,Model m) {
		Members member = memberService.findById(memberId);
		MemberDetails memberDetail = memberDetailService.findMemberDetailsById(memberId);
		
		Map<String, String> errors = new HashMap<String, String>();
		m.addAttribute("errors", errors);

		if (memberPassword.equals(member.getMemberPassword()) && !memberPassword.equals(null)) {
			
			m.addAttribute("memberDetail", memberDetail);
			
			return "member/Main/EditInformation";
		}
		if (memberPassword.equals(null) || !memberPassword.equals(member.getMemberPassword())) {
			errors.put("WrongPassword", "密碼不正確，請重新輸入");
		}
		
				return "member/Main/MyInfo";
	}

	@PostMapping("/member/editinfo")
	public String editInfo(@RequestParam("memberId") Integer memberId,
			@RequestParam("memberName") String memberName,
			@RequestParam("memberEmail") String memberEmail,
			@RequestParam("memberPhone") String memberPhone,
			@RequestParam("memberAddress") String memberAddress,
			@RequestParam("memberGender") Integer memberGender, 
			@ModelAttribute("memberDetail") MemberDetails detail) {
		
		MemberDetails memberdetail = memberDetailService.findMemberDetailsById(memberId);
		memberdetail.setMemberName(memberName);
		memberdetail.setMemberEmail(memberEmail);
		memberdetail.setMemberPhone(memberPhone);
		memberdetail.setMemberAddress(memberAddress);
		memberdetail.setMemberSex(memberGender);
		
		memberDetailService.insertMemberDetails(memberdetail);
		
		return"member/Main/MyInfo";
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