<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
	tr{height: 80px;}
	th, td{font-size: 20px; border-left: none; border-right: none;}
	table{border-bottom: 4px solid gray;}
	
</style>
</head>
<body>
	<%-- <jsp:include page="../common/top.jsp"/> --%>
	
	
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
				
				<c:if test="${loginUser.memberRight =='C'}">
					<p class="category"></p>
					<p class="category">봉사 단체</p>
	   				<ul type="circle">
		   				<li><p class="menu" onclick="location.href='${contextPath}'">작성한 기부 현황</p></li>
	   					<li><p class="menu" onclick="location.href='${contextPath}'">작성한 봉사모집 현황</p></li>
					</ul>
   				</c:if>
   				
   				<p class="category">쪽지함</p>
   				<ul type="circle">
	   				<li><p class="menu" onclick="location.href='${contextPath}/message.bo'">쪽지함</p></li>
				</ul>
   			</div>
   			
   			<%--공백생성 --%>
   			<div class="col-1">
   			</div>
   			<%--공백생성 --%>
   			
   			<div class="col-9 border border-dark border-2">
   				<h1 class="fs-1 fw-bold text-start mt-5 ms-4">문의 내역</h1>
   				
   				<div class="w-60 jstify-content-center">
   					<table class="table table-bordered" style="padding: auto">
   					<colgroup>
   						<col width="25%">
   						<col width="45%">
   						<col width="20%">
   					</colgroup>
	   					<tr class="table-active align-middle">
	   						<th>단체명</th>
	   						<th>제목</th>
	   						<td></td>
	   					</tr>
	   					<tr class="align-middle">
	   						<th></th>
	   						<th></th>
	   						<td></td>
	   					</tr>
	   					<tr class="align-middle">
	   						<th></th>
	   						<th></th>
	   						<td></td>
	   					</tr>   				
	   					<tr class="align-middle">
	   						<th></th>
	   						<th></th>
	   						<td></td>
	   					</tr>
	   					<tr class="align-middle">
	   						<th></th>
	   						<th></th>
	   						<td></td>
	   					</tr>
	   					<tr class="align-middle">
	   						<th></th>
	   						<th></th>
	   						<td></td>
	   					</tr>
	   					<tr class="align-middle">
	   						<th></th>
	   						<th></th>
	   						<td></td>
	   					</tr>
     			</table>
   				</div>
   				
     			<jsp:include page="../common/pagination.jsp"/>
   			</div>
  		</div>
	</div>
	
	<br><br><br>




	<jsp:include page="../common/footer.jsp"/>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
</body>
</html>