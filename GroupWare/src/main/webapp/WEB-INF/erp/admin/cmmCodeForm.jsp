<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@include file="./../common/common.jsp" %>
cmmCodeFor.jsp<br>

<form action="cmm_list.erp" method="post">
	<table border="1">
		<tr>
			<th>공통코드class</th>
			<th>공통코드 코드</th>
			<th>공통코드이름</th>
		</tr>	
		
		<c:forEach var="cmmCode" items="${lists}">
		<tr>
			<th>${cmmCode.cmm_class }</th>
			<th>${cmmCode.cmm_cd }</th>
			<th>${cmmCode.cmm_nm }</th>
			
		</tr>	
		</c:forEach>
	</table>
</form>