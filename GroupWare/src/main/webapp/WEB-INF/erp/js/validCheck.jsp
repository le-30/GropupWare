<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<script>
const insertValid = {
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


$('#submitBtn').on('click', function () {
	  const config = insertValid[currentModal];


	  const formData = $('#' + config.formId).serialize();

	  $.ajax({
	    url: config.url,
	    method: 'POST',
	    data: formData,
	    success: function (html) {
	      // 유효성 검사 실패 시 다시 form 페이지를 반환 → formId 기준으로 판별
	      if (html.includes(config.formId)) {
	        $('#modalContent').html(html); // 모달 내용 갱신
	      } else {
	        $('#customModal').hide();
	        $('#modalContent').empty();
	        loadContent(config.target); // 본문 새로고침
	      }
	    },
	    error: function () {
	      alert("등록 중 오류 발생");
	    }
	  });
	});

</script>