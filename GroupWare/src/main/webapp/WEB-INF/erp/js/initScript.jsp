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
	
	
    $(document).ready(function(){//검색기능
    	
	  $(document).on('click','#searchBtn', function () {
	    const searchData = $('#empSearchForm').serialize(); 

	    $.ajax({
	      url: 'lsh_list.erp',
	      method: 'GET',
	      data: searchData,
	      success: function (html) {
	        $('.main-content').html(html);
	      },
	      error: function (xhr) {
	        alert('검색 실패');
	      }
	    });
	  });
    });
	
    
    
    $(document).on('click', '#paging a', function(e) {
    	  e.preventDefault(); // 기본 페이지 이동 막기

    	  const url = $(this).attr('href');
		 const targetId = pageConfig[currentPage]?.container;
		 const $target = $('#'+targetId);
    	  $.ajax({
    	    url: url,
    	    method: 'GET',
    	    success: function(html) {
    	      // 받은 html에서 리스트 영역만 추출해서 교체
    	      const newList = $('<div>').html(html).find('#'+targetId).html();
    	      $target.html(newList);
    	    },
    	    error: function(xhr) {
    	      console.log("❌ 페이징 실패", xhr.status);
    	    }
    	  });
    	});


</script>

