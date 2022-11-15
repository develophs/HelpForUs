<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	#navDiv{
		background: #fbd14b; width: 100%; height: 50px; font-family: 'CookieRunOTF';
		padding-top: 10px;
	}
	#navDiv a{
		font-size: 20px; text-decoration: none; color: black;
		padding-left: 100px; padding-right: 100px;
	}
	#navDiv a:hover{
		color: gray;
	}
</style>
</head>
<body>
	<c:set var="contextPath" value="${ pageContext.request.contextPath }" scope="application"></c:set>
	<div class="container-fluid" id="navDiv">
		<ul class="nav justify-content-center">
			<li class="nav-item"><a  href="${contextPath }/boardList.bo">기부하기</a></li>
			<li class="nav-item"><a href="#">봉사활동</a></li>
			<li class="nav-item"><a href="#">모금후기</a></li>
		</ul>
	</div>
</body>
</html>