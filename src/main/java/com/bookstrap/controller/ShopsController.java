package com.bookstrap.controller;

import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.bookstrap.model.Shops;
import com.bookstrap.service.ShopsService;

@Controller
public class ShopsController {

	@Autowired
	private ShopsService shService;

	@ResponseBody
	@PostMapping("/shops/add")
	public String insert(@RequestBody Shops sh) {
		shService.insertShop(sh);
		return "http://localhost:8080/Bookstrap/shops/shophome";
	}

//	@GetMapping("/shops/shophome")
//	public String listHouse(Model model) {
//		
//		List<Shops> shopList = shService.findAllShop();
//		model.addAttribute("shopList", shopList);
//		
//        return "shop/shophome";
//	}
	@GetMapping("/shops/good")
	public String gogoodshop() {

        return "shop/good";
	}
	
	@GetMapping("/shops/shopmap")
	public String gomapshop() {

        return "shop/shopmap";
	}
	
	
	@ResponseBody
	@PostMapping("/shops/postAjax")
	public String postAjaxUpload(@RequestParam("shopName") String shopName,
			@RequestParam("shopAddress") String shopAddress, @RequestParam("shopPhone") String shopPhone,
			@RequestParam("shopOpenHour") String shopOpenHour, @RequestParam("shopcloseHour") String shopcloseHour,
			@RequestParam("longitude") String longitude, @RequestParam("latitude") String latitude,
			@RequestParam("shopphoto") MultipartFile shopphoto) {
		try {
			Shops sh = new Shops();
			sh.setShopName(shopName);
			sh.setShopAddress(shopAddress);
			sh.setShopPhone(shopPhone);
			sh.setShopOpenHour(shopOpenHour);
			sh.setShopcloseHour(shopcloseHour);
			sh.setShopphoto(shopphoto.getBytes());
			sh.setLongitude(longitude);
			sh.setLatitude(latitude);

			shService.insertShop(sh);
			return "上傳成功";
		} catch (IOException e) {
			e.printStackTrace();
			return "失敗，IO 的問題";
		}
	}
	@ResponseBody
	@GetMapping("/shops/allshopslist")
	public List<Shops> listHouse() {

		List<Shops> shopList = shService.findAllShop();

		return shopList;
	}

	// get one photo contentType 要注意
	@GetMapping("/shops/id")
	public ResponseEntity<byte[]> getPhotoById(@RequestParam Integer id) {
		Shops photo1 = shService.getPhotoById(id);

		byte[] photofile = photo1.getShopphoto();
		HttpHeaders headers = new HttpHeaders();

		headers.setContentType(MediaType.IMAGE_JPEG);
		// ResponseEntity 內建 @ResponseBody // 資料, headers, 回應的 http status
		return new ResponseEntity<byte[]>(photofile, headers, HttpStatus.OK);

	}

	@ResponseBody
	@GetMapping("/shops/api/page")
	public Page<Shops> showMessageByPageAjax(@RequestParam(name = "p", defaultValue = "1") Integer pageNumber) {

		Page<Shops> page = shService.getshopByPage(pageNumber);

		return page;
	}

	@ResponseBody
	@GetMapping("/shops/api/page2")
	public Page<Shops> showMessageByPageAjax2(@RequestParam(name = "p", defaultValue = "1") Integer pageNumber) {

		Page<Shops> page = shService.getshopByPage(1);

		return page;
	}

	@ResponseBody
	@PutMapping("/shops/api/put")
	public Shops updateMessageApi(@RequestParam("shopId") Integer shopId, @RequestParam("shopName") String shopName,
			@RequestParam("shopAddress") String shopAddress, @RequestParam("shopPhone") String shopPhone,
			@RequestParam("shopOpenHour") String shopOpenHour, @RequestParam("shopcloseHour") String shopcloseHour,
			@RequestParam("longitude") String longitude, @RequestParam("latitude") String latitude,
			@RequestParam("shopphoto") MultipartFile shopphoto) {
		try {
			byte[] shopphotobytes = shopphoto.getBytes();
			Shops updatedMsg = shService.updateShopById(shopId, shopName, shopAddress, shopPhone, shopOpenHour,
					shopcloseHour, shopphotobytes, longitude, latitude);
		} catch (IOException e) {
			e.printStackTrace();
		}

		return null;

	}

	@GetMapping("/shops/shophome")
	public String mixMessagePage(@RequestParam(name = "p", defaultValue = "1") Integer pageNumber, Model model) {
		Page<Shops> page = shService.getshopByPage(pageNumber);
		model.addAttribute("page", page);
		return "shop/shophome";
	}

	@DeleteMapping("/shops/api/delete")
	public String deleteshopsApi(@RequestParam("msgId") Integer msgId) {
		shService.deleteshopsbById(msgId);
		return "redirect:/shop/shophome";
	}
	
	@ResponseBody
	@GetMapping("/shops/addressshopslist")
	public List<Shops> findShopByAddress(String address) {

		List<Shops> shlist = shService.findShopByAddress(address);

		return shlist;
	}
	
	
	@ResponseBody
	@GetMapping("/shops/addressshopslist1")
	public Shops findShopByid(Integer id) {

		Shops shlist = shService.findShopByid( id);

		return shlist;
	}
}
