<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="/WEB-INF/jsp/jspHeader.jsp" %>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
    function DaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var fullAddr = ''; // 최종 주소 변수
                var extraAddr = ''; // 조합형 주소 변수

                // 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    fullAddr = data.roadAddress;

                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    fullAddr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 조합한다.
                if(data.userSelectedType === 'R'){
                    //법정동명이 있을 경우 추가한다.
                    if(data.bname !== ''){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있을 경우 추가한다.
                    if(data.buildingName !== ''){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
                    fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('postcode').value = data.zonecode; //5자리 새우편번호 사용
                document.getElementById('address1').value = fullAddr;

                // 커서를 상세주소 필드로 이동한다.
                document.getElementById('address2').focus();
            }
        }).open();
   }
</script>
<form:form name="joinform" modelAttribute="member" action="joinProcess.html" method="POST">
	<table border="0">
		<tr>
			<td width="100%">
				<hr>
				<img src="../img/tit_join.gif" width="100%">
			</td>
		</tr>
		<tr>
			<td>
				<br>
				<table width="100%" cellpadding="5" cellspacing="5">
					<tr>
						<td align="left">
							<font face="함초롬돋움" size="3">기본정보 입력</font>
						</td>
					</tr>
				</table>
			</td>
		</tr>
		<tr>
			<td width="100%">
				<table width="100%" cellpadding="0" cellspacing="0">
					<tr>
						<td width="100%">
							<hr>
						</td>
					</tr>
				</table>
			</td>
		</tr>
		<tr>
			<td>
				<table width="90%" cellpadding="0" cellspacing="0" border="0" align="center">
						<tr>
							<td width="18%">
								<font face="함초롬돋움" size="2">아이디</font>
							</td>
							<td>
								<form:input path="id" size="18" /> 
							</td>
							<td>
								<input type="button" value="중복확인">
								<font face="함초롬돋움" size="1">(5~12 영문, 숫자 가입 후 ID 변경 불가능 합니다.)</font>
							</td>
						</tr>
						<tr>
							<td colspan="3">
								<font face="함초롬돋움" size="1" color="red">
         							<form:errors path="id"/>
         						</font>
							</td>
						</tr>
						<tr>
							<td colspan="3">
								<hr>
							</td>
						</tr>
						<tr>
							<td>
								<font face="함초롬돋움" size="2">비밀번호</font>
							</td>
							<td>
								<form:password path="pass" size="18"/>
							</td>
							<td>
								<font face="함초롬돋움" size="1">(6~10 입력해주시기 바랍니다.)</font>
							</td>
						</tr>
						<tr>
							<td colspan="3">
								<font face="함초롬돋움" size="1" color="red">
         							<form:errors path="pass"/>
         						</font>
							</td>
						</tr>
						<tr>
							<td colspan="3">
								<hr>
							</td>
						</tr>
						<tr>
							<td>
								<font face="함초롬돋움" size="2">이름</font>
							</td>
							<td>
								<form:input path="name" size="18" />
							</td>
						</tr>
						<tr>
							<td colspan="3">
								<font face="함초롬돋움" size="1" color="red">
         							<form:errors path="name"/>
         						</font>
							</td>
						</tr>
						<tr>
							<td colspan="3">
								<hr>
							</td>
						</tr>
						<tr>
							<td>
								<font face="함초롬돋움" size="2">닉네임</font>
							</td>
							<td>
								<form:input path="nickname" size="18" />
							</td>
							<td>
								<input type="button" value="중복확인">
							</td>
						</tr>
						<tr>
							<td colspan="3">
								<font face="함초롬돋움" size="1" color="red">
         							<form:errors path="nickname"/>
         						</font>
         					</td>
						</tr>
						<tr>
							<td colspan="3">
								<hr>
							</td>
						</tr>
						<tr>
							<td>
								<font face="함초롬돋움" size="2" >주소</font>
							</td>
							<td colspan="2">
								<table width="100%" cellpadding="0" cellspacing="0" border="0">
									<tr>
										<td colspan="2">
											<form:input path="postcode" size="10" placeholder="우편번호" readonly="true"/>
											<input type="button" onclick="DaumPostcode()" value="우편번호 찾기">
										</td>
									</tr>
									<tr>
										<td width="50%">
											<form:input path="address1" size="30" placeholder="주소" readonly="true" />
										</td>
										<td width="50%">
											<form:input path="address2" size="30" placeholder="상세주소" />
										</td>
									</tr>
								</table>
							</td>
						</tr>
						<tr>
							<td colspan="3">
								<font face="함초롬돋움" size="1" color="red">
         							<form:errors path="postcode"/>
         						</font>
							</td>
						</tr>
						<tr>
							<td colspan="3">
								<hr>
							</td>
						</tr>
						<tr>
							<td>
								<font face="함초롬돋움" size="2">전화번호</font>
							</td>
							<td colspan="2">
								<font face="함초롬돋움"> 
								<form:input path="tel1" size="1"/> -
								<form:input path="tel2" size="2"/> -
								<form:input path="tel3" size="2"/>
								</font>
							</td>
						</tr>
						<tr>
							<td colspan="3">
								<font face="함초롬돋움" size="1" color="red">
         							<form:errors path="tel3"/>
         						</font>
							</td>
						</tr>
						<tr>
							<td colspan="3">
								<hr>
							</td>
						</tr>
						<tr>
							<td>
								<font face="함초롬돋움" size="2">휴대 전화번호</font>
							</td>
							<td colspan="2">
								<font face="함초롬돋움"> 
									<form:input path="pon1" size="1"/> -
									<form:input path="pon2" size="2"/> -
									<form:input path="pon3" size="2"/>
								</font>
							</td>
						</tr>
						<tr>
							<td colspan="3">
								<font face="함초롬돋움" size="1" color="red">
         							<form:errors path="pon3"/>
         						</font>
							</td>
						</tr>
						<tr>
							<td colspan="3">
								<hr>
							</td>
						</tr>
						<tr>
							<td>
								<font face="함초롬돋움" size="2">이메일</font>
							</td>
							<td colspan="2">
								<form:input path="email" size="18"/>
							</td>
						</tr>
						<tr>
							<td colspan="3">
								<font face="함초롬돋움" size="1" color="red">
         							<form:errors path="email"/>
         						</font>
							</td>
						</tr>
				</table>
			</td>
		</tr>
		<tr>
			<td>
				<hr>
			</td>
		</tr>
		<tr align="center">
			<td>
				<input type="submit" value="회원가입">
				<input type="reset" value="다시작성">
				<input type="button" onclick="location.href='../module/main.html'" value="홈으로">
			</td>
		</tr>
	</table>
</form:form>