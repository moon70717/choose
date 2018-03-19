package com.jeong.haejwo.test.wshandler;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ChatCon {

	@RequestMapping("/chat")
	public String viewChatPage() {
		return "chatting/chat";
	}
}
