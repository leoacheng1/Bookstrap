package com.bookstrap.harry.controller;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.sql.Date;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.mail.MessagingException;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.multipart.MultipartFile;

import com.bookstrap.harry.bean.EBookFavorite;
import com.bookstrap.harry.bean.EBookPurchases;
import com.bookstrap.harry.bean.MemberDetails;
import com.bookstrap.harry.bean.Members;
import com.bookstrap.harry.bean.Sales;
import com.bookstrap.harry.security.CipherUtils;
import com.bookstrap.harry.security.MemberUserDetailService;
import com.bookstrap.harry.service.EBookFavorityService;
import com.bookstrap.harry.service.EBookPurchaseService;
import com.bookstrap.harry.service.MemberDdetailService;
import com.bookstrap.harry.service.MemberService;
import com.bookstrap.model.Shops;
import com.bookstrap.service.SalesService;
import com.bookstrap.service.ShopsService;
import com.bookstrap.service.UserCouponService;

@Controller
@SessionAttributes({"member", "memberId", "memberName"})
public class MemberController {
	@Autowired
	private MemberService memberService;

	@Autowired
	private MemberDdetailService memberDetailService;
	
	@Autowired
	private MemberUserDetailService muService;
	
	@Autowired
	private EBookFavorityService ebfService;
	
	@Autowired
	private EBookPurchaseService ebpService;
	
	@Autowired
	private SalesService sService;
	
	@Autowired
	private UserCouponService ucService;
	
	@Autowired
	private ShopsService shService;

//	@GetMapping("/member/registrationpage")
//	public String registrationpage() {
//		return"member/Registration";
//	}
	
	// Registration 1

	@PostMapping("/member/registration")
	public String memberSignUp(@RequestParam("memberEmail") String memberAccount,
			@RequestParam("memberPassword") String memberPassword,
			@RequestParam("re_memberPassword") String memberRePassword, Model m)
			throws UnsupportedEncodingException, MessagingException {

		Map<String, String> errors = new HashMap<String, String>();
		m.addAttribute("errors", errors);

		if (memberAccount == null || memberAccount.length() == 0 ) {
			errors.put("AccountWrong", "請輸入符合格式的電子郵件地址");
		}
			if (memberPassword == null || memberPassword.length() == 0 && memberPassword != memberRePassword) {
			errors.put("PasswordWrong", "密碼不正確");
			System.out.println("eeeeeeeeerrrror");
		}
			
		
		if (errors != null && !errors.isEmpty()) {
			return "redirect:/guest/signup";
		}
		

		
		Members member = new Members();
		member.setMemberAccount(memberAccount);
		member.setMemberPassword(memberPassword);
		// 還沒驗證所以Valid是0，經過信箱驗證後便由另一個controller設成1
		member.setMemberValid(0);
		member.setMemberLevel(1);
		memberService.insertMember(member);
		memberService.sendVertificationEnail(member);
		
		return "member/RegistSuccess";
		
	}

