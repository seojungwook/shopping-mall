<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="/WEB-INF/jsp/jspHeader.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<script>
	function SubmitForm()
	{
        document.login.submit();
	}
</script>
	<form:form modelAttribute="member" method="post" action="login.html">
		<form:hidden path="name" />
		<table align="center">
			<tr>
				<td>
					<hr>
					<img src="../img/tit_login.gif" width="100%">
				</td>
			</tr>
			<tr>
				<td height="200" style="background: rgb(245, 245, 245); padding:15px 40px; border:1px solid rgb(237, 237, 237); border-image:none;">
					<table width="100%" border="0" cellspacing="0" cellpadding="0">
						<tr>
							<td>
								<form:form name="login" modelAttribute="member" method="post" action="login.html">
									<table width="100%" cellspacing="0" cellpadding="2" border="0">
										<tr>
											<td>
												<img src="../img/idpw_id.gif">
											</td>
											<td width="160px">
												<input type="text" name="id" style="width:146px;" />
											</td>
										</tr>
										<tr>
											<td>
												<img src="../img/idpw_pw.gif">
											</td>
											<td>
												<input type="password" name="pass" style="width:146px;" />
											</td>
										</tr>
									</table>
								</form:form>
							</td>
							<td rowspan="2" valign="middle" align="left">
								<input type="image" src="../img/bt_login.gif" onclick="SubmitForm()">
							</td>
							<td>
								<table>
									<tr>
										<td>
											<img src="../img/login_txt01.gif" />
										</td>
									</tr>
									<tr>
										<td>
											<a href="joinForm.html">
												<img src="../img/bt_join3.gif" />
											</a>
										</td>
									</tr>
									<tr>
										<td>
											<img src="../img/login_txt02.gif" />
										</td>
									</tr>	
									<tr>
										<td>
											<a href="#">
												<img src="../img/bt_idpw3.gif" />
											</a>
										</td>
									</tr>
								</table>
							</td>
						</tr>
					</table>
				</td>
			</tr>
		
		</table>
	</form:form>