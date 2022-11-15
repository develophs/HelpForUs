<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HELP FOR US</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
<style>
	#topDiv{
		padding-left: 40px; padding-right: 50px; height: 50px; font-family: 'CookieRunOTF';
	}
	#topDiv a{
		font-size: 30px;
	}
	#collapsibleNavbar a{
		color: black; text-decoration: none; font-size: 20px; font-size: 20px;
	}
	#collapsibleNavbar a:hover{
		color: gray;
	}
	#imgDiv{
		height: 300px;
	}
	#imgDiv>img{
		width: 100%; height: 100%;
 		object-fit: fill;
	}
</style>
</head>
<body>
	<nav class="navbar navbar-expand" style="background: #fbd14b;">
		<div class="container-fluid" id="topDiv">
			<a class="navbar-brand" href="${contextPath}">
				<img src="https://user-images.githubusercontent.com/105089699/198592367-759659d8-e666-41e7-a465-ecc84db3abdb.png" alt="Logo" width="50" height="40" class="d-inline-block align-text-top">
				&nbsp;HELP FOR US
			</a>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#collapsibleNavbar">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse justify-content-end"
				id="collapsibleNavbar">
				<ul class="navbar-nav">
					<c:if test="${ name == null }">
						<li class="nav-item"><a class="nav-link" href="${contextPath}/login.me">로그인</a></li>
						<li class="nav-item"><a class="nav-link" href="#">회원가입</a></li>
					</c:if>
					<c:if test="${ name != null }">
						<li class="nav-item"><a class="nav-link" href="${contextPath}/myPage.me">내 정보</a></li>
						<li class="nav-item"><a class="nav-link" href="logout.me">로그아웃</a></li>
					</c:if>
				</ul>
			</div>
		</div>
	</nav>
	<div id="imgDiv">
		<img src="https://www.nonsan.go.kr/nanum/nanum/img/main/mvisual_bg01.jpg" alt="img">
	</div>
</body>
</html>