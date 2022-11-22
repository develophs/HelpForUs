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
	.category{font-weight:bold; text-align:left; font-size:22px; padding-top:5px;}
	.menu{text-align:left; font-size:13px; margin:1px;}
	.menu:hover{font-weight:bold; cursor:pointer; text-decoration:underline;}
	.seletedCategory{font-weight:bold; text-align:center; font-size:22px; padding-top:5px;}
</style>
</head>
<body>
	<jsp:include page="../common/top.jsp"/>
	
	<div class="container text-center">
		<c:if test="${loginUser.memberRight =='B'}">
			<h3 class='mypage'>My Page</h3>
		</c:if>
		
		<c:if test="${loginUser.memberRight =='C'}">
			<h3 class='mypage'>단체 정보 페이지</h3>
		</c:if>
		
		
		<br>
		
		<div class="row">
    		<div class="col-2 border border-dark border-2">
   				
   				<c:if test="${loginUser.memberRight =='B'}">
   					<p class="category">내 정보</p>
   				</c:if>
   				
   				<c:if test="${loginUser.memberRight =='C'}">
   					<p class="category">단체 정보</p>
   				</c:if>
   				
   				<ul type="circle">
   					<c:if test="${loginUser.memberRight =='B'}">
   						<li><p class="menu" onclick="location.href='${contextPath}/myInfo.me'">내 정보 확인 / 수정</p></li>
	   				</c:if>
	   				
	   				<c:if test="${loginUser.memberRight =='C'}">
	   					<li><p class="menu" onclick="location.href='${contextPath}/myInfo.me'">단체 정보 확인 / 수정</p></li>
	   				</c:if>
	   				
   					<li><p class="menu" onclick="location.href='${contextPath}/rose.me'">장미 구입</p></li>
   				</ul>
   				
   				<c:if test="${loginUser.memberRight =='B'}">
   				
   				<p class="category">기부 현황</p>
   				<ul type="circle">
   					<li><p class="menu" onclick="location.href='${contextPath}/donBoard.me'">기부 내역</p></li>
   					<li><p class="menu" onclick="location.href='${contextPath}'">응원한 모금 게시글</p></li>
   				</ul>
   				
   				
   				<p class="category">봉사 활동 현황</p>
   				<ul type="circle">
	   				<li><p class="menu" onclick="location.href='${contextPath}/volBoard.me'">신청한 봉사활동</p></li>
   					<li><p class="menu" onclick="location.href='${contextPath}'">응원한 봉사활동</p></li>
				</ul>
				
				</c:if>
				
				<c:if test="${loginUser.memberRight =='C'}">
					<p class="category">봉사 모집 현황</p>
	   				<ul type="circle">
	   					<li><p class="menu" onclick="location.href='${contextPath}/volList.me'">작성한 봉사모집 현황</p></li>
	   					<li><p class="menu" onclick="location.href='${contextPath}/endVolList.me'">봉사모집 마감 현황</p></li>
					</ul>
					
					<p class="category">모금 현황</p>
	   				<ul type="circle">
		   				<li><p class="menu" onclick="location.href='${contextPath}/donList.me'">작성한 기부 현황</p></li>
		   				<li><p class="menu" onclick="location.href='${contextPath}/endDonList.me'">기부 마감 현황</p></li>
					</ul>
				</c:if>
				
				
				<p class="category">쪽지함</p>
   				<ul type="circle">
	   				<li><p class="menu" onclick="location.href='${contextPath}/message.me'">쪽지함</p></li>
				</ul>
   			</div>
   			
   			<%--공백 생성 --%>
   			<div class="col-1">
   			</div>
   			<%--공백 생성 --%>
   			
   			<%-- 메뉴 선택 컨테이터 --%>
   			<div class="col-8 border border-dark border-2">
   				
                    </div>
                </div>
   			</div>
   			
	<jsp:include page="../common/footer.jsp"/>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
</body>
</html>