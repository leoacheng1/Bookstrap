package com.bookstrap.controller;

import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.bookstrap.model.Shops;
import com.bookstrap.service.ShopsService;

@Controller
public class ShopsController {

	@Autowired
	private ShopsService shService;

	@GetMapping("/shops/home")
	public String uploadPage() {
		return "shop/shophome";
	}

	@ResponseBody
	@PostMapping("/shops/add")
	public Shops insert(@RequestBody Shops sh) {
		return shService.insertShop(sh);
	}

	@ResponseBody
	@GetMapping("/shops/all")
	public List<Shops> findAllCustomer() {
		return shService.findAllShop();
	}

	@ResponseBody
	@PostMapping("/shops/postAjax")
	public String postAjaxUpload(@RequestParam("shopName") String shopName, 
			@RequestParam("shopAddress") String shopAddress,
			@RequestParam("shopPhone") String shopPhone, 
			@RequestParam("shopOpenHour") String shopOpenHour,
			@RequestParam("shopcloseHour") String shopcloseHour,
			@RequestParam("shopphoto") MultipartFile shopphoto,
			@RequestParam("longitude") String longitude,
			@RequestParam("latitude") String latitude ) 
	{
		try {
			System.out.println("err");
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
			System.out.println("ok");
			return "上傳成功";
		} catch (IOException e) {
			e.printStackTrace();
			return "失敗，IO 的問題";
		}
	}
}
