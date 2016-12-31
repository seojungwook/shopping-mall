<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="/WEB-INF/jsp/jspHeader.jsp" %>
<script src="//cdn.ckeditor.com/4.5.7/standard/ckeditor.js"></script>
<script>
function win_open() {
	var op = "width=300, height=50, scrollbars=yes, resizeable=no, left=150, top=150";
	window.open("fileimg.html", "file1", op);
}
</script>
<form:form modelAttribute="dealboard" action="salewrite.html" method="post" enctype = "multipart/form-data" name="saleAdd">
   <h2 align="center">팝니다_글쓰기</h2>
   <hr>
   <input type="hidden" name="category" value="${param.category}">
   <input type="hidden" name="name" value="${USER_KEY.nickname}">
   <input type="hidden" name="smemno" value="${USER_KEY.mNo}">
   <input type="hidden" name="dealcheck" value="${param.dealcheck}">
   <input type="hidden" name="fileUrl1">
   <input type="hidden" name="fileUrl2">
   <input type="hidden" name="fileUrl3">
   <input type="hidden" name="fileUrl4">
   <input type="hidden" name="fileUrl5">
 
   
   <table width="100%" cellspacing = "0" cellpadding="0" border="0">
      <tr>
      <th align="center">제목</th>
      <td>
      <input type="text" name="subject" size="60">
      </td>
      </tr>
      <tr><td colspan="3"><hr></td></tr>
      <tr>
       <th width="100" align="center">판매자 정보</th>
   	   <td><table border="0">
   	   		<tr><th width="100">이름</th>
      			<td>${USER_KEY.name}</td>
      		</tr>
      		<tr><th>연락처</th>
      			<td>${USER_KEY.phone}</td>
      		</tr>
      		<tr><th>주소</th>
      			<td>${USER_KEY.email}</td>
      		</tr>
      </table></td>
      <tr><td colspan="3"><hr></td></tr>
      
      <tr>
      	<th align="center">상품정보</th>
      	
     	<td><table border="0">
     		<tr><th width="100">상품이름</th>
      		<td width="400"><input type="text" name="iName"></td>
      		<td rowspan="3"><img id="file1_1" width="150" height="100">&nbsp;&nbsp;&nbsp;<br>
				<a href="javascript:win_open()" style="text-decoration: none">
					<font size="2">[사진등록]</font>&nbsp;&nbsp;&nbsp;
				</a>
			</td>
      		</tr>
      		<tr><th>상품가격</th>
      		<td><input type="text" name="iprice">원</td>
      		</tr>
      		<tr><td colspan="2"><font size="2">
      		법률 상 판매가 금지된 물품, 또는 도난품등과 같은 상품의 등록은 불가능하며,<br>
      		추후에라도 신고 등이 있을 경우 이에 따른 제제가 있을 수 있습니다.<br>
      		대표사진은 10MB 미만의 JPG, GIF 파일만 등록이 가능합니다.</font>
      		</td>
      		<tr><th width="100">운송장</th>
      			<td><input type="text" name="transport"></td>
      		</tr>
      		<tr>
     	</table></td>
      </tr>
      <tr><td colspan="3"><hr></td></tr>
      <tr><td colspan="2">
      	<textarea rows="10" cols="50" name="content"></textarea>
      	<script>
      		CKEDITOR.replace('content');
      	</script>
      </td>
      </tr>
      <tr><td colspan="3"><hr></td></tr>
      <tr>
      	<th height="25" align = "center">첨부파일</th>
      	<td><input type="file" name="picture2"></td>
      </tr>
      <tr>
      	<th height="25" align = "center">첨부파일</th>
      	<td><input type="file" name="picture3"></td>
      </tr>
      <tr>
      	<th height="25" align = "center">첨부파일</th>
      	<td><input type="file" name="picture4"></td>
      </tr>
      <tr>
      	<th height="25" align = "center">첨부파일</th>
      	<td><input type="file" name="picture5"></td>
      </tr>
      <tr align="center" valign="middle">
      	<td colspan="2">
         	<a href = "javascript:document.saleAdd.submit()" style="text-decoration: none">[등록]</a>
        	<a href = "javascript:history.go(-1)" style="text-decoration: none">[목록보기]</a>
        </td>
      </tr>
   </table>
</form:form>