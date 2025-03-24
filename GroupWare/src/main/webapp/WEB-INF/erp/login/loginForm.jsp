<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- login.jsp -->


<form action="lsh_login.erp" method="post">
<table border="1">
	<tr>
		<th>사원번호</th>
		<td>
		<input type="text" name="emp_no">
		</td>
	</tr>
	<tr>
		<th>비밀번호</th>
		<td>
		<input type="password" name="pw">
		</td>
	</tr>
	<tr>
		<td colspan="2">
		<input type="submit" value="로그인">
		</td>
	</tr>

</table>

</form>