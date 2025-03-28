<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<script>
window.insertValid = window.insertValid || {
		  emp_insert: {
		    url: "lsh_insert.erp",
		    formId: "empinsertForm",
		    target: "emp"
		  },
		  dept_insert: {
		    url: "dept_insert.erp",
		    formId: "deptForm",
		    target: "dept"
		  },
		  cmmCode_insert: {
		    url: "cmmCode_insert.erp",
		    formId: "cmmCodeForm",
		    target: "cmmCode"
		  }
		};

	
$(document).off('click', '#submitBtn').on('click', '#submitBtn', function () {
	/* const modalKey = $(this).data('modal'); */
	  const config = insertValid[$(this).data('modal')];
	  
	  const formData = $('#' + config.formId).serialize();
	  console.log("formData:"+formData)
	  
	  $.ajax({
	    url: config.url,
	    method: 'POST',
	    data: formData,
	    success: function (html) {
	      // 유효성 검사 실패 시 다시 form 페이지를 반환 → formId 기준으로 판별
	    	  const $newForm = $('<div>').html(html).find('form'); // 새로 받은 form만 추출
	    	  const $currentForm = $('#' + config.formId); // 현재 있는 forms
	    	  // 버튼 비활성화
	          $('#submitBtn').prop('disabled', true);
	    	  
	    	  if ($newForm.length > 0) {
	    		  console.log($newForm.length);
	    		    $currentForm.replaceWith($newForm); // 기존 form만 덮어쓰기
	    		  } else {
	    		    $('#customModal').hide();
	    		    $('#modalContent').empty();
	    		    loadContent(config.target); // 본문 새로고침
	    		 // 버튼 재활성화
	                $('#submitBtn').prop('disabled', false);

	    		  }
	    		},
	  
	    error: function () {
	      alert("등록 중 오류 발생");
	    }
	  });
	});

</script>