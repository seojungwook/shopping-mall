<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@include file="/WEB-INF/jsp/jspHeader.jsp"%>

<fieldset>
	<input type="hidden" id="myid" value="${USER_KEY.nickname}">
	<div id="messageWindow"
		style="border: thin; width: 100%; height: 300px; overflow-x: hidden; overflow-y: scroll; word-wrap: break-word;"></div>
	<br/>
	<form action="javascript:send()">
		<input AUTOCOMPLETE="off" id="inputMessage" type="text" size="30"/> 
		<table>
			<tr>
				<td></td>
			</tr>
		</table>
	</form>
</fieldset>

<script type="text/javascript">
	if (document.getElementById('myid') != null
			|| document.getElementById('myid').equals("")) {
		var myid = document.getElementById('myid');
		var bot = document.getElementById('messageWindow');
		var textarea = document.getElementById("messageWindow");
		var webSocket = new WebSocket('ws://172.16.1.12:8080/controller/chatcontroller');
		var inputMessage = document.getElementById('inputMessage');

		webSocket.onerror = function(event) {
			onError(event)
		};
		webSocket.onopen = function(event) {
			onOpen(event)
			webSocket.send(myid.value + "님 이 접속하셨습니다 .");
		};

		webSocket.onclose = function(event) {
			onClose(event)
		};
		webSocket.onmessage = function(event) {
			onMessage(event)
		};
		function onMessage(event) {
			textarea.innerHTML += event.data + "<br>";
			textarea.scrollTop = textarea.scrollHeight;

		}

		function onOpen(event) {
			textarea.innerHTML += "<hr>\n";
			textarea.innerHTML += "채팅서버에 연결 완료";
			textarea.innerHTML += "<hr>\n";
		}
		function onClose(event) {
			webSocket.send(myid.value + "님이 접속을 종료 하셨습니다 .");
		}
		function onError(event) {
			alert(event.data);
		}

		function send() {
			if(myid.value == null || myid.value == ""){
				alert("로그인 후 이용하세요");
				inputMessage.value = "";
				inputMessage.focus();
			} else	if(myid.value != null || myid.value != ""){
				textarea.innerHTML += "<html><font color ='#FF5E00' >" + myid.value
						+ "</font>" + ":" + inputMessage.value + "<br></html>";
				textarea.scrollTop = textarea.scrollHeight;
				webSocket.send("<html><font color ='blue'>" + myid.value
						+ "</font>:" + inputMessage.value + "</html>");
				inputMessage.value = "";
				inputMessage.focus();
			}
		}
	}
</script>
