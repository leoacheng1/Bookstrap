package com.bookstrap.harry.controller;

import java.io.UnsupportedEncodingException;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.repository.query.Param;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMailMessage;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.bookstrap.harry.bean.Members;
import com.bookstrap.harry.service.MemberNotFoundException;
import com.bookstrap.harry.service.MemberService;

import net.bytebuddy.utility.RandomString;

@Controller
public class FogotPassword {

	@Autowired
	private MemberService memberService;

	@Autowired
	private JavaMailSender mailSender;

	@GetMapping("/forgot/password")
	public String showForgotPassword(Model model) {

		model.addAttribute("pageTitle", "Forgot Password");
		return "member/ForgotPassword";
	}

	@PostMapping("/forgot/password")
	public String processForgotPasswordForm(HttpServletRequest request, Model model) {
		// 在member/ForgotPassword中輸入電子信箱標籤中的 name="email "
		String email = request.getParameter("email");
		String token = RandomString.make(45);

		try {
			memberService.updateResetPasswordToken(token, email);
			//產生 reset password 連結
			String resetPasswordLink = "http://localhost:8080/Bookstrap" + "/reset/password?token=" + token;
			//寄信
			sendEmail(email, resetPasswordLink);
			
			model.addAttribute("message", "修改密碼確認信件已寄出，請檢察是否有收到郵件");
			
		} catch (MemberNotFoundException e) {
			model.addAttribute("error", e.getMessage());
		} catch (UnsupportedEncodingException | MessagingException e) {
			model.addAttribute("error", "Error while sending email!");
		} 

		return "member/ForgotPassword";
	}

	private void sendEmail(String email, String resetPasswordLink)
			throws UnsupportedEncodingException, MessagingException {
		MimeMessage message = mailSender.createMimeMessage();
		MimeMessageHelper helper = new MimeMessageHelper(message);

		helper.setFrom("bookstrap157@gmail.com", "Bookstrap team");
		helper.setTo(email);

		String subject = "Bookstrap會員密碼修改";
		String content = "<p>您好:</p>" + "<p>根據提出修改密碼的請求</p>" + "<p>請點選以下連結以修改您的密碼:</p>" + "<a href=\""
				+ resetPasswordLink + "\"> 修改密碼</a>" + "<p>如您沒有提出修改密碼請求，請勿點選連結，並與客服聯繫。</p>";

		helper.setSubject(subject);
		helper.setText(content, true);
		
		mailSender.send(message);
	}

	@GetMapping("/reset/password")
	public String showResetPasswordFrom(@Param(value = "token") String token, Model model) {
		Members member = memberService.get(token);
		if(member == null) {
			model.addAttribute("title", "Reset your password");
			model.addAttribute("message", "Invalid Token");
			
			return "member/Message";
		}
		
		model.addAttribute("token", token);
		model.addAttribute("pageTitle", "Reset Password");
		
		return "member/ResetPassword";
	}
	
	@PostMapping("/reset/password")
	public String processResetPassword(HttpServletRequest request, Model model) {
		String token = request.getParameter("token");
		String password = request.getParameter("password");
		System.out.println(token);
		
		Members member = memberService.get(token);
		 model.addAttribute("title", "Reset your password");
		//1:08:28
		if(member == null) {
			model.addAttribute("title", "Reset your password");
			model.addAttribute("message", "Invalid Token");
			return "member/Message";
			
		} else {
			memberService.updatePassword(member, password);
			model.addAttribute("message", "成功更新密碼");
			return "redirect:/index";
		}
//		return "redirect:/reset/password";
	}
	
}
