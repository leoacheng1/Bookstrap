package com.bookstrap.harry.service;

import java.io.UnsupportedEncodingException;
import java.util.List;
import java.util.Optional;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.bookstrap.harry.bean.MemberDetails;
import com.bookstrap.harry.bean.Members;
import com.bookstrap.harry.dao.CheckLogin;
import com.bookstrap.harry.dao.MemberRepository;

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
		String randomCode = RandomString.make(64);
		member.setVertificationCode(randomCode);
		
//		sendVertificationEnail(member);
		
		return mDao.save(member);
	}

	public void sendVertificationEnail(Members member, MemberDetails memberDetail,String siteURL) throws UnsupportedEncodingException, MessagingException {
			String subject = "請確認您的註冊信箱";
			String senderName = "BookStrap team";
			String mailContent ="<p>"+ memberDetail.getMemberName() 
					+ "您好" + "</p>";
			mailContent += "<p>請進入連結以認證註冊信箱地址:</p>";
			
			String vertifyURL = siteURL + "/vertify?code=" + member.getVertificationCode();
			mailContent +="<h3><a href=\"" + vertifyURL + "\">驗證</a></h3>";
			mailContent +="<p>BookStrap team</p>";
	
			MimeMessage message = mailSender.createMimeMessage();
			MimeMessageHelper helper = new MimeMessageHelper(message);
			helper.setFrom("bookstrap157@gmail.com", senderName);
			helper.setTo(memberDetail.getMemberEmail());
			helper.setSubject(subject);
			helper.setText(mailContent, true);
			
			mailSender.send(message);
	
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

	public boolean checkLogin(Members member) {

		return checkDao.checkLogin(member);
	}

	public Members useEmailFindId(String memberEmail) {
		return mDao.findIdByEmail(memberEmail);
	}

}
