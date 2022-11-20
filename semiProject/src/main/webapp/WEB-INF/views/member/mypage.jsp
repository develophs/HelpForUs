<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>ë§ˆì´?˜ì´ì§€</title>
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
   				
   				<p class="category">?? ?•ë³´</p>
   				<ul type="circle">
   					<li><p class="menu" onclick="location.href='${contextPath}/myInfo.me'">?? ?•ë³´ ?•ì¸ / ?˜ì •</p></li>
   					<li><p class="menu" onclick="location.href='${contextPath}/rose.me'">?¥ë? êµ¬ì…</p></li>
   				</ul>
   				
   				
   				<p class="category">ê¸°ë? ?„í™©</p>
   				<ul type="circle">
   					<li><p class="menu" onclick="location.href='${contextPath}'">ê¸°ë? ?´ì—­</p></li>
   					<li><p class="menu" onclick="location.href='${contextPath}'">?‘ì›?? ëª¨ê¸ˆ ê²Œì‹œê¸€</p></li>
   				</ul>
   				
   				
   				<p class="category">ë´‰ì‚¬ ?œë™ ?„í™©</p>
   				<ul type="circle">
	   				<li><p class="menu" onclick="location.href='${contextPath}'">? ì²­?? ë´‰ì‚¬?œë™</p></li>
   					<li><p class="menu" onclick="location.href='${contextPath}'">?‘ì›?? ë´‰ì‚¬?œë™</p></li>
				</ul>
				
				
				<c:if test="${loginUser.memberRight =='C'}">
					<p class="category">ë´‰ì‚¬ ?¨ì²´</p>
	   				<ul type="circle">
		   				<li><p class="menu" onclick="location.href='${contextPath}'">?‘ì„±?? ê¸°ë? ?„í™©</p></li>
	   					<li><p class="menu" onclick="location.href='${contextPath}'">?‘ì„±?? ë´‰ì‚¬ëª¨ì§‘ ?„í™©</p></li>
					</ul>
				</c:if>
				
				<p class="category">ìª½ì???</p>
   				<ul type="circle">
	   				<li><p class="menu" onclick="location.href='${contextPath}/message.bo'">ìª½ì???</p></li>
				</ul>
   			</div>
   			
   			<%--ê³µë°±?ì„± --%>
   			<div class="col-1">
   			</div>
   			<%--ê³µë°±?ì„± --%>
   			
   			<%-- ë©”ë‰´ ? íƒ?˜ë©´ ?˜ì˜¤?? ?”ë©´ ì»¨í…Œ?´ë„ˆ --%>
   			<div class="col-8 border border-dark border-2">
   				
                    </div>
                </div>
   			</div>
   			
	<jsp:include page="../common/footer.jsp"/>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
</body>
</html>