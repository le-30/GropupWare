<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
emp_insertForm.jsp<br>

<form action="lsh_insert.erp" method="post">

사원번호:<input type="text" name="emp_no"><br><br>

이름:<input type="text" name="emp_nm"><br><br>

비밀번호:<input type="password" name="pw"><br><br>

성별:
<input type="radio" name="gender" value="1">남
<input type="radio" name="gender" value="2">여
<br><br>

부서: <select name="dept_cd">
		<option value="">선택</option>
		<option value="1100">인사팀</option>
		<option value="1200">경영팀</option>
		<option value="1300">관리팀</option>
	</select>
<br><br>

직위: <select name="position_cd">
		<option value="">선택</option>
		<option value="4">사원</option>
		<option value="3">과장</option>
		<option value="2">부장</option>
		<option value="1">사장</option>
	</select>
<br><br>

입사일:<input type="date" name="hire_date">
<br><br>


생년월일:<input type="date" name="birth">
<br><br>

이메일:<input type="text" name="email">
<br><br>
<input type="submit" value="추가하기">
</form>