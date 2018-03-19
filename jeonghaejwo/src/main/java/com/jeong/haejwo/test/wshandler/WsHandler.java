package com.jeong.haejwo.test.wshandler;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

public class WsHandler extends TextWebSocketHandler {

	private static Logger log = LoggerFactory.getLogger(WsHandler.class);

	private List<WebSocketSession> sessionList = new ArrayList<WebSocketSession>();

	@Override
	public void afterConnectionEstablished(WebSocketSession session) {
		sessionList.add(session);
		log.info("{} 연결됨", session.getId());
	}

	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws IOException {
		log.info("{}로부터 {}를 받음", session.getId(), message.getPayload());
		for (WebSocketSession wss : sessionList) {
			wss.sendMessage(new TextMessage("echo:" + message.getPayload()));
		}
	}

	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) {
		sessionList.remove(session);
	}
}