<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="/WEB-INF/jsp/jspHeader.jsp" %>    
<h2 align="center">�˴ϴ�_�󼼺���</h2>
<hr>
<input type="hidden" name="num" value="${param.num}">
<input type="hidden" name="category" value="${param.category}">
<input type="hidden" name="dealcheck" value="${dealboard.dealcheck}">
<table width="100%">
      <tr>
         <th align = "center">�۾���</th>
         <td>${dealboard.nickname}</td>
      </tr>
      <tr bgcolor="#CCCCCC">
         <td colspan="2" style="height: 1px;"></td>
      </tr>
      <tr>
         <th align = "center">����</th>
         <td>${dealboard.subject}</td>
      </tr>
      <tr bgcolor="#CCCCCC">
         <td colspan="2" style="height: 1px;"></td>
      </tr>
      <tr>
         <th align = "center">��ǰ�̸�</th>
         <td>${dealboard.iName}</td>
      </tr>
      <tr>
         <th align = "center">��ǰ����</th>
         <td>${dealboard.iprice}</td>
      </tr>
      <tr>
         <th align = "center">������ȣ</th>
         <td>${dealboard.transport}</td>
      </tr>
      <tr bgcolor="#CCCCCC">
         <td colspan="2" style="height: 1px;"></td>
      </tr>
      <tr>
         <th align = "center">����</th>
         <td>
            <table border = "0" width = "490" height = "250">
               <tr>
                  <td>${dealboard.content}
                  	<c:if test="${not empty dealboard.fileUrl1}">
                  	<img src="${pageContext.request.contextPath}/file/${dealboard.fileUrl1}" width="300"></c:if>
                  	<c:if test="${not empty dealboard.fileUrl2}">
                  	<img src="${pageContext.request.contextPath}/file/${dealboard.fileUrl2}" width="300"></c:if>
                  	<c:if test="${not empty dealboard.fileUrl3}">
                  	<img src="${pageContext.request.contextPath}/file/${dealboard.fileUrl3}" width="300"></c:if>
                  	<c:if test="${not empty dealboard.fileUrl4}">
                  	<img src="${pageContext.request.contextPath}/file/${dealboard.fileUrl4}" width="300"></c:if>
                  	<c:if test="${not empty dealboard.fileUrl5}">
                  	<img src="${pageContext.request.contextPath}/file/${dealboard.fileUrl5}" width="300"></c:if>
                  </td>
               </tr>
            </table>
         </td>
      </tr>
      <tr bgcolor="#CCCCCC">
         <td colspan="2" style="height: 1px;"></td>
      </tr>
      <tr>
         <th align = "center">÷������</th>
         <td>&nbsp; 
            <c:if test="${!empty dealboard.fileUrl1}">
               <a href="${pageContext.request.contextPath}/file/${dealboard.fileUrl1}">${dealboard.fileUrl1}</a>
            </c:if>
            &nbsp;</td>
      </tr>
      <tr>
         <th align = "center">÷������</th>
         <td>&nbsp; 
            <c:if test="${!empty dealboard.fileUrl2}">
               <a href="${pageContext.request.contextPath}/file/${dealboard.fileUrl2}">${dealboard.fileUrl2}</a>
            </c:if>
            &nbsp;</td>
      </tr>
      <tr>
         <th align = "center">÷������</th>
         <td>&nbsp; 
            <c:if test="${!empty dealboard.fileUrl3}">
               <a href="${pageContext.request.contextPath}/file/${dealboard.fileUrl3}">${dealboard.fileUrl3}</a>
            </c:if>
            &nbsp;</td>
      </tr>
      <tr>
         <th align = "center">÷������</th>
         <td>&nbsp; 
            <c:if test="${!empty dealboard.fileUrl4}">
               <a href="${pageContext.request.contextPath}/file/${dealboard.fileUrl4}">${dealboard.fileUrl4}</a>
            </c:if>
            &nbsp;</td>
      </tr>
      <tr>
         <th align = "center">÷������</th>
         <td>&nbsp; 
            <c:if test="${!empty dealboard.fileUrl5}">
               <a href="${pageContext.request.contextPath}/file/${dealboard.fileUrl5}">${dealboard.fileUrl5}</a>
            </c:if>
            &nbsp;</td>
      </tr>
      <tr bgcolor="#cccccc">
         <td colspan = "2" style = "height : 1px"></td>
      </tr>
      <tr><td><br></td></tr>
      <tr align = "center" valign = "middle">
         <td colspan = "2">
         <c:if test="${!empty check}">
         	<a href = "../zzim/zzimdel.html?num=${dealboard.bNo}" style="text-decoration: none">[������]</a>&nbsp;&nbsp;
         </c:if>
         <c:if test="${empty check}">
         	<a href = "../zzim/zzim.html?num=${dealboard.bNo}" style="text-decoration: none">[���ϱ�]</a>&nbsp;&nbsp;
         </c:if>
            <a href = "saleUpdateForm.html?num=${dealboard.bNo}&pageNum=${pageNum}&category=${param.category}&dealcheck=${dealboard.dealcheck}&url=${param.url}" style="text-decoration: none">[����]</a>&nbsp;&nbsp;
            <a href = "saleDeleteForm.html?num=${dealboard.bNo}&pageNum=${pageNum}" style="text-decoration: none">[����]</a>&nbsp;&nbsp;
           <c:if test="${param.url==1}">
               <a href = "saleList_1.html?pageNum=${pageNum}&category=${param.category}&dealcheck=${dealboard.dealcheck}" style="text-decoration: none">[���]</a>&nbsp;&nbsp;
            </c:if>
            <c:if test="${param.url==2}">
               <a href = "../zzim/zzimlist.html" style="text-decoration: none">[���]</a>&nbsp;&nbsp;
            </c:if>
            <c:if test="${param.url==3}">
               <a href = "../module/main.html" style="text-decoration: none">[���]</a>&nbsp;&nbsp;
            </c:if>
             <a href="../mypage/payform.html?num=${dealboard.bNo}&pageNum=${param.pageNum}" style="text-decoration: none">[�����ϱ�]</a>
         </td>
      </tr>
      <tr><td><br></td></tr>
      <tr>
      	<td></td>
      </tr>
