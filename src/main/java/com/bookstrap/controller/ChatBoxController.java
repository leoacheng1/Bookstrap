package com.bookstrap.controller;

import org.springframework.messaging.handler.annotation.DestinationVariable;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.Payload;
import org.springframework.messaging.handler.annotation.SendTo;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import com.bookstrap.model.ChatMessage;
import com.bookstrap.model.Username;



@Controller
public class ChatBoxController {

	@GetMapping("/chatbox")
	public String gotochatbox() {

		return "chatbox/chatbox";
	}
	
	

	@GetMapping("/chatboxback")
	public String gotochatboxback() {

		return "chatbox/chatboxback";
	}
	
	
	
	
	
	
//	@MessageMapping("/chat.register")
//	@SendTo("/topic/public")
//	public ChatMessage register(@Payload ChatMessage chatMessage, SimpMessageHeaderAccessor headerAccessor) {
//		headerAccessor.getSessionAttributes().put("username", chatMessage.getSender());
//		return chatMessage;
//	}

	@MessageMapping("/chat/{roomName}")
	@SendTo("/topic/public/{roomName}")
	public ChatMessage sendMessage(@DestinationVariable("roomName") String roomName,@Payload ChatMessage chatMessage) {
		return chatMessage;
	}

	@MessageMapping("/chat.username")
	@SendTo("/topic/username")
	public Username getUserName(@Payload Username username) {

		return username;
		
	}

}
