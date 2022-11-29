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
		padding-left: 40px; padding-right: 50px; height: 50px;
	}
	#topDiv>a{
		font-size: 30px; font-family: 'CookieRunOTF';
	}
	#collapsibleNavbar a{
		color: black; text-decoration: none; font-size: 15px;
	}
	#collapsibleNavbar a:hover{
		color: gray;
	}
	#topImgDiv{
		height: 300px;
	}
	#topImgDiv>img{
		width: 100%; height: 100%;
 		object-fit: fill;
	}
	
	body{
		font-family: 'MICEGothic Bold';
	}
	
	@font-face {
    font-family: 'MICEGothic Bold';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2206-01@1.0/MICEGothic Bold.woff2') format('woff2');
    font-weight: 700;
    font-style: normal;
	}
</style>
</head>
<body>
	<c:set value="${ pageContext.servletContext.contextPath }" var="contextPath" scope="application"/>
	<nav class="navbar navbar-expand" style="background-color: #fbd14b;">
		<div class="container-fluid" id="topDiv">
			<a class="navbar-brand" href="${contextPath}">
				<img src="${ contextPath }/resources/img/logo.png" alt="Logo" width="50" height="40" class="d-inline-block align-text-top">
				&nbsp;HELP FOR US
			</a>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#collapsibleNavbar">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse justify-content-end"
				id="collapsibleNavbar">
				<ul class="navbar-nav">
				
					<c:if test="${ loginUser == null }">
						<li class="nav-item"><a class="nav-link" href="${contextPath}/loginView.me">로그인</a></li>
						<li class="nav-item"><a class="nav-link" href="${contextPath}/enrollButton.me">회원가입</a></li>
					</c:if>
					
					<c:if test="${ loginUser.memberRight == 'B' || loginUser.memberRight == 'C' || loginUser.memberRight == 'D'}">
						<li class="nav-item"><a class="nav-link" href="${contextPath}/myInfo.me">내 정보</a></li>
						<li class="nav-item"><a class="nav-link" href="${contextPath}/logout.me">로그아웃</a></li>
					</c:if>
					
					<c:if test="${ loginUser.memberRight == 'A' }">
						<li class="nav-item"><a class="nav-link" href="${contextPath}/admin.me">관리자 페이지</a></li>
						<li class="nav-item"><a class="nav-link" href="${contextPath}/logout.me">로그아웃</a></li>
					</c:if>
					
				</ul>
			</div>
		</div>
	</nav>
	<div id="topImgDiv">
		<img src="${ contextPath }/resources/img/topImg.jpg" alt="img">
	</div>
</body>
</html>