<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>마이?�이지</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<style>
	.mypage{padding-top:15px; text-align:left; font-weight:bold;}
	.category{font-weight:bold; text-align:left; font-size:22px; padding-top:5px;}
	.menu{text-align:left; font-size:13px; margin:1px;}
	.menu:hover{font-weight:bold; cursor:pointer; text-decoration:underline;}
	.seletedCategory{font-weight:bold; text-align:center; font-size:22px; padding-top:5px;}
</style>
</head>
<body>
	<jsp:include page="../common/top.jsp"/>
	
	<div class="container text-center">
		<h3 class='mypage'>My Page</h3>
		
		<br>
		
		<div class="row">
    		<div class="col-2 border border-dark border-2">
   				
   				<p class="category">?? ?�보</p>
   				<ul type="circle">
   					<li><p class="menu" onclick="location.href='${contextPath}/myInfo.me'">?? ?�보 ?�인 / ?�정</p></li>
   					<li><p class="menu" onclick="location.href='${contextPath}/rose.me'">?��? 구입</p></li>
   				</ul>
   				
   				
   				<p class="category">기�? ?�황</p>
   				<ul type="circle">
   					<li><p class="menu" onclick="location.href='${contextPath}'">기�? ?�역</p></li>
   					<li><p class="menu" onclick="location.href='${contextPath}'">?�원?? 모금 게시글</p></li>
   				</ul>
   				
   				
   				<p class="category">봉사 ?�동 ?�황</p>
   				<ul type="circle">
	   				<li><p class="menu" onclick="location.href='${contextPath}'">?�청?? 봉사?�동</p></li>
   					<li><p class="menu" onclick="location.href='${contextPath}'">?�원?? 봉사?�동</p></li>
				</ul>
				
				
				<c:if test="${loginUser.memberRight =='C'}">
					<p class="category">봉사 ?�체</p>
	   				<ul type="circle">
		   				<li><p class="menu" onclick="location.href='${contextPath}'">?�성?? 기�? ?�황</p></li>
	   					<li><p class="menu" onclick="location.href='${contextPath}'">?�성?? 봉사모집 ?�황</p></li>
					</ul>
				</c:if>
				
				<p class="category">쪽�???</p>
   				<ul type="circle">
	   				<li><p class="menu" onclick="location.href='${contextPath}/message.bo'">쪽�???</p></li>
				</ul>
   			</div>
   			
   			<%--공백?�성 --%>
   			<div class="col-1">
   			</div>
   			<%--공백?�성 --%>
   			
   			<%-- 메뉴 ?�택?�면 ?�오?? ?�면 컨테?�너 --%>
   			<div class="col-8 border border-dark border-2">
   				
                    </div>
                </div>
   			</div>
   			
	<jsp:include page="../common/footer.jsp"/>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
</body>
</html>