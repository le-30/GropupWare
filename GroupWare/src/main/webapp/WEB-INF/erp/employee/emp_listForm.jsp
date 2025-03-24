<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@include file="./../common/common.jsp" %>

<table border="1">
  
    <tr>
      <th>사번</th>
      <th>이름</th>
      <th>상태</th>
      <th>부서</th>
      <th>직위</th>
      <th>입사일</th>
      <th>성별</th>
      <th>생년월일</th>
      <th>이메일</th>
    </tr>
  
  
    <c:forEach var="emp" items="${lists}">
      <tr>
        <td>${emp.emp_no}</td>
        <td>${emp.emp_nm}</td>
        <td>${emp.emp_status}</td>
        <td>${emp.dept_nm}</td>
        <td>${emp.position_nm}</td>
        <td><fmt:formatDate value="${emp.hire_date}" pattern="yyyy-MM-dd"/></td>  
        <td>${emp.gender}</td>
        <td><fmt:formatDate value="${emp.birth}" pattern="yyyy-MM-dd"/></td>
        <td>${emp.email}</td>
      </tr>
    </c:forEach>
  <tr>
  	<td colspan="9">
  	<a href="lsh_insert.erp">추가하기</a>
  	</td>
  </tr>
</table>