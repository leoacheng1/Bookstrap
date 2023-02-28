
package com.bookstrap.harry.controller;

import java.io.IOException;
import java.sql.Date;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.context.properties.bind.BindResult;
import org.springframework.data.domain.Page;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.bookstrap.harry.bean.MemberDetails;
import com.bookstrap.harry.bean.Members;
import com.bookstrap.harry.service.MemberDdetailService;
import com.bookstrap.harry.service.MemberService;

@Controller
public class MemberAdmiController {

	@Autowired
	private MemberService memberService;

	@Autowired
	private MemberDdetailService memberDetailService;

	@GetMapping("/admin/main")
	public String toAdmiMember() {
		return "member/Admi/MemberAdmiMain";
	}

	// member/admin/allmember?p=
	// 在此addAttribut的page名為page，在jsp中用foreach來使用
	// 顯示內容 <jstl:forEach var="messages" items="${page.content}">
	// 顯示頁數 <jstl:forEach var="pageNumber" begin="1" end="${page.totalPages}">
	@GetMapping("/admin/get/allmember")
	public String getAllmembers(@RequestParam(name = "p", defaultValue = "1") Integer pageNumber, Model m) {
		Page<MemberDetails> page = memberDetailService.getMemberByPage(pageNumber);
		m.addAttribute("page", page);

		return "member/Admi/AdminAllMember";
	}

	@GetMapping("/admin/post/memberpage")
	public String addMemberPage(ModelMap map) {
		Members member = new Members();
		MemberDetails memberDetail = new MemberDetails();
		map.addAttribute("member", member);
		map.addAttribute("memberDetail", memberDetail);

		return "member/Admi/AdminAddMember";
	}

	@PostMapping("/admin/post/member")
	public String addMember(@RequestParam("memberEmail") String memberEmail,
			@RequestParam("memberPassword") String memberPassword,
			@RequestParam("re_memberPassword") String memberRePassword,
			@RequestParam("memberValid") Integer memberValid, 
			@RequestParam("memberLevel") Integer memberLevel,
			@RequestParam("memberLastName") String memberLastName, 
			@RequestParam("memberFirstName") String memberFirstName,
			@RequestParam("memberPhone") String memberPhone, 
			@RequestParam("memberAddress") String memberAddress,
			@RequestParam("memberBirthday") Date memberBirthday, 
			@RequestParam("memberSex") Integer memberSex,
			@RequestParam("memberPhoto") MultipartFile memberPhoto, Model m) throws IOException {
		Map<String, String> errors = new HashMap<>();
		m.addAttribute("errors", errors);

		if (memberEmail == null || memberEmail.length() == 0) {
			errors.put("errorEmail", "Email is require!");
		}

		if (memberPassword == null || memberPassword.length() == 0 && memberPassword != memberRePassword) {
			errors.put("errorPassword", "Password is require!");
		}
		
		if(memberLastName == null || memberLastName.length() == 0) {
			errors.put("errorLastName", "LastName is require!");
		}
		
		if(memberFirstName == null || memberFirstName.length() == 0) {
			errors.put("errorFirstName", "FirstName is require!");
		}
		
		if(memberPhone == null || memberPhone.length() ==0) {
			errors.put("errorPhone", "Phone is require!");
		}
		
		if(memberAddress == null || memberAddress.length() ==0) {
			errors.put("errorAddress", "Address is require!");
		}
		
		if(memberBirthday == null) {
			errors.put("errorBirthday", "Birthday is require!");
		}
		
		if(memberSex == null || memberSex == 0) {
			errors.put("errorSex", "Gender is require!");
		}
		
		if (errors != null && !errors.isEmpty()) {
			return "redirect:/admin/post/memberpage";
		}
		
		Members member = new Members();
		MemberDetails memberDetail = new MemberDetails();

		member.setMemberAccount(memberEmail);
		member.setMemberPassword(memberPassword);
		member.setMemberValid(memberValid);
		member.setMemberLevel(memberLevel);
		Members member2 = memberService.insertMember(member);
		
		memberDetail.setMemberId(member2.getMemberId());
		memberDetail.setMemberAddress(memberAddress);
		memberDetail.setMemberBirthday(memberBirthday);
		memberDetail.setMemberEmail(memberEmail);
		memberDetail.setMemberLastName(memberLastName);
		memberDetail.setMemberFirstName(memberFirstName);
		memberDetail.setMemberSex(memberSex);
		memberDetail.setMemberPhone(memberPhone);

		byte[] photo = memberPhoto.getBytes();
		memberDetail.setMemberPhoto(photo);
		
		
		
		memberDetailService.insertMemberDetails(memberDetail);
//		LinkedList<MemberDetails> listPhoto = new LinkedList<>();
//		for(MultipartFile photo : memberPhoto) {
//			MemberDetails mPhoto = new MemberDetails();
//			byte[] photoBytes = photo.getBytes();
//			mPhoto.setMemberPhoto(photoBytes);
//		}
		

		return "redirect:/admin/get/allmember";
	}
	
	
	@DeleteMapping("/admin/delete/member")
	public String deleteMember(@RequestParam("memberId") Integer memberId) {
		
		boolean deleteDetail = memberDetailService.deleteMemberDetailByID(memberId);
		if(deleteDetail) {
			memberService.deleteMemberById(memberId);
			return "redirect:/admin/get/allmember";
		}
		return "redirect:/admin/get/allmember";
	}
	
	
	@GetMapping("/admin/edit/member")
	public String editMemberPage(@RequestParam("memberId") Integer memberId, ModelMap map) {
		Members findById = memberService.findById(memberId);
		MemberDetails findMemberDetailsById = memberDetailService.findMemberDetailsById(memberId);
		//When add ModelAttribute, that need spriing's form tag to get attribute.
		map.addAttribute("member", findById);
		map.addAttribute("memberDetail", findMemberDetailsById);
		
		
		return "member/Admi/AdminEditMember";
		
	}
	
