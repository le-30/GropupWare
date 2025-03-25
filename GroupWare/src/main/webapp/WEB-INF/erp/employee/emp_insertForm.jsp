<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@include file="./../common/common.jsp" %>
emp_insertForm.jsp<br>

<form:form commandName="empBean" action="lsh_insert.erp" method="post" id="empinsertForm">



사원번호:<input type="text" name="emp_no">
<form:errors path="emp_no"/>
<br><br>

이름:<input type="text" name="emp_nm">
<form:errors path="emp_nm"/>
<br><br>

비밀번호:<input type="password" name="pw">
<form:errors path="pw"/>
<br><br>

성별:
<input type="radio" name="gender" value="1">남
<input type="radio" name="gender" value="2">여
<form:errors path="gender"/>
<br><br>

부서: <select name="dept_cd">
		<option value="">선택</option>
		<option value="1100">인사팀</option>
		<option value="1200">경영팀</option>
		<option value="1300">관리팀</option>
	</select>
<form:errors path="dept_cd"/>
<br><br>

직위: <select name="position_cd">
		<option value="">선택</option>
		<option value="4">사원</option>
		<option value="3">과장</option>
		<option value="2">부장</option>
		<option value="1">사장</option>
	</select>
<form:errors path="position_cd"/>
<br><br>

입사일:<input type="date" name="hire_date">
<br><br>


생년월일:<input type="date" name="birth">
<br><br>

이메일:<input type="text" name="email">
<form:errors path="email"/>
<br><br>
<input type="button" value="추가하기" id="submitBtn">
</form:form>

<%@include file = "./../js/validCheck.jsp"%>