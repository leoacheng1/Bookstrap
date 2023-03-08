package com.bookstrap.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class ChatBoxController {

	
	
	@GetMapping("/chatbox")
	public String gotochatbox() {

		return "chatbox/chatbox";
	}

}
