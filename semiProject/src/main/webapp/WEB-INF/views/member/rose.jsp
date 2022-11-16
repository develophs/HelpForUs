<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>마이페이지</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<style>
	.mypage{padding-top:15px; text-align:left; font-weight:bold;}
	.category{font-weight:bold; text-align:left; font-size:22px; padding-top:5px;}
	.menu{text-align:left; font-size:13px; margin:1px;}
	.menu:hover{font-weight:bold; cursor:pointer; text-decoration:underline;}
	.seletedCategory{font-weight:bold; text-align:center; font-size:22px; padding-top:5px;}
	.chargeRose{font-weight:bold; text-align:left; font-size:30px; padding-top:25px;}
	.underline{width:360px; text-align:center;}
	.rose{font-weight:bold; font-size:26px; padding:20px;}
</style>
</head>
<body>
	<jsp:include page="../common/top.jsp"/>
	
	
	<div class="container text-center">
		<h3 class='mypage'>My Page</h3>
		
		<br>
		
		<div class="row">
    		<div class="col-2 border border-dark border-2">
   				
   				<p class="category">내 정보</p>
   				<ul type="circle">
   					<li><p class="menu" onclick="location.href='${contextPath}/myInfo.me'">내 정보 확인 / 수정</p></li>
   					<li><p class="menu" onclick="location.href='${contextPath}/rose.me'">장미 구입</p></li>
   				</ul>
   				
   				
   				<p class="category">기부 현황</p>
   				<ul type="circle">
   					<li><p class="menu" onclick="location.href='${contextPath}'">기부 내역</p></li>
   					<li><p class="menu" onclick="location.href='${contextPath}'">응원한 모금 게시글</p></li>
   				</ul>
   				
   				
   				<p class="category">봉사 활동 현황</p>
   				<ul type="circle">
	   				<li><p class="menu" onclick="location.href='${contextPath}'">신청한 봉사활동</p></li>
   					<li><p class="menu" onclick="location.href='${contextPath}'">응원한 봉사활동</p></li>
				</ul>
				
				<p class="category">봉사 단체</p>
   				<ul type="circle">
	   				<li><p class="menu" onclick="location.href='${contextPath}'">작성한 기부 현황</p></li>
   					<li><p class="menu" onclick="location.href='${contextPath}'">작성한 봉사모집 현황</p></li>
				</ul>
				
				<p class="category">쪽지함</p>
   				<ul type="circle">
	   				<li><p class="menu" onclick="location.href='${contextPath}'">쪽지함</p></li>
				</ul>
   			</div>
  	 	
   
   			
   			<%--공백생성 --%>
   			<div class="col-1">
   			</div>
   			<%--공백생성 --%>
   			
   			<%-- 메뉴 선택하면 나오는 화면 컨테이너 --%>
   			<div class="col-8 border border-dark border-2">
   				
   				<!-- 선택된 제목-->
                <h4 class="chargeRose">보유 중인 장미 : 10000 송이</h4>
                <hr class="underline">
                
                <h4 class="chargeRose">장미 구입</h4>
                <br>
                
	              	<div class="row"> 
	              	 
		                <div class="col-5">
		                	<div class="rose">장미 1 송이    
		                		<button type="button" class="btn btn-danger" value="1"
		                		style="--bs-btn-padding-y: .25rem; --bs-btn-padding-x: .5rem; --bs-btn-font-size: 1rem;"
		                		>100원</button>
		                	</div>
		                </div>
			            
			            <div class="col-5">
		                	<div class="rose">장미 100 송이
		                		<button type="button" class="btn btn-primary" value="100"
		                		style="--bs-btn-padding-y: .25rem; --bs-btn-padding-x: .5rem; --bs-btn-font-size: 1rem;"
		                		>10000원</button>
		                	</div>
		                </div>
	                </div>
	                
		            <div class="row"> 
		                <div class="col-5">
		                	<div class="rose">장미 10 송이
		                		<button type="button" class="btn btn-primary" value="10"
		                		style="--bs-btn-padding-y: .25rem; --bs-btn-padding-x: .5rem; --bs-btn-font-size: 1rem;"
		                		>1000원</button>
		                	</div>
		                </div>
			            
			            <div class="col-5">
		                	<div class="rose">장미 300 송이
		                		<button type="button" class="btn btn-primary" value="300"
		                		style="--bs-btn-padding-y: .25rem; --bs-btn-padding-x: .5rem; --bs-btn-font-size: 1rem;"
		                		>30000원</button>
		                	</div>
		                </div>
	                </div>
                	
                	 <div class="row"> 
		                <div class="col-5">
		                	<div class="rose">장미 30 송이
		                		<button type="button" class="btn btn-primary" value="30"
		                		style="--bs-btn-padding-y: .25rem; --bs-btn-padding-x: .5rem; --bs-btn-font-size: 1rem;"
		                		>3000원</button>
		                	</div>
		                </div>
			            
			            <div class="col-5">
		                	<div class="rose">장미 500 송이
		                		<button type="button" class="btn btn-primary" value="500"
		                		style="--bs-btn-padding-y: .25rem; --bs-btn-padding-x: .5rem; --bs-btn-font-size: 1rem;"
		                		>50000원</button>
		                	</div>
		                </div>
	                </div>
	                
	                
	                <div class="row"> 
		                <div class="col-5">
		                	<div class="rose">장미 50 송이
		                		<button type="button" class="btn btn-outline-primary" value="50"
		                		style="--bs-btn-padding-y: .25rem; --bs-btn-padding-x: .5rem; --bs-btn-font-size: 1rem;"
		                		>5000원</button>
		                	</div>
		                </div>
			        
			        
			         
			       		<div class="col-5">
		            		<div class="rose">장미 1000 송이
		                		<button type="button" class="btn btn-outline-primary" value="1000"
		                		style="--bs-btn-padding-y: .25rem; --bs-btn-padding-x: .5rem; --bs-btn-font-size: 1rem;"
		                		>100000원</button>
		               		</div>
		            	</div>
	                </div>
	                
	                <div class="row">
	               		<div class="col-12">
		                	<div class="rose">
		                		<span></span><span></span>
		                		<a href="#">
		                		<button type="submit" class="btn btn-outline-danger" style="margin-left:20px;">결제하기</button>
		                		</a>
		                	</div>
		                </div>
	                </div>
	            </div> 
            </div>
   		</div>
	<jsp:include page="../common/footer.jsp"/>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>

	<script>
		window.onload = () =>{
			const btn = document.querySelectorAll('button[type="button"]');
			const price = document.querySelectorAll('span');
			
			
			
			for(const i of btn){
				i.addEventListener('click',()=>{
					price[1].innerText = i.value + '개';
					price[2].innerText = '(' + i.innerHTML + ')';
				});
			}
			
		}
	</script>
</body>
</html>