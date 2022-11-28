<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<style>
	html, body {height: 100%;}
	body{display: flex; align-items: center; padding-top: 40px; padding-bottom: 40px;}
	.form-signin {max-width: 300px; padding: 15px;}
	.form-floating{padding-bottom:10px;}
</style>
</head>
<body class="text-center">
	<main class="form-signin w-100 m-auto">
		<form action="${contextPath}/enrollView.me" method="POST">

			<div class="form-floating">
				<button class="btn btn-primary btn-primary btn-lg" type="submit" name='right' value='B'>일반 회원</button>
			</div>
			
			<div class="form-floating">
				<button class="btn btn-primary btn-primary btn-lg" type="submit" name='right' value='D'>봉사 단체</button>
			</div>
		</form>
	</main>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
</body>
</html>