	// Registration 2
	@PostMapping("/member/post")
	public String memberRegistration(@RequestParam("memberId") Integer memberId, 
									 @RequestParam("memberLastName") String memberLastName,
									 @RequestParam("memberFirstName") String memberFirstName,
									 @RequestParam("memberSex") Integer memberSex, 
									 @RequestParam("memberBirthday") Date memberBirthday,
									 @RequestParam("memberPhone") String memberPhone,
									 @RequestParam("memberPhone") String memberCellPhone,
									 @RequestParam("memberAddress") String memberAddress, 
									 @RequestParam("memberPhoto") MultipartFile memberPhoto, Model m, HttpSession session)
			throws MessagingException, IOException {

		java.util.Date jDate = new java.util.Date();
		long time = jDate.getTime();
		Date sDate = new Date(time);

		Map<String, String> errors = new HashMap<String, String>();
		m.addAttribute("errors", errors);

		if (memberLastName == null || memberLastName.length() == 0) {
			errors.put("errName", "memberLastName is require!");
		}
		if (memberFirstName == null || memberFirstName.length() == 0) {
			errors.put("errName", "memberFirstName is require!");
		}


		if (memberSex == 0) {
			errors.put("errGender;", "Please choose your gender!");
		}

		if (memberBirthday == null || memberBirthday == sDate) {
			errors.put("errBirthday;", "Birthday form is wrong");
		}

		

		if (errors != null && !errors.isEmpty()) {
			return "member/Registration";
		}

		
		
		// verify 那邊有設屬性名為memberId，在此用找到的Id來設定memberDetails(原本想法)
		//住前則使用session的attribute
		System.out.println("reqId: " + memberId);
		Members m2 =memberService.findById(memberId);
		String mEmail = m2.getMemberAccount();
		System.out.println("mEmial: " + mEmail);
		
		m2.setMemberValid(2);
		
//		Members member = new Members(memberId);
//		member.setMemberValid(1);
		
		
		
		MemberDetails memberDetail = new MemberDetails();
		memberDetail.setMemberId(memberId);
		memberDetail.setMemberLastName(memberLastName);
		memberDetail.setMemberFirstName(memberFirstName);
		memberDetail.setMemberEmail(m2.getMemberAccount());
		memberDetail.setMemberSex(memberSex);
		memberDetail.setMemberBirthday(memberBirthday);
		memberDetail.setMemberPhone(memberPhone);
		memberDetail.setMemberAddress(memberAddress);
		
		byte[] photo = memberPhoto.getBytes();
		memberDetail.setMemberPhoto(photo);

		memberDetailService.insertMemberDetails(memberDetail);
		ucService.insert(memberId);
		MemberDetails memberNameById = memberDetailService.useIdFindName(memberId);
		String memberName = memberNameById.getMemberFirstName();
		
		session.setAttribute("memberName", memberName);
		
		session.setAttribute("member", memberDetail);
//		memberService.sendVertificationEnail(member, memberDetail);

		return "redirect:/member/main";
	}

	@ResponseBody
	@PostMapping("/member/checkaccount")
	public Map<String,String> checkAccount(@RequestParam(value = "memberEmail") String memberAccount,
			Model m) {
		Members account = memberService.checkAccount(memberAccount);
		Map<String, String> errors = new HashMap<String, String>();
	    HashMap<String, String> map = new HashMap<>();
	    
		
		if(account != null) {
			errors.put("AccountWrong", "此帳號已被註冊");
			map.put("response", "Y");
			return map;
		}
		m.addAttribute("Account", "此帳號可以被註冊");
		map.put("response", "N");
		return map;
	}

