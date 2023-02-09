package com.bookstrap.controller;

import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
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
			@RequestParam("longitude") String longitude,
			@RequestParam("latitude") String latitude ,
			@RequestParam("shopphoto") MultipartFile shopphoto) 
	{
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
	
	@GetMapping("/shops/allshopslist")
	public ModelAndView listHouse(ModelAndView mav) {
		
		List<Shops> shopList = shService.findAllShop();
		mav.setViewName("shop/shophome");
		mav.getModel().put("shopList", shopList);
        return mav;
	}
	// get one photo contentType 要注意
		@GetMapping("/shops/id")
		public ResponseEntity<byte[]> getPhotoById(@RequestParam Integer id){
			Shops photo1 = shService.getPhotoById(id);
			
			
			byte[] photofile = photo1.getShopphoto();
			HttpHeaders headers = new HttpHeaders();
			
			headers.setContentType(MediaType.IMAGE_JPEG);
	        //ResponseEntity 內建 @ResponseBody   // 資料, headers, 回應的 http status
			return new ResponseEntity<byte[]>(photofile,headers,HttpStatus.OK);
			
		}
}
