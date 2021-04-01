<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

</head>
<body>

<div id="one">
이름 :<input class="form-control" type="text" id="nickname" value="${ sessionScope.loginUser.getUserName()}" readonly/>
 <input class="btn btn-info" type="button" id="enter" value="대화방 입장" />
</div>
<div id="two" style="display: none">

<div class="form-control" id="chatarea" style="width:400px; height:600px; border:1px solid;" ></div>
<br>
<input class="form-control" type="text" id="message" placeholder="메세지를 입력하세요."/> 
<input class="btn btn-primary" type="button" id="send"value="보내기" />
<br><br>

<input  class="btn btn-danger" type="hidden" id="exit" value="나가기" style="float:right" />

</div>


</body>
<script type="text/javascript">

		one = document.getElementById("one");
		two = document.getElementById("two");
		document.getElementById("enter").addEventListener("click", function() {
		
		//웹 소켓 연결해주는 함수 호출
		connect();
		});
		document.getElementById("exit").addEventListener("click", function() {
		
		//연결을 해제해주는 함수 호출
		disconnect();
		});
		document.getElementById("send").addEventListener("click", function() {
		
		//연결을 해제해주는 함수 호출
		send();
		});
		var websocket;
		
	//입장 버튼을 눌렀을 때 호출되는 함수
		function connect(){
		websocket = new WebSocket("ws://localhost:9090/spring/chat-ws");
		
	//웹 소켓에 이벤트가 발생했을 때 호출될 함수 등록
		websocket.onopen = onOpen;
		websocket.onmessage = onMessage;
		websocket.onclose = onClose;
		}
		
	//나가기 버튼을 눌렀을 때 호출되는 함수
		function disconnect(){
		msg = document.getElementById("nickname").value;
		websocket.send(msg+"님이 퇴장하셨습니다");
		websocket.close();
		}
		
	//보내기 버튼을 눌렀을 때 호출될 함수
		function send(){
		nickname = document.getElementById("nickname").value;
		msg = document.getElementById("message").value;
		websocket.send(nickname + ": "+ msg);
		document.getElementById("message").value = "";
		}
		
	//웹 소켓에 연결되었을 때 호출될 함수
		function onOpen(){
		nickname = document.getElementById("nickname").value;
		two = document.getElementById("two");
		two.style.display='block';
		websocket.send(nickname + "님 입장하셨습니다.");
		}
		
	//웹 소켓에서 연결이 해제 되었을 때 호출될 함수
		function onMessage(evt){
		data= evt.data;
		chatarea = document.getElementById("chatarea");
		chatarea.innerHTML = data + "<br/>" + chatarea.innerHTML
		}
		function onClose(){
		}
</script>
</html>