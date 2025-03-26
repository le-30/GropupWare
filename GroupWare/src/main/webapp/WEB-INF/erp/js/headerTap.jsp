<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!-- headertab관리자페이 -->
<script>

	
window.tabSets = window.tabSets || {
		  msg: [
		    { label: "받은 쪽지", target: "received" },
		    { label: "보낸 쪽지", target: "send" }
		  ],
		  alarm: [
		    { label: "안읽은 알림", target: "alarmUnread" },
		    { label: "전체 알림", target: "alarmAll" }
		  ],
		  notice: [
		    { label: "전체 공지", target: "notice" },
		    { label: "부서 공지", target: "deptNotice" }
		  ],
		  emp: [
		    { label: "사원 목록", target: "emp" }
		  ],
		  calender: [
		    { label: "월간 일정", target: "calendarMonth" },
		    { label: "주간 일정", target: "calendarWeek" }
		  ],
		  comment: [
		    { label: "출퇴근 기록", target: "commute" }
		  ],
		  vacation: [
		    { label: "휴가 확인", target: "vacation" },
		    { label: "휴가 신청", target: "vacationRequest" }
		  ],
		  appr: [
		    { label: "결재 요청", target: "apprRequest" },
		    { label: "결재 완료", target: "apprDone" }
		  ],
		  pay: [
		    { label: "급여 내역", target: "payHistory" },
		    { label: "지급 요청", target: "payRequest" }
		  ],
		  admin: [
		    { label: "부서관리", target: "dept" },
		    { label: "공통코드 관리", target: "cmmCode" },
		    { label: "권한부여 관리", target: "authInfo" }
		  ]
		};



	
	function handleSidebar(btn){
		
		const action = btn.dataset.action;
		const target = btn.dataset.target;
		
		if(action === "page"){
			const tabs = tabSets[target];//해당 메뉴의 탭세트 가져오기
			
			 
			if(tabs){
				 const $headerTabs = $("#headerTabs");//$변수이름은 Jquery객체라고 표시해준것
				 $headerTabs.empty();//기존탭 비우기
				 
				 $.each(tabs, function(index, tab){
					 
					 const isActive = index === 0 ? "active" :"";
					 const html = '<span class="tab '+isActive+ '"data-target="'+tab.target+'">'+tab.label+'</span>';
					 
					 $headerTabs.append(html);
				 });
				 
				 bindTabEvents();
				 loadContent(tabs[0].target);
			 }else{
				 //탭세트 없으면 바로 로딩
			loadContent(target);
				 
			 }
		}else if(action === "modal"){
			openModal(target);
		}
	}

</script>