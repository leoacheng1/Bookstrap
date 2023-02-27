package com.bookstrap.harry.config;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.bookstrap.harry.bean.MemberDetails;
import com.bookstrap.harry.bean.Members;
import com.bookstrap.harry.service.MemberDdetailService;
import com.bookstrap.harry.service.MemberService;

@Controller
public class GoogleController {

	@Autowired
	private MemberService memberService;
	
	@Autowired
	private MemberDdetailService memberDetailService;
	
	@Autowired
	private UserService userService;
	
	@GetMapping("/google/get")
	public String getGoogleAccount(HttpSession session, @RequestParam("mEmail") String mEmail) {
		Map<String, String> errors = new HashMap<String, String>();
		session.setAttribute("errors", errors);
		
		Members user = userService.findPasswordByEmail(mEmail);
		
		String uEmail = user.getMemberAccount();
		String uPassword = user.getMemberPassword();
		Members loginUser = new Members(uEmail, uPassword);
//		user.setMemberValid(1);
		Integer status = memberService.checkLogin(loginUser);
		
		
		if (status == null) {
			errors.put("msg", "username or password is not correct");
			return "member/SignInPage";
		} else if(status == 1) {
			Members mEmail2 = memberService.useEmailFindId(mEmail);
			Integer result2 = mEmail2.getMemberId();
			session.setAttribute("memberId", result2);
			return "member/Registration";
					}else if (status == 2) {

						// 要先得到由Email找出的Id
						Members m2Email = memberService.useEmailFindId(mEmail);
						Integer result = m2Email.getMemberId();

						System.out.println("ID: " + result);

						// 還要再去資料庫要資料 要寫dao 與 service 透過 id 回傳MemberDetail 中的Name

						MemberDetails idFindName = memberDetailService.useIdFindName(result);
						
						String memberName = idFindName.getMemberFirstName();

						System.out.println("Name: " + memberName);

						session.setAttribute("memberId", result);

						session.setAttribute("member", loginUser);

						session.setAttribute("memberName", memberName);

						System.out.println("status: " + status);
						
						return "redirect:/member/main";
						
					} else if (status == 0) {
						return "member/VertifyStatus";
					}

					errors.put("msg", "username or password is not correct");
					return "member/SignInPage";
					

		
		
			
			
//		return "redirect:/member/registrationpage";
		
		
	}
	
}
