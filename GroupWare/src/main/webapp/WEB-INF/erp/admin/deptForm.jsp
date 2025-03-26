<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@include file="./../common/common.jsp" %>

<form action="dept_list.erp" method="post">
	<table border="1">
		<tr>
			<th>부서코드</th>
			<th>부서이름</th>
			<th>상위부서코드</th>
		</tr>	
		
		<c:forEach var="dept" items="${lists}">
		<tr>
			<th>${dept.dept_cd }</th>
			<th>${dept.dept_nm }</th>
			<th>${dept.p_dept_cd }</th>
		</tr>	
		</c:forEach>
	</table>
</form>