	@PostMapping("/admin/put/member")
	public String sendEditedMember(@RequestParam("memberId") Integer memberId,
			@RequestParam("memberEmail") String memberEmail,
			@RequestParam("memberPassword") String memberPassword,
			@RequestParam("re_memberPassword") String memberRePassword,
			@RequestParam("memberValid") Integer memberValid, 
			@RequestParam("memberLevel") Integer memberLevel,
			@RequestParam("memberLastName") String memberLastName, 
			@RequestParam("memberFirstName") String memberFirstName,
			@RequestParam("memberPhone") String memberPhone, 
			@RequestParam("memberAddress") String memberAddress,
			@RequestParam("memberBirthday") Date memberBirthday, 
			@RequestParam("memberSex") Integer memberSex,
			@RequestParam("memberPhoto") MultipartFile memberPhoto, Model m) throws IOException {
		
		Map<String, String> errors = new HashMap<>();
		m.addAttribute("errors", errors);

		if (memberEmail == null || memberEmail.length() == 0) {
			errors.put("errorEmail", "Email is require!");
		}

		if (memberPassword == null || memberPassword.length() == 0 && memberPassword != memberRePassword) {
			errors.put("errorPassword", "Password is require!");
		}
		
		if(memberLastName == null || memberLastName.length() == 0) {
			errors.put("errorLastName", "LastName is require!");
		}
		
		if(memberFirstName == null || memberFirstName.length() == 0) {
			errors.put("errorFirstName", "FirstName is require!");
		}
		
		if(memberPhone == null || memberPhone.length() ==0) {
			errors.put("errorPhone", "Phone is require!");
		}
		
		if(memberAddress == null || memberAddress.length() ==0) {
			errors.put("errorAddress", "Address is require!");
		}
		
		if(memberBirthday == null) {
			errors.put("errorBirthday", "Birthday is require!");
		}
		
		if(memberSex == null || memberSex == 0) {
			errors.put("errorSex", "Gender is require!");
		}
		
		if (errors != null && !errors.isEmpty()) {
			return "redirect:/admin/post/memberpage";
		}
		
		
		Members member = memberService.findById(memberId);
		MemberDetails memberDetail = memberDetailService.findMemberDetailsById(memberId);

		member.setMemberAccount(memberEmail);
		member.setMemberPassword(memberPassword);
		member.setMemberValid(memberValid);
		member.setMemberLevel(memberLevel);
		
		
		Members member2 = memberService.insertMember(member);
		
		memberDetail.setMemberId(member2.getMemberId());
		memberDetail.setMemberAddress(memberAddress);
		memberDetail.setMemberBirthday(memberBirthday);
		memberDetail.setMemberEmail(memberEmail);
		memberDetail.setMemberLastName(memberLastName);
		memberDetail.setMemberFirstName(memberFirstName);
		memberDetail.setMemberSex(memberSex);
		memberDetail.setMemberPhone(memberPhone);

		byte[] photo = memberPhoto.getBytes();
		memberDetail.setMemberPhoto(photo);
				
		
		memberDetailService.insertMemberDetails(memberDetail);
		
		
		
		return "redirect:/admin/get/allmember";
	}
	
	@GetMapping("/admin/get/getphoto")
	public ResponseEntity<byte[]> getPhoto(@RequestParam("memberId") Integer memberId) {
		MemberDetails photoId = memberDetailService.getPhotoById(memberId);
		byte[] photoFile = photoId.getMemberPhoto();
		HttpHeaders header = new HttpHeaders();
		header.setContentType(MediaType.IMAGE_JPEG);

		return new ResponseEntity<byte[]>(photoFile, header, HttpStatus.OK);
	}
	
	
	

//	@ModelAttribute("member")
//	public void commonData(Model m){
//		Members member = new Members();
//		
//		m.addAttribute("member", member);
//	}
//	
//	@ModelAttribute("memberdetail")
//	public void commonData2(Model m){
//		MemberDetails memberDetail = new MemberDetails();
//		
//		m.addAttribute("memberDetail", memberDetail);
//	}

}
