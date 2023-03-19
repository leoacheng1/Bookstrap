package com.bookstrap.controller;

import java.util.Map;

import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.RestTemplate;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;

@Controller
@RequestMapping("/api")
public class LineApiController {

//    private final RestTemplate restTemplate;

	private final String channelId = "1660754891";
	private final String channelSecret = "9763c2c5b3b62fe65d39d92d137348c9";
	private final String paymentUrl = "https://sandbox-api-pay.line.me/v2/payments/request";

//    public LineApiController(RestTemplate restTemplate) {
//        this.restTemplate = restTemplate;
//    }

	@SuppressWarnings("unchecked")
	@PostMapping("/line")
	@ResponseBody
	public String createLinePayment(@RequestBody Map<String, Object> requestBody) throws JsonProcessingException {

		// 設定請求Header
		HttpHeaders headers = new HttpHeaders();
		headers.setContentType(MediaType.APPLICATION_JSON);
		headers.set("X-LINE-ChannelId", channelId);
		headers.set("X-LINE-ChannelSecret", channelSecret);
		headers.set("Access-Control-Allow-Origin", "*");

		RestTemplate restTemplate = new RestTemplate();

		ObjectMapper objectMapper = new ObjectMapper();
		String requestBodyJson = objectMapper.writeValueAsString(requestBody);
		HttpEntity<String> entity = new HttpEntity<>(requestBodyJson, headers);
		System.out.println(entity);

		ResponseEntity<String> postForEntity = restTemplate.postForEntity(paymentUrl, entity, String.class);
		System.out.println(postForEntity.getBody());

		ObjectMapper objectMapper1 = new ObjectMapper();
		Map<String, Object> responseMap = objectMapper1.readValue(postForEntity.getBody(),
				new TypeReference<Map<String, Object>>() {
				});

		Map<String, Object> infoMap = (Map<String, Object>) responseMap.get("info");

		Map<String, String> paymentUrlMap = (Map<String, String>) infoMap.get("paymentUrl");

		String webUrl = paymentUrlMap.get("web");

		return webUrl;

	}

}
