<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- /WEB-INF/views/main.jsp -->
<%@ page contentType="text/html; charset=UTF-8" %>
<%@include file="./../common/common.jsp" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>main</title>
    <script src="${pageContext.request.contextPath}/resources/js/jquery-3.6.0.min.js"></script>

    <style>
        .main-content {
            margin-left: 250px;
            margin-top: 7vh;
            padding: 20px;
            box-sizing: border-box;
        }
    </style>
</head>
<body>

    <!-- header include -->
    <jsp:include page="header.jsp" />

    <!-- sidebar include -->
    <jsp:include page="sidebar.jsp" />

    <!-- 본문 -->
    <div class="main-content">
    	
    </div>
    
    <!-- 모달 영역 -->
	<div id="customModal" 
		style="display:none; position:fixed; top:10%; left:50%; transform:translateX(-50%); background:#fff; border:1px solid #ccc; padding:20px; z-index:9999;">
 		<div id="modalContent"></div>
  		<button onclick="closeModal()">닫기</button>
	</div>
    
	<script>
	let currentModal='';
		
		function handleSidebar(btn){
			const action = btn.dataset.action;
			const target = btn.dataset.target;
			
			if(action === "page"){
				loadContent(target);
			}else if(action === "modal"){
				openModal(target);
			}
		}
	
	
	
	
		function loadContent(page){
			$.ajax({
				url:'router.erp',
				type:'GET',
				data: {page: page},
				success: function(html){
					$('.main-content').html(html);
					
					if(page === 'emp'){
					   $('#headerBtn').text('사원 등록');
					   currentModal ="emp_insert";
					   
					   $('').text('');
					   
					}
				},
				error: function(){
					alert('본문을 불러오는 중 오류가 발생했습니다.');
				}
			});//ajax
		}//loadContent
		
		function openModal(page){
			const pageMap={
					emp_insert: 'lsh_insert.erp'
			};//openModal
			
			$.ajax({
				url: pageMap[page],
				method: 'GET',
				success: function(html){
					$('#modalContent').html(html);
					$('#customModal').show();
				},
				error: function(){
					alert("모달 로딩 실패");
				}
			});//ajax
		}
	function closeModal(){
		$('#customModal').hide();
		$('#modalContent').empty();
	}//closemodal
	
	window.onload = function() {
	  const params = new URLSearchParams(window.location.search); 
	  const page = params.get("page");                            
	  if (page) {
	    loadContent(page);                                      
	  }
	};
	
	</script>
</body>
</html>
    