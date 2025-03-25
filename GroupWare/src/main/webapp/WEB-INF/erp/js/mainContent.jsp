<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 본문,헤더버튼 관리 페이지 -->
<script>

	window.pageConfig = window.pageConfig || {
	    emp: {
	      button: "사원 등록",
	      modal: "emp_insert",
	      tabs: [
	        { label: "사원 목록", target: "emp" }
	      ]
	    },
	    dept: {
	      button: "부서등록",
	      modal: "dept_insert",
	      tabs: [
	        { label: "부서관리", target: "dept" }
	      ]
	    },
	    cmmCode: {
	      button: "공통코드등록",
	      modal: "cmmCode_insert",
	      tabs: [
	        { label: "공통코드 관리", target: "cmmCode" }
	      ]
	    }
	   
	   };
		

		window.modalPages = window.modalPages || {
				  emp_insert: 'lsh_insert.erp',
				  dept_insert: 'dept_insert.erp',
				  cmmCode_insert: 'cmmCode_insert.erp'
				};


		window.currentModal = '';

		function loadContent(page) {
		  	$.ajax({
		    	url: 'router.erp',
		   		type: 'GET',
		   		data: { page: page },
		   		success: function(html) {
		     	   $('.main-content').html(html);

		           const config = pageConfig[page];
		           if (config) {
		           $('#headerBtn').text(config.button);
		           currentModal = config.modal;
		         } else {
		           $('#headerBtn').text('');
		           currentModal = '';
		         }
		        },
		    error: function() {
		      alert('본문을 불러오는 중 오류가 발생했습니다.');
		    }
		  });
		}

		
		function openModal(page) {
			  const url = modalPages[page];
			  if (!url) {
			    alert("모달 페이지가 설정되지 않았습니다.");
			    return;
			  }

			  $.ajax({
			    url: url,
			    method: 'GET',
			    success: function(html) {
			      $('#modalContent').html(html);
			      $('#customModal').show();
			    },
			    error: function() {
			      alert("모달 로딩 실패");
			    }
			  });
			}

</script>