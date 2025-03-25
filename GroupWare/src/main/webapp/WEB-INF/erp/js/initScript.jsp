<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!-- 모달닫기,탭 클릭시 본문 로딩, 새로고침시 자동 로딩, 사이드바 클릭시 본문 로딩 -->
<script>
	
	function closeModal(){
		$('#customModal').hide();
		$('#modalContent').empty();
	}//closemodal
	
	//tab 클릭시 페이지교체(헤더제목 누를시)
	function bindTabEvents(){
		$(".tab").off("click").on("click",function(){
			$(".tab").removeClass("active");
			$(this).addClass("active");
			
			const targetPage = $(this).data("target");
			if(targetPage){
				loadContent(targetPage);
			}
		});
	}//bindTabEvents
	
	  
	
	
	
	window.onload = function() {
	  const params = new URLSearchParams(window.location.search); 
	  const page = params.get("page");                            

	  if (page && pageConfig[page]) {
	    const config = pageConfig[page];

	    // 탭 자동 구성
	    if (config.tabs) {
	      const $headerTabs = $("#headerTabs");
	      $headerTabs.empty();

	      $.each(config.tabs, function (index, tab) {
	        const isActive = index === 0 ? "active" : "";
	        const html = '<span class="tab '+isActive+ '"data-target="'+tab.target+'">'+tab.label+'</span>';
	        $headerTabs.append(html);
	      });

	      bindTabEvents();
	      loadContent(config.tabs[0].target);
	    }
		    }else{
	    loadContent(page);    
		
	  }
	};
	
	$(document).ready(function () {
	  $(".sideTr").on("click", function () {
	    handleSidebar(this);
	  });
	});

	</script>