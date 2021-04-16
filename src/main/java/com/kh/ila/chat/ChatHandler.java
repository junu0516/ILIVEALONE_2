package com.kh.ila.chat;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Component;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;



@Component
public class ChatHandler extends TextWebSocketHandler {
private static List<WebSocketSession> list = new ArrayList<WebSocketSession>();
//클라이언트가 접속 했을 때 호출될 메소드
//클라이언트가 접속 했을 때 호출되는 메소드
@Override
public void afterConnectionEstablished(WebSocketSession session) throws Exception {
list.add(session);
System.out.println("하나의 클라이언트가 연결됨 ");
}
//클라이언트가 메시지를 보냈을 때 호출되는 메소드
@Override
protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
// 전송된 메시지를 List의 모든 세션에 전송
String msg = message.getPayload();
for (WebSocketSession s : list) {
s.sendMessage(new TextMessage(session.getAcceptedProtocol()+":"+msg));
}
}
// 클라이언트의 접속이 해제 되었을 때 호출되는 메소드
@Override
public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
System.out.println("클라이언트와 연결 해제됨");
list.remove(session);
}
}