</table>
<form action="reply.html" method="post" name="reply">
      <input type="hidden" name="nickname" value="${USER_KEY.nickname}">
      <input type="hidden" name="no" value="${param.num}">
      <input type="hidden" name="category" value="${param.category}">
      <input type="hidden" name="pageNum" value="${param.pageNum}">
      <input type="hidden" name="mNo" value="${USER_KEY.mNo}">
      <table>
        
         <tr>
            <td>
               <tr><td height="25">����</td>
               <td><textarea name="content" cols="67" rows="4"></textarea>
            </td>
            <td align="right">
               <a href="javascript:document.reply.submit()">
                  [���]
               </a>&nbsp;
            </td>
         </tr>
   </table>
</form>	

 <table>
     <c:forEach var="comment" items="${replyList }">
        <table >
          <tr align="center" valign="middle" bordercolor="#333333"
            onmouseover="this.style.backgroundColor='#5CD1E5'"
            onmouseout="this.style.backgroundColor=''">
            <td align="center" width="100"><font size="2.5">${comment.nickname }</font></td>
            <td height="20" width="400" align="left">   
            <font size="2.5">   
               ${comment.content }</font></td>
            <td align="center"> <font size="2">�ۼ��� :
               <c:if test="${comment.format == today}">
                  <f:formatDate value="${comment.cdate}" pattern="HH : mm : ss"/><br>
               </c:if>
               <c:if test="${comment.format != today}">
                  <f:formatDate value="${comment.cdate}" pattern="yyyy-MM-dd  HH : mm "/><br>
               </c:if>
            </font>
               <c:if test="${USER_KEY.mNo == comment.mNo || USER_KEY.grade == '9'}">
                  <a href="replyDelete.html?commentno=${comment.commentno }&no=${param.num}&pageNum=${pageNum}&category=${comment.category}">
                  <font size="2">X</font></a>
                  </c:if>
         </td>
      </tr> 
   </table>
</c:forEach> 
   </table>