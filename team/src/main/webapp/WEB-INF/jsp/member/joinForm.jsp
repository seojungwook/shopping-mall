<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="/WEB-INF/jsp/jspHeader.jsp" %>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
    function DaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // �˾����� �˻���� �׸��� Ŭ�������� ������ �ڵ带 �ۼ��ϴ� �κ�.

                // �� �ּ��� ���� ��Ģ�� ���� �ּҸ� �����Ѵ�.
                // �������� ������ ���� ���� ��쿣 ����('')���� �����Ƿ�, �̸� �����Ͽ� �б� �Ѵ�.
                var fullAddr = ''; // ���� �ּ� ����
                var extraAddr = ''; // ������ �ּ� ����

                // ����ڰ� ������ �ּ� Ÿ�Կ� ���� �ش� �ּ� ���� �����´�.
                if (data.userSelectedType === 'R') { // ����ڰ� ���θ� �ּҸ� �������� ���
                    fullAddr = data.roadAddress;

                } else { // ����ڰ� ���� �ּҸ� �������� ���(J)
                    fullAddr = data.jibunAddress;
                }

                // ����ڰ� ������ �ּҰ� ���θ� Ÿ���϶� �����Ѵ�.
                if(data.userSelectedType === 'R'){
                    //���������� ���� ��� �߰��Ѵ�.
                    if(data.bname !== ''){
                        extraAddr += data.bname;
                    }
                    // �ǹ����� ���� ��� �߰��Ѵ�.
                    if(data.buildingName !== ''){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // �������ּ��� ������ ���� ���ʿ� ��ȣ�� �߰��Ͽ� ���� �ּҸ� �����.
                    fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
                }

                // �����ȣ�� �ּ� ������ �ش� �ʵ忡 �ִ´�.
                document.getElementById('postcode').value = data.zonecode; //5�ڸ� �������ȣ ���
                document.getElementById('address1').value = fullAddr;

                // Ŀ���� ���ּ� �ʵ�� �̵��Ѵ�.
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
							<font face="���ʷҵ���" size="3">�⺻���� �Է�</font>
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
								<font face="���ʷҵ���" size="2">���̵�</font>
							</td>
							<td>
								<form:input path="id" size="18" /> 
							</td>
							<td>
								<input type="button" value="�ߺ�Ȯ��">
								<font face="���ʷҵ���" size="1">(5~12 ����, ���� ���� �� ID ���� �Ұ��� �մϴ�.)</font>
							</td>
						</tr>
						<tr>
							<td colspan="3">
								<font face="���ʷҵ���" size="1" color="red">
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
								<font face="���ʷҵ���" size="2">��й�ȣ</font>
							</td>
							<td>
								<form:password path="pass" size="18"/>
							</td>
							<td>
								<font face="���ʷҵ���" size="1">(6~10 �Է����ֽñ� �ٶ��ϴ�.)</font>
							</td>
						</tr>
						<tr>
							<td colspan="3">
								<font face="���ʷҵ���" size="1" color="red">
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
								<font face="���ʷҵ���" size="2">�̸�</font>
							</td>
							<td>
								<form:input path="name" size="18" />
							</td>
						</tr>
						<tr>
							<td colspan="3">
								<font face="���ʷҵ���" size="1" color="red">
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
								<font face="���ʷҵ���" size="2">�г���</font>
							</td>
							<td>
								<form:input path="nickname" size="18" />
							</td>
							<td>
								<input type="button" value="�ߺ�Ȯ��">
							</td>
						</tr>
						<tr>
							<td colspan="3">
								<font face="���ʷҵ���" size="1" color="red">
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
								<font face="���ʷҵ���" size="2" >�ּ�</font>
							</td>
							<td colspan="2">
								<table width="100%" cellpadding="0" cellspacing="0" border="0">
									<tr>
										<td colspan="2">
											<form:input path="postcode" size="10" placeholder="�����ȣ" readonly="true"/>
											<input type="button" onclick="DaumPostcode()" value="�����ȣ ã��">
										</td>
									</tr>
									<tr>
										<td width="50%">
											<form:input path="address1" size="30" placeholder="�ּ�" readonly="true" />
										</td>
										<td width="50%">
											<form:input path="address2" size="30" placeholder="���ּ�" />
										</td>
									</tr>
								</table>
							</td>
						</tr>
						<tr>
							<td colspan="3">
								<font face="���ʷҵ���" size="1" color="red">
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
								<font face="���ʷҵ���" size="2">��ȭ��ȣ</font>
							</td>
							<td colspan="2">
								<font face="���ʷҵ���"> 
								<form:input path="tel1" size="1"/> -
								<form:input path="tel2" size="2"/> -
								<form:input path="tel3" size="2"/>
								</font>
							</td>
						</tr>
						<tr>
							<td colspan="3">
								<font face="���ʷҵ���" size="1" color="red">
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
								<font face="���ʷҵ���" size="2">�޴� ��ȭ��ȣ</font>
							</td>
							<td colspan="2">
								<font face="���ʷҵ���"> 
									<form:input path="pon1" size="1"/> -
									<form:input path="pon2" size="2"/> -
									<form:input path="pon3" size="2"/>
								</font>
							</td>
						</tr>
						<tr>
							<td colspan="3">
								<font face="���ʷҵ���" size="1" color="red">
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
								<font face="���ʷҵ���" size="2">�̸���</font>
							</td>
							<td colspan="2">
								<form:input path="email" size="18"/>
							</td>
						</tr>
						<tr>
							<td colspan="3">
								<font face="���ʷҵ���" size="1" color="red">
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
				<input type="submit" value="ȸ������">
				<input type="reset" value="�ٽ��ۼ�">
				<input type="button" onclick="location.href='../module/main.html'" value="Ȩ����">
			</td>
		</tr>
	</table>
</form:form>