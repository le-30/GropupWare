<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@include file="./../common/common.jsp" %>


<form action="lsh_list.erp" method="get" id="empSearchForm">
<select name = whatColumn>
	<option value="">전체 선택</option>
	<option value="emp_no">사원번호</option>
	<option value="emp_nm">사원이름</option>
</select>
<input type="text" name="keyword">
<input type="button" value="검색" id="searchBtn">
</form>

<script>
  $(document).ready(function(){
	  
	$('#searchBtn').on('click',function(){
		
		const searchData = $('#empSearchForm').serialize();
		
		$.ajax({
			url : "lsh_list.erp",
			method: "GET",
			data: searchData,
			success: function(html){
				$('#empTableBody').html(html);
			},
			error: function(){
				alert("검색실패");
			}
		});
	});
  });

</script>
<table border="1">
  
 	<thead>
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
 	</thead>
  
  	<tbody id="empTableBody">
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
  	</tbody>
 
 
</table>