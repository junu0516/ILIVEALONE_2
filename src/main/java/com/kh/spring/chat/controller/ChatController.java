package com.kh.spring.chat.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ChatController {

	@RequestMapping("chat.ch")
	public String  chatView() {
		
		
		return "chat/chat"; 
	}

	
	
	
}
