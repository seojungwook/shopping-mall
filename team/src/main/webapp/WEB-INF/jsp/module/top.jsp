<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ include file="/WEB-INF/jsp/jspHeader.jsp"%>
<script>
function message_open() {
	var open = "width=300, height=50, scrollbars=yes, resizeable=no, left=150, top=150";
	window.open("../message/message_main.html", open);
}
function bookMark(site_url, site_name){
	   window.external.AddFavorite(site_url, site_name);
	}
</script>
<table border="0" width="100%" height="100%" cellpadding="0" cellspacing="0">
	<tr>
		<td width="200" align="left"><a href="../module/main.html"><img
				width="100%" height="40" src="../img/logo4.png" border="0" /></a></td>
		<td width="120"></td>
		<td width="535" align="center">
			<form name="allsalesearch" method="post" action="../dealboard/allsalesearch.html?category=100">
			<input type="hidden" name="pageNum" value="1">
				<table cellpadding="0" cellspacing="0" border="0" align="center">
					<tr>
						<td><img src="../img/img_search.gif"></td>
						<td width="200" valign="middle">
							<input type="text" name="searchContent" size="30" border="0"></td>
						<td>&nbsp;&nbsp;&nbsp;</td>
						<td valign="middle">
							<input type="image"	src="../img/btn_search.gif" onclick="SubmitSearch()">
						</td>
					</tr>
				</table>
			</form>
		</td>
		<td width="320" align="right" valign="bottom">
			<table border="0" cellspacing="0" cellpadding="0" width="100%">
				<tr align="right">
					<td valign="top" align="right">
						<a href="javascript:bookMark('http://172.16.1.12:8080/team/module/main.html', 'Give&Take');">
							<img src="../main/top_favorite.gif">
						</a>
					</td>
				</tr>
				<tr align="right" width="100%">
					<td valign="bottom" width="100%">
					<!-- 
						<font color="#8C8C8C" face="함초롬돋움">처음으로</font>
						<font color="#8C8C8C" face="함초롬돋움">로그인</font>
						<font color="#8C8C8C" face="함초롬돋움">로그아웃</font>
						<font color="#8C8C8C" face="함초롬돋움">회원가입</font>
						<font color="#8C8C8C" face="함초롬돋움">고객센터</font>
						<font color="#BDBDBD" face="함초롬돋움">|</font> 
					 -->
						<a href="../module/main.html" style="text-decoration: none"> 
							<img src="../img_top/top_home.gif" width="50px">
						</a>  
						<c:if test="${empty USER_KEY}">
							<a href="../member/loginForm.html" style="text-decoration: none">
								<img src="../img_top/top_login.gif" width="50px">
							</a>
						</c:if> 
						<c:if test="${not empty USER_KEY}">
							<a href="../member/logout.html" style="text-decoration: none">
								<img src="../img_top/top_logout.gif" width="50px">
							</a>
						</c:if> 
						<a href="../member/joinForm.html" style="text-decoration: none">
							<img src="../img_top/top_join.gif" width="60px">
						</a> 
						<a href="#" style="text-decoration: none" > 
							<img src="../img_top/top_cs.gif" width="50px">
						</a>
					</td>
				</tr>
			</table>
		</td>
	</tr>
	<tr>
		<td colspan="4" background="../img_top/menu2.png">
			<table align="center" width="80%" border="0" cellpadding="0" cellspacing="0">
				<tr height="100%">
					<c:if test="${USER_KEY.id != 'admin' }">
					<td><a href="../mypage/mypagemain.html"><img src='../img_top/top_1.png'
							width="100%">
					</a></td>
					</c:if>
					<c:if test="${USER_KEY.id == 'admin' }">
					<td><a href="../admin/main.html"><img src='../img_top/top_1_1.png'
							width="100%">
					</a></td>
					</c:if>					
					<td><a href="../zzim/zzimlist.html"><img src='../img_top/top_2.png'
							width="100%">
					</a></td>
					<td><a href="../board/list.html?category=11"><img src='../img_top/top_3.png'
							width="100%">
					</a></td>
					<td><a href="../board/list.html?category=12"><im g src='../img_top/top_4.png'
							width="100%">
					</a></td>
					<td><a href="../board/list.html?category=13"><img src='../img_top/top_5.png'
							width="100%">
					</a></td>
					<td><a href="../mileage/mileageBoard.html"><img src='../img_top/top_6.png'
							width="100%">
					</a></td>
					<td><a href="../board/list.html?category=15"><img src='../img_top/top_7.png'
							width="100%">
					</a></td>
				</tr>
				<!--<td align="center" width="2%"><font color="#BDBDBD" face="함초롬돋움">|</font></td>
					<td align="center" width="12%"><font color="#ffffff" face="함초롬돋움">마이페이지</font></td>
					<td align="center" width="2%"><font color="#BDBDBD" face="함초롬돋움">|</font></td>
					<td align="center" width="12%"><font color="#ffffff" face="함초롬돋움">찜하기</font></td>
					<td align="center" width="2%"><font color="#BDBDBD" face="함초롬돋움">|</font></td>
					<td align="center" width="12%"><font color="#ffffff" face="함초롬돋움">자유게시판</font></td>
					<td align="center" width="2%"><font color="#BDBDBD" face="함초롬돋움">|</font></td>
					<td align="center" width="12%"><font color="#ffffff" face="함초롬돋움">묻고 답하기</font></td>
					<td align="center" width="2%"><font color="#BDBDBD" face="함초롬돋움">|</font></td>
					<td align="center" width="12%"><font color="#ffffff" face="함초롬돋움">나눔 게시판</font></td>
					<td align="center" width="2%"><font color="#BDBDBD" face="함초롬돋움">|</font></td>
					<td align="center" width="12%"><font color="#ffffff" face="함초롬돋움">입금확인 게시판</font></td>
					<td align="center" width="2%"><font color="#BDBDBD" face="함초롬돋움">|</font></td>
					<td align="center" width="12%"><font color="#ffffff" face="함초롬돋움">고객센터</font></td>
					<td align="center" width="2%"><font color="#BDBDBD" face="함초롬돋움">|</font></td>
				 -->
			</table>
		</td>
	</tr>
	<tr>
		<td colspan="4" align="right" width="100%" bgcolor="#EAEAEA">
			&nbsp; <c:if test="${not empty USER_KEY}">
				<font face="함초롬돋움" color="#49347f" size="2">${USER_KEY.nickname}</font>
				<font face="함초롬돋움" size="2">고객님 즐거운 하루 되세요. &nbsp;&nbsp; 마일리지 : ${USER_KEY.mileage} 
					<a href="javascript:message_open()" style="text-decoration: none"><font face="함초롬돋움" size="2"> 쪽지함</font></a>
				</font>
				
			</c:if>
		</td>
	</tr>
</table>