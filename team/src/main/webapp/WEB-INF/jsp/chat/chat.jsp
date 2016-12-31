<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@include file="/WEB-INF/jsp/jspHeader.jsp"%>

<fieldset>
	<input type="hidden" id="myid" value="${USER_KEY.nickname}"> <input
		type="hidden" id="mylevel" value="${USER_KEY.grade}">
	<div id="messageWindow" ondrop="drop(event)" ondragover="allowDrop(event)"
		style="border: thin; width: 200px; height: 300px; overflow-x: hidden; overflow-y: scroll; word-wrap: break-word;"></div>
	<br/>
	<form action="javascript:send()">
		<input AUTOCOMPLETE="off" id="inputMessage" type="text" size="25" />

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
		var mylevel = document.getElementById('mylevel');
		var bot = document.getElementById('messageWindow');
		var textarea = document.getElementById("messageWindow");
		var webSocket = new WebSocket('ws://localhost:8080/team/chatcontroller');
		var inputMessage = document.getElementById('inputMessage');

		webSocket.onerror = function(event) {
			onError(event)
		};
		webSocket.onopen = function(event) {
			onOpen(event)
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
			textarea.innerHTML += "<font size='1'><hr></font>\n";
			textarea.innerHTML += "<font size='2'>채팅서버에 연결 완료</font>";
			textarea.innerHTML += "<font size='1'><hr></font>\n";
		}
		function onClose(event) {
		}
		function onError(event) {
			alert(event.data);
		}

		function send() {
			if (myid.value == null || myid.value == "") {
				alert("로그인 후 이용하세요");
				location.href="login.html";

			} else if (mylevel.value == "9") {
				if (inputMessage.value.indexOf("/roll ") == 0) {

					var roll = Math.ceil(Math.random() * 6);
					textarea.innerHTML += "<html><font color ='#FF5E00'>"
							+ "운영자 "
							+ myid.value
							+ "</font>"
							+ ":<br>"
							+ "<font style='font-weight:900;font-size:15px;backgra'>*"
							+ "주사위값:" + roll + "*</font>" + "<br></html>";
					textarea.scrollTop = textarea.scrollHeight;
					webSocket
							.send("<html><font color ='blue'>"
									+ myid.value
									+ "</font>"
									+ ":<br><font style='font-weight:900;font-size:15px;'>*"
									+ "주사위값:" + roll + "*</font>" + "</html>");
					inputMessage.value = "";
					inputMessage.focus();
				}else if (inputMessage.value.indexOf("/p ") == 0) {
					textarea.innerHTML += "<html><font color ='#FF5E00'>"
							+ "운영자 "
							+ myid.value
							+ "</font>"
							+ ":<br>"
							+ "<font style='font-weight:900;font-size:13px;background-color: yellow'>*"
							+ inputMessage.value + "*</font>" + "<br></html>";
					textarea.scrollTop = textarea.scrollHeight;
					webSocket
							.send("<html><font color ='blue'>"
									+ myid.value
									+ "</font>"
									+ ":<br><font style='font-weight:900;font-size:13px;background-color: yellow'>*"
									+ inputMessage.value + "*</font>"
									+ "</html>");
					inputMessage.value = "";
					inputMessage.focus();
				}else if(inputMessage.value.indexOf("/c ") == 0){
					var result = Math.ceil(Math.random() * 3);
					if(result == 1){
						var k = "가위";
					}else if(result == 2){
						var k = "바위";
					}else{
						var k ="보";
					}
					textarea.innerHTML += "<html><font color ='#FF5E00'>"
						+ "운영자 "
						+ myid.value
						+ "</font>"
						+ ":<br>"
						+ "<font style='font-weight:900;font-size:13px;backgra'>*"
						+"결과:"+ k+ "*</font>" + "<br></html>";
				textarea.scrollTop = textarea.scrollHeight;
				webSocket
						.send("<html><font color ='blue'>"
								+ myid.value
								+ "</font>"
								+ ":<br><font style='font-weight:900;font-size:13px;'>*"
								+ "결과:"+ k + "*</font>"
								+ "</html>");
				inputMessage.value = "";
				inputMessage.focus(); 
				} else {
					textarea.innerHTML += "<html><font color ='#FF5E00'>"
							+ "운영자 " + myid.value + "</font>" + ":<br>"
							+ "<font style='font-weight:900;font-size:13px;'>*"
							+ inputMessage.value + "*</font>" + "<br></html>";
					textarea.scrollTop = textarea.scrollHeight;
					webSocket
							.send("<html><font color ='blue'>"
									+ myid.value
									+ "</font>"
									+ ":<br><font style='font-weight:900;font-size:13px;'>*"
									+ inputMessage.value + "*</font>"
									+ "</html>");
					inputMessage.value = "";
					inputMessage.focus();}
				
			}else if (myid.value != null || myid.nickname.value != "") {
				if (inputMessage.value.indexOf("/roll ") == 0) {
					var roll = Math.ceil(Math.random() * 6);
					textarea.innerHTML += "<html><font color ='#FF5E00'>"
							+ mylevel.value + "등급" + myid.value + "</font>"
							+ ":<br>"
							+ "<font style='font-weight:900;font-size:15px'>"
							+ "주사위값:" + roll + "</font>" + "<br></html>";
					textarea.scrollTop = textarea.scrollHeight;
					webSocket
							.send("<html><font color ='blue'>"
									+ mylevel.value
									+ "등급"
									+ myid.value
									+ "</font>"
									+ ":<br><font style='font-weight:900;font-size:15px;'>"
									+ "주사위값:" + roll + "</font>" + "</html>");
					inputMessage.value = "";
					inputMessage.focus();
				} else if (inputMessage.value.indexOf("/p ") == 0) {
					textarea.innerHTML += "<html><font color ='#FF5E00' >"
							+ mylevel.value + "등급" + myid.value + "</font>"
							+ ":<br><font style='font-size:13px;background-color: yellow'>"
							+ inputMessage.value + "</font><br></html>";
					textarea.scrollTop = textarea.scrollHeight;
					webSocket.send("<html><font color ='blue'>" + myid.value
							+ "</font>:<br><font style='font-size:13px;background-color: yellow'>"
							+ inputMessage.value + "</font></html>");
					inputMessage.value = "";
					inputMessage.focus();
				}else if(inputMessage.value.indexOf("/c ") == 0){
					var result = Math.ceil(Math.random() * 3);
					if(result == 1){
						var k = "가위";
					}else if(result == 2){
						var k = "바위";
					}else{
						var k ="보";
					}
					textarea.innerHTML += "<html><font color ='#FF5E00' >"
						+ mylevel.value + "등급" + myid.value + "</font>"
						+ ":<br><font style='font-size:13px;'>"
						+"결과:"+k + "</font><br></html>";
				textarea.scrollTop = textarea.scrollHeight;
				webSocket.send("<html><font color ='blue'>" + myid.value
						+ "</font>:<br><font style='font-size:13px'>"
						+"결과"+ k + "</font></html>");
				inputMessage.value = "";
				inputMessage.focus();
				} else {
					textarea.innerHTML += "<html><font color ='#FF5E00' >"
							+ mylevel.value + "등급" + myid.value + "</font>"
							+ ":<br><font style='font-size:13px'>"
							+ inputMessage.value + "</font><br></html>";
					textarea.scrollTop = textarea.scrollHeight;
					webSocket.send("<html><font color ='blue'>" + myid.value
							+ "</font>:<br><font style='font-size:13px'>"
							+ inputMessage.value + "</font></html>");
					inputMessage.value = "";
					inputMessage.focus();
				 }
				}

			}
			function allowDrop(ev) {
				ev.preventDefault();

			}
			function drop(ev) {
				if (myid.value == null || myid.value == "") {
					alert("로그인 후 이용하세요");
					
				}else{
					ev.preventDefault();
					var data = ev.dataTransfer.getData("Text");
					var URL = ev.dataTransfer.getData("URL");
					document.getElementById(data);
					console.log(data);
					//ev.target.appendChild(y);
					textarea.innerHTML += "<html><font color ='#FF5E00'>"
							+ mylevel.value
							+ "등급"
							+ myid.value
							+ ":"
							+ "</font><font style='font-size:11px'><a href='"+URL+"'>"
							+ URL + "</a></font></html><br>";
					webSocket
							.send("<html><font color ='blue'>"
									+ mylevel.value
									+ "등급"
									+ myid.value
									+ ":<br>"
									+ "</font><font style='font-size:11px'><a href='"+URL+"'>"
									+ URL + "</a></font></html>");
					textarea.scrollTop = textarea.scrollHeight;
				}
			}
	}
</script>