	@PostMapping("/member/checklogin")
	public String checkLogin(@RequestParam("memberEmail") String memberEmail,
			@RequestParam("memberPassword") String memberPassword, HttpSession session, Model m) {

		Map<String, String> errors = new HashMap<String, String>();
//		session.setAttribute("errors", errors);
		m.addAttribute("errors", errors);

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

		Integer status = memberService.checkLogin(logInmember);
		System.out.println("SSSSSSSStatus:" + status);

		if (status == null) {
			errors.put("msg", "username or password is not correct");
			return "member/SignInPage";
		} else if(status == 1) {
			Members mEmail2 = memberService.useEmailFindId(memberEmail);
			Integer result2 = mEmail2.getMemberId();
//			session.setAttribute("memberId", result2);
//			session.setAttribute("member", mEmail2);
			
			m.addAttribute("memberId", result2);
			m.addAttribute("member", mEmail2);
			
			return "member/Registration";
					} else if (status == 2) {

			// 要先得到由Email找出的Id
			Members mEmail = memberService.useEmailFindId(memberEmail);
			Integer result = mEmail.getMemberId();

			System.out.println("ID: " + result);

			// 還要再去資料庫要資料 要寫dao 與 service 透過 id 回傳MemberDetail 中的Name
			MemberDetails idFindName = memberDetailService.useIdFindName(result);
			String memberName = idFindName.getMemberFirstName();

			System.out.println("Name: " + memberName);
			
			

//			session.setAttribute("memberId", result);
//			session.setAttribute("member", logInmember);
//			session.setAttribute("memberName", memberName);
			
			
			m.addAttribute("memberId", result);
			m.addAttribute("member", logInmember);
			m.addAttribute("memberName", memberName);
			

			System.out.println("status: " + status);
			
			return "redirect:main";
			
		} else if (status == 0) {
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

		//還是0因為基本資料未輸入
		member.setMemberValid(1);
		Integer newValid = member.getMemberValid();
		System.out.println("newV: " + newValid);
		memberService.insertMemberValid(newValid, memberValid);

		String pageTitle = verified ? "驗證成功" : "驗證失敗";

		// 拿來給接下來要填基本資料那頁的參數
		// 驗證成功應改為輸入基本資料那頁
		System.out.println("IdV: " + member.getMemberId());
		m.addAttribute("memberId", member.getMemberId());

		m.addAttribute("pageTitle", pageTitle);
		return "member/" + (verified ? "VerifySuccess" : "VerifyFail");
		//還是不要直接導向controller，導向成功頁面讓其重新登入，其中因登入時就設定session，使其跳轉到要輸入基本資料時可以得到屬性值
//		return verified ? "redirect:/member/registrationpage" : "VerifyFail";
	}

	@GetMapping("/member/main")
	public String toMemberMain(HttpSession session) {

		if (session.getAttribute("memberId") != null) {

			return "member/Main/MemberMainPage";
		}

		return "member/SignInPage";
	}

	@GetMapping("/member/logout")
	public String logOut(HttpSession session, SessionStatus status) {

		if (session.getAttribute("member") != null) {
//			session.invalidate();
			status.setComplete();
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
	public String personalInfo(HttpSession session) {
		// 用if()判斷是否為google
		if (session.getAttribute("member") != null) {
		return "member/Main/MyInfo";
		}
		
		return "/member/editpassword";
	}

	@GetMapping("/member/editpasswordpage")
	public String editPasswordpage(@RequestParam("memberId") Integer memberId, Model m, HttpSession session) {
		// 因為session有直接設memberId所以在jsp頁面可透過${memberId}得到，並且放在input標籤中，且命名memberId既可在此方法由@RequestParam("memberId")得到
		if(session.getAttribute("member") != null) {
		m.addAttribute("memberId", memberId);
		System.out.println("MemberId3: " + memberId);
		return "member/Main/EditPassword";
		}
		return"redirect:/guest/signin";
	}

	@PostMapping("/member/editpassword")
	public String editPassword(@RequestParam("oldPassword") String oldPassword,
			@RequestParam("newPassword") String newPassword, 
			@RequestParam("re_Password") String re_Password,
			@RequestParam("memberId") Integer memberId, Model m) {

		Map<String, String> errors = new HashMap<String, String>();
		m.addAttribute("errors", errors);

		Members member = memberService.findById(memberId);
		System.out.println("old: " + oldPassword);
		System.out.println("new: " + newPassword);
		System.out.println("Re: " + re_Password);
		System.out.println("memberPassword:" + member.getMemberPassword());
		
		String encryptOldPassword = CipherUtils.getStringSHA512(oldPassword);
		String encryptNewPassword = CipherUtils.getStringSHA512(newPassword);
		String encryptReNewPassword = CipherUtils.getStringSHA512(re_Password);
		
		if (encryptOldPassword.equals(member.getMemberPassword()) && encryptNewPassword.equals(encryptReNewPassword)
				&& encryptNewPassword.length() != 0 || encryptReNewPassword.length() != 0) {
			member.setMemberPassword(newPassword);
			memberService.insertMember(member);
			return "redirect:/member/main";

		}

		if (!encryptOldPassword.equals(member.getMemberPassword()) || encryptOldPassword.equals(null) || encryptOldPassword.isEmpty()) {

			errors.put("WrongPassword", "請輸入正確之原有密碼");
		}

		if (encryptNewPassword.length() == 0 || encryptReNewPassword.length() == 0) {
			errors.put("NoPassword", "請輸入新密碼");
		}

		if (!encryptNewPassword.equals(encryptReNewPassword) || encryptNewPassword.equals(null) || encryptReNewPassword.equals(null)) {

			errors.put("checkProblem", "新密碼與確認新密碼不符");
		}

		return "member/Main/EditPassword";
	}

	@PostMapping("/member/editinfopage")
	public String toEditInfo(@RequestParam("memberId") Integer memberId,
			@RequestParam("memberPassword") String memberPassword, Model m) {
		Members member = memberService.findById(memberId);
		MemberDetails memberDetail = memberDetailService.findMemberDetailsById(memberId);
		
		 String encryPassword= CipherUtils.getStringSHA512(memberPassword);
		
		
		
		Map<String, String> errors = new HashMap<String, String>();
		m.addAttribute("errors", errors);

		if (encryPassword.equals(member.getMemberPassword()) && !encryPassword.equals(null)) {

			m.addAttribute("memberDetail", memberDetail);

			return "member/Main/EditInformation";
		}
		if (encryPassword.equals(null) || !encryPassword.equals(member.getMemberPassword())) {
			errors.put("WrongPassword", "密碼不正確，請重新輸入");
		}

		return "member/Main/MyInfo";
	}

	@PostMapping("/member/editinfo")
	public String editInfo(@RequestParam("memberId") Integer memberId,
			@RequestParam("memberLastName") String memberLastName,
			@RequestParam("memberFirstName") String memberFirstName, @RequestParam("memberEmail") String memberEmail,
			@RequestParam("memberPhone") String memberPhone, @RequestParam("memberAddress") String memberAddress,
			@RequestParam("memberGender") Integer memberGender, @ModelAttribute("memberDetail") MemberDetails detail) {

		MemberDetails memberdetail = memberDetailService.findMemberDetailsById(memberId);
		memberdetail.setMemberLastName(memberLastName);
		memberdetail.setMemberFirstName(memberFirstName);
		memberdetail.setMemberEmail(memberEmail);
		memberdetail.setMemberPhone(memberPhone);
		memberdetail.setMemberAddress(memberAddress);
		memberdetail.setMemberSex(memberGender);

		memberDetailService.insertMemberDetails(memberdetail);

		return "member/Main/MyInfo";
	}

	@GetMapping("/member/myfavorite")
	public String toMyFavoritePage(@RequestParam(name = "p", defaultValue = "1") Integer pageNumber,
			 Model m, @RequestParam("memberId") Integer memberId) {
		
		
		
		Page<EBookFavorite> page = ebfService.getAllFavotitesByPage(pageNumber, memberId);
		if(page == null) {
			return "member/Main/MyFavorite";
		}
		
		m.addAttribute("page", page);
		
		return "member/Main/MyFavorite";
	}
	
	@GetMapping("/member/myebook")
	public String toMyEBookPage(@RequestParam(name = "p", defaultValue = "1") Integer pageNumber, 
			@RequestParam("memberId") Integer memberId, Model m) {
		
		Page<EBookPurchases> page = ebpService.getAllEBookPurchaseByMember(pageNumber, memberId);
		if(page == null) {
			return "member/Main/MyEBook";
		}
		m.addAttribute("page", page);
		
		return "member/Main/MyEBook";
	}
	// 會員訂單查詢
	@GetMapping("/member/myorder")
	public String findSalesByMemberId(HttpSession session, Model model) {
		
		Integer memberId = (Integer) session.getAttribute("memberId");
		List<Sales> myorder = sService.findSalesByMemberId(memberId);
		List<Shops> allShopList = shService.findAllShop();
		Collections.reverse(myorder);
		
		model.addAttribute("myorder", myorder); 
		model.addAttribute("allShopList", allShopList);
		
		return "member/Main/MyOrders";
	}
	

}