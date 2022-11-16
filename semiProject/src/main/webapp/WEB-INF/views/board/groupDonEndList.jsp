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
	#divTable{padding-left: 75px; padding-right: 75px}
	
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
   					<li><p class="menu" onclick="location.href='${contextPath}/myInfo.me'">단체 정보 확인</p></li>
   				</ul>
   				<p class="category"></p>
   				
   				
   				<p class="category">모금 현황</p>
   				<ul type="circle">
   					<li><p class="menu" onclick="location.href='${contextPath}'">진행중인 모금</p></li>
   					<li><p class="menu" onclick="location.href='${contextPath}'">완료된 모금</p></li>
   				</ul>
   				
   				
   				<p class="category"></p>
   				<p class="category">봉사활동 모집 현황</p>
   				<ul type="circle">
	   				<li><p class="menu" onclick="location.href='${contextPath}'">모집중인 봉사활동</p></li>
   					<li><p class="menu" onclick="location.href='${contextPath}'">모집완료된 봉사활동</p></li>
				</ul>
				
				<p class="category"></p>
				<p class="category">쪽지함</p>
   				<ul type="circle">
				</ul>
   			
   			</div>
   			
   			<%--공백생성 --%>
   			<div class="col-1">
   			</div>
   			<%--공백생성 --%>
   			
   			<div class="col-9 border border-dark " id="divTable">
   				<h3 style="text-align: center; padding-bottom: 50px; padding-top: 100px;">완료된 모금</h3>
   				<div style="height: 400px">
   				
					<table class="table" >
					  <thead>
					    <tr>
					      <th scope="col">글 제목</th>
					      <th scope="col">마감 일</th>
					      <th scope="col">기부자</th>
					    </tr>
					  </thead>
					  <tbody class="table-group-divider" >
					    <tr>
					      <td>든든한 겨울밥상,걱정없는 한해! 김장김치지원 함께해주세요</td>
					      <td>11/30 마감</td>
					      <td><button >기부자 보기</button></td>
					    </tr>
						<tr>
					      <td>성평등 민주주의 후퇴를 막기 위해 지금 할 수 있는 일</td>
					      <td>12/02 마감</td>
					      <td><button>기부자 보기</button></td>
					    </tr>
					    <tr>
					      <td>어르신에게 건네는 희망의 손길</td>
					      <td>11/28 마감</td>
					      <td><button>기부자 보기</button></td>
					    </tr>
					    <tr>
					      <td>"따"뜻한 "온"기로 채워지는 어르신의 밝은 "표"정</td>
					      <td>12/21 마감</td>
					      <td><button>기부자 보기</button></td>
					    </tr>
					    <tr>
					      <td>건강한 입! 건강 한 입!</td>
					      <td>1/23 마감</td>
					      <td><button>기부자 보기</button></td>
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