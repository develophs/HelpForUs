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
	.category{font-weight:bold; text-align:left; font-size:24px; padding-top:15px;}
	.menu{text-align:left; font-size:15px;}
	.menu:hover{font-weight:bold; cursor:pointer;}
	#divTable{padding-left: 100px; padding-right: 100px}
	
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
   					<li><p class="menu" onclick="location.href='${contextPath}/myInfo.me'">내 정보 확인</p></li>
   					<li><p class="menu" onclick="location.href='${contextPath}'">장미 내역</p></li>
   				</ul>
   				<p class="category"></p>
   				
   				
   				<p class="category">기부 현황</p>
   				<ul type="circle">
   					<li><p class="menu" onclick="location.href='${contextPath}'">기부 내역</p></li>
   					<li><p class="menu" onclick="location.href='${contextPath}'">응원한 모금 게시글</p></li>
   				</ul>
   				
   				
   				<p class="category"></p>
   				<p class="category">봉사 활동 현황</p>
   				<ul type="circle">
	   				<li><p class="menu" onclick="location.href='${contextPath}'">신청한 봉사활동</p></li>
   					<li><p class="menu" onclick="location.href='${contextPath}'">응원한 봉사활동</p></li>
				</ul>
				
				<p class="category"></p>
				<p class="category">봉사 단체</p>
   				<ul type="circle">
	   				<li><p class="menu" onclick="location.href='${contextPath}'">작성한 기부 현황</p></li>
   					<li><p class="menu" onclick="location.href='${contextPath}'">작성한 봉사모집 현황</p></li>
				</ul>
   			
   			</div>
   			
   			<%--공백생성 --%>
   			<div class="col-1">
   			</div>
   			<%--공백생성 --%>
   			
   			<div class="col-9 border border-dark " id="divTable">
   				<h3 style="text-align: center; padding-bottom: 50px; padding-top: 100px;"><img src="https://cdn-icons-png.flaticon.com/512/594/594005.png" width="50px" height="50px">&nbsp;내가 건넨 장미 : <span>1028장미</span></h3>
   				<div style="height: 400px">
   				
					<table class="table" >
					<caption align="top">나의 응원 내역</caption>
					  <thead>
					    <tr>
					      <th scope="col">목표 장미 수</th>
					      <th scope="col">기부 단체</th>
					      <th scope="col"></th>
					    </tr>
					  </thead>
					  <tbody class="table-group-divider" >
					    <tr>
					      <td>30000송이</td>
					      <td>햇살보육원</td>
					      <td><button >후원하기</button></td>
					    </tr>
						<tr>
					      <td>30000송이</td>
					      <td>햇살보육원</td>
					      <td><button>후원하기</button></td>
					    </tr>
					    <tr>
					      <td>30000송이</td>
					      <td>햇살보육원</td>
					      <td><button>후원하기</button></td>
					    </tr>
					    <tr>
					      <td>30000송이</td>
					      <td>햇살보육원</td>
					      <td><button>후원하기</button></td>
					    </tr>
					    <tr>
					      <td>30000송이</td>
					      <td>햇살보육원</td>
					      <td><button>후원하기</button></td>
					    </tr>
					  </tbody>
					</table>
   				</div>
   				 <div style="padding-top: 50px;"><jsp:include page="../common/pagination.jsp"/></div>
   			</div>
			   <div style="height: 100px;"></div>
  		</div>
	</div>
	
	




	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
</body>
</html>