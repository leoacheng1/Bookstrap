package com.bookstrap.harry.service;

import java.io.UnsupportedEncodingException;
import java.util.List;
import java.util.Optional;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import javax.print.attribute.standard.PageRanges;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.bookstrap.harry.bean.MemberDetails;
import com.bookstrap.harry.bean.Members;
import com.bookstrap.harry.dao.CheckLogin;
import com.bookstrap.harry.dao.MemberRepository;
import com.bookstrap.harry.security.CipherUtils;

import net.bytebuddy.utility.RandomString;

@Service
@Transactional
public class MemberService {

	@Autowired
	private MemberRepository mDao;

	@Autowired
	private CheckLogin checkDao;

	@Autowired
	private JavaMailSender mailSender;
	
	

	public Members insertMember(Members member) {
		String memberPassword = member.getMemberPassword();
		String encodePassword = CipherUtils.getStringSHA512(memberPassword);
		
		member.setMemberPassword(encodePassword);
		
		String randomCode = RandomString.make(64);
		member.setVertificationCode(randomCode);


		return mDao.save(member);
	}

	public void sendVertificationEnail(Members member) throws UnsupportedEncodingException, MessagingException {
		String subject = "請確認您的註冊信箱";
		String senderName = "BookStrap team";
		String mailContent = "<p>" + member.getMemberAccount() + "您好" + "</p>";
		mailContent += "<p>請進入連結以認證註冊信箱地址:</p>";

//			這裡用localhost充當
		String verifyURL = "http://localhost:8080/Bookstrap" + "/member/verify?code=" + member.getVertificationCode();
		mailContent += "<h3><a href=\"" + verifyURL + "\">驗證</a></h3>";
		mailContent += "<p>BookStrap team</p>";

		MimeMessage message = mailSender.createMimeMessage();
		MimeMessageHelper helper = new MimeMessageHelper(message);
		helper.setFrom("bookstrap157@gmail.com", senderName);
		helper.setTo(member.getMemberAccount());
		helper.setSubject(subject);
		helper.setText(mailContent, true);

		mailSender.send(message);

	}

	public Members findByVerifyCode(String code) {
		return mDao.findByVerifyCode(code);
	}

	public Integer insertMemberValid(Integer valid, Integer memberId) {
		return mDao.updateMemberValid(valid, memberId);

	}

	public boolean deleteMemberById(Integer memberId) {
		if (memberId != null) {
			mDao.deleteById(memberId);
			return true;
		}
		return false;
	}

	public Members findById(Integer memberId) {
		Optional<Members> op = mDao.findById(memberId);

		if (op.isPresent()) {
			return op.get();
		}
		System.out.println("Id not found!");
		return null;

	}

	public List<Members> findAllMember() {
		return mDao.findAll();
	}

	public Members updateMemberById(Integer memberId, String memberPassword) {
		Optional<Members> op = mDao.findById(memberId);
		if (op.isPresent()) {
			Members member = op.get();
			member.setMemberPassword(memberPassword);
			return member;
		}
		System.out.println("Id not found!");
		return null;
	}

	public Integer checkLogin(Members member) {
		String memberPassword = member.getMemberPassword();
		String encodePassword = CipherUtils.getStringSHA512(memberPassword);
		System.out.println("Before en:" + memberPassword);
		
		member.setMemberPassword(encodePassword);
		
		
		System.out.println("after enc" + encodePassword);
		member.setMemberPassword(encodePassword);
			
		return checkDao.checkLogin(member);
	}

//	public Integer checkValid(Members member) {
//		return checkDao.checkLogin(member);
//	}

	public Members useEmailFindId(String memberEmail) {
		return mDao.findIdByEmail(memberEmail);
	}

	public Members checkAccount(String memberEmail) {
		return mDao.findAccountByEmail(memberEmail);
	}

	public boolean verify(String verificationCode) {
		Members member = mDao.findByVerificationCode(verificationCode);

		if (member == null) {
			return false;
		} else {
			return true;
		}

	}

	public void updateResetPasswordToken(String token, String email) throws MemberNotFoundException {
		Members member = mDao.findIdByEmail(email);
		System.out.println("TokenEmail: " + email);
		if (member != null) {
			member.setResetPasswordToken(token);
			mDao.save(member);
		} else {
			new MemberNotFoundException("Could not found any member!" + email);
		}

	}

	public Members get(String resetPasswordToken) {
		return mDao.findByResetPasswordToken(resetPasswordToken);
	}

	
	public void updatePassword(Members member, String newPassword) {
		BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
		String encodePassword = passwordEncoder.encode(newPassword);
		
		member.setMemberValid(2); //不知道要不要加?
		member.setMemberPassword(encodePassword);
		member.setResetPasswordToken(null);
		//16:29
		mDao.save(member);
	}

	
	
//	public Page<Members> getMemberByPage(Integer pageNumber){
//		Pageable pgb = PageRequest.of(pageNumber-1, 3, Sort.Direction.DESC, "memberId");
//			Page<Members> page = mDao.findAll(pgb);
//			return page;
//	}
	
	
	
	//	public void sendVertificationEnail(Members member, MemberDetails memberDetail) throws UnsupportedEncodingException, MessagingException {
//		String subject = "請確認您的註冊信箱";
//		String senderName = "BookStrap team";
//		String mailContent ="<p>"+ memberDetail.getMemberName() 
//				+ "您好" + "</p>";
//		mailContent += "<p>請進入連結以認證註冊信箱地址:</p>";
//		
////		這裡用localhost充當
//		String verifyURL = "http://localhost:8080/Bookstrap" + "/member/verify?code=" + member.getVertificationCode();
//		mailContent +="<h3><a href=\"" + verifyURL + "\">驗證</a></h3>";
//		mailContent +="<p>BookStrap team</p>";
//
//		MimeMessage message = mailSender.createMimeMessage();
//		MimeMessageHelper helper = new MimeMessageHelper(message);
//		helper.setFrom("bookstrap157@gmail.com", senderName);
//		helper.setTo(memberDetail.getMemberEmail());
//		helper.setSubject(subject);
//		helper.setText(mailContent, true);
//		
//		mailSender.send(message);
//
//}

}
