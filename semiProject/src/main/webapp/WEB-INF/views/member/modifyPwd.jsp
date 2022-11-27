<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
<style>
	html, body {height: 100%;}
	body{display: flex; align-items: center; padding-top: 40px; padding-bottom: 40px;}
	.form-signin {max-width: 300px; padding: 15px;}
	.form-floating{padding-bottom:10px;}
</style>
</head>
<body class="text-center">
<c:set value="${ pageContext.servletContext.contextPath }" var="contextPath" scope="application"/>

	<main class="form-signin w-100 m-auto">
		<form action="${contextPath}/modifyPwd.me" method='post' id="form" onsubmit="return false;">
			<h1 class="h3 mb-3 fw-normal">비밀번호 수정, 아이디는 안알랴줌</h1>

			<div class="form-floating">
				<input type="password" class="form-control" id="pwd1" name="pwd1">
				<label for="pwd1">비밀번호</label>
			</div>
			
			<div class="form-floating">
				<input type="password" class="form-control" id="pwd2" name="pwd2">
				<label for="pwd2">비밀번호 확인</label>
			</div>
			
			<input type="hidden" name="email" value="${email}" >

			<button class="btn btn-primary" type="submit" onclick="checkPwd();"
			style="--bs-btn-padding-y: .25rem; --bs-btn-padding-x: 1rem; --bs-btn-font-size: 1.1rem;"
			>비밀번호 수정</button>
			
			<button class="btn btn-primary" type="button" onclick="location.href='${contextPath}'" 
			style="--bs-btn-padding-y: .25rem; --bs-btn-padding-x: 1rem; --bs-btn-font-size: 1.1rem;"
			>Cancel</button>
			
			<br><br>
			
		</form>
		
	</main>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
	<script>
		
		const checkPwd = () =>{
			const form = document.getElementById('form');
			const pwd1 = $('#pwd1').val();
			const pwd2 = $('#pwd2').val();
		
			if(pwd1 != pwd2){
				swal('비밀번호가 일치하지 않습니다.');
				return false;
			} else if(pwd1.trim()=='' || pwd2.trim()==''){
				swal('비밀번호가 공백입니다.');
				return false;
			} else{
				form.submit();
			}
		}	
		
	</script>




</body>
</html>