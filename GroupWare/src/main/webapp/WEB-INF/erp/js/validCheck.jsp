<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<script>
	window.insertValid = window.insertValid || {
		emp_insert : {
			url : "lsh_insert.erp",
			formId : "empinsertForm",
			target : "emp"
		},
		dept_insert : {
			url : "dept_insert.erp",
			formId : "deptForm",
			target : "dept"
		},
		cmmCode_insert : {
			url : "cmmCode_insert.erp",
			formId : "cmmCodeForm",
			target : "cmmCode"
		},
		mail_insert : {
			url : "ymh_messageinsert.erp",
			formId : "MessageWriteForm",
			target : "received"
		},
		mail_reply : {
			url : "ymh_messageReply.erp",
			formId : "MessageReplyForm",
			target : "received"
		},
		mail_pass : {
			url : "ymh_messagePass.erp",
			formId : "MessagePassForm",
			target : "received"
		}
	};

	$(document).on('click', '#submitBtn', function() {
        const config = insertValid[$(this).data('modal')];

        const formData = $('#' + config.formId).serialize();
        console.log("formData:" + formData);

        // 버튼 비활성화
        $('#submitBtn').prop('disabled', true);

        $.ajax({
            url: config.url,
            method: 'POST',
            data: formData,
            success: function(html) {
                const $newForm = $('<div>').html(html).find('form'); // 새로 받은 form만 추출
                const $currentForm = $('#' + config.formId); // 현재 폼

                if ($newForm.length > 0) {
                    console.log($newForm.length);
                    $currentForm.replaceWith($newForm); // 기존 폼 덮어쓰기
                } else {
                    $('#customModal').hide();
                    $('#modalContent').empty();
                    loadContent(config.target); // 본문 새로고침
                }

                // 버튼 재활성화
                $('#submitBtn').prop('disabled', false);
                
                document.getElementById('toggleCheckboxList').addEventListener('click', function() {
                    var checkboxList = document.getElementById('checkboxList');
                    if (checkboxList.style.display === "none") {
                        checkboxList.style.display = "block";
                        this.innerHTML = "▲ 받는 사람 선택 숨기기";
                    } else {
                        checkboxList.style.display = "none";
                        this.innerHTML = "▼ 받는 사람 선택";
                    }
                });
            },

            error: function() {
                alert("등록 중 오류 발생");
                // 버튼 재활성화
                $('#submitBtn').prop('disabled', false);
            }
        });
    });

</script>
