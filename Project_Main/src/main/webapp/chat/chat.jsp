<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>실시간 채팅</title>
<script type="text/javascript">
	let websocket = null;

	function connection() {
		if (websocket !== null && websocket.readyState === WebSocket.OPEN) {
			alert("이미 입장하셨습니다.");
			return;
		}
		websocket = new WebSocket(
				"ws://localhost:8080/Project_Main/chat/chat-ws");
		websocket.onopen = onOpen;
		websocket.onclose = onClose;
		websocket.onmessage = onMessage;
	}

	function onOpen(event) {
		alert("채팅에 입장하셨습니다.");
	}

	function onClose(event) {
		alert("채팅에 퇴장하셨습니다.");
	}

	function onMessage(event) {
		let data=event.data
		 if (data.startsWith("error:")) {
		        alert(data.substring(6)); // "로그인 후 이용해주세요"
		        disConnection(); // 연결 끊기
		} else if (data.startsWith("my:")) {
			appendMyMessage(data.substring(3));
		} else if (data.startsWith("you:")) {
			appendYouMessage(data.substring(4));
		} else if (data.startsWith("msg:")) {
			appendMsgMessage(data.substring(4));
		} else if (data.startsWith("cnt:")) {
		    let count = data.substring(4);
		    $('#userCount').text("(" + count + "명 접속중)");
		}
	}

	function disConnection() {
		if (websocket !== null) {
			websocket.close();
			websocket = null;
		}
	}

	function appendMsgMessage(msg) {
		$('#recvMsg').append("<div style='text-align:center; color:gray; font-size:12px;'>"+msg+"</div><br>")
		let ch=$('#chatArea').height()
		let m=$('#recvMsg').height()-ch
		$('#chatArea').scrollTop(m)
	}

	function appendMyMessage(msg) {
		$('#recvMsg').append("<div style='text-align:right;'><span style='background-color:#ff9f45; color:white; padding:8px 12px; border-radius:20px 20px 0 20px;'>"+msg+"</span></div><br>")
		let ch=$('#chatArea').height()
		let m=$('#recvMsg').height()-ch
		$('#chatArea').scrollTop(m)
	}

	function appendYouMessage(msg) {
		$('#recvMsg').append("<div style='text-align:left;'><span style='background-color:#f1f1f1; color:#333; padding:8px 12px; border-radius:20px 20px 20px 0;'>"+msg+"</span></div><br>")
		let ch=$('#chatArea').height()
		let m=$('#recvMsg').height()-ch
		$('#chatArea').scrollTop(m)
	}

	function send() {
		let msg=$('#sendMsg').val()
		if(msg.trim()==="")
		{
			$('#sendMsg').focus()
			return 
		}
		
		websocket.send(msg)
		$('#sendMsg').val("")
		$('#sendMsg').focus()
	}

	$(function() {
		$('#inputBtn').click(function(){
			connection() 
		})
		$('#outputBtn').click(function(){
			disConnection()
		})
		$('#sendBtn').click(function(){
			send()
		})
		$('#sendMsg').keydown(function(key){
			if(key.keyCode===13)//enter @keydown.13 => enter
			{
				send()
			}
		})
	});
</script>
<style>
body {
	background-color: #f9f9f9;
}

.chat-container {
	max-width: 600px;
	margin: 50px auto;
	background: #fff;
	border-radius: 10px;
	padding: 20px;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
}

.chat-input {
	margin-top: 20px;
}

#chatArea {
	height: 400px;
	overflow-y: auto;
	margin-bottom: 20px;
	border: 1px solid #ddd;
	padding: 10px;
	border-radius: 5px;
}
</style>
</head>
<body>
	<div class="chat-container">
		<div class="d-flex align-items-center justify-content-between mb-3">
			<div class="d-flex align-items-center">
			<c:if test="${sessionScope.id!=null }">
				<img src="../img/${poster }" style="width: 50px; height: 50px;"	class="rounded-circle me-2" alt="이미지 없음"> 
			</c:if>		
					<strong>실시간 채팅</strong> <span id="userCount" class="ms-2 text-muted small"></span>
			</div>
			<div>
				<c:if test="${sessionScope.id!=null }">
				<button type="button" class="btn btn-danger btn-sm me-2"
					id="inputBtn">입장</button>
				<button type="button" class="btn btn-success btn-sm" id="outputBtn">퇴장</button>
				</c:if>
				<c:if test="${sessionScope.id==null }">
				<button type="button" class="btn btn-danger btn-sm me-2" onclick="javascript:alert('로그인 후 이용 가능합니다.')">입장</button>
				<button type="button" class="btn btn-success btn-sm" onclick="javascript:alert('로그인 후 이용 가능합니다.')">퇴장</button>
				</c:if>
			</div>
		</div>

		<div id="chatArea">
			<div id="recvMsg"></div>
		</div>
		<form class="chat-input d-flex" onsubmit="return false;">
			<input type="text" id="sendMsg" class="form-control me-2"
				placeholder="메시지를 입력하세요" maxlength="1000">
			<button type="button" class="btn btn-warning" id="sendBtn"
				style="width: 90px;">전송</button>
		</form>
	</div>
</body>
</html>
