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
		<form action="${contextPath}" method="POST">
			<h1 class="h3 mb-3 fw-normal">Login</h1>

			<div class="form-floating">
				<input type="text" class="form-control" id="id" name="id">
				<label for="id">ID</label>
			</div>
			
			<div class="form-floating">
				<input type="password" class="form-control" id="pwd" name="pwd">
				<label for="pwd">Password</label>
			</div>

			<button class="btn btn-primary" type="submit"
			style="--bs-btn-padding-y: .25rem; --bs-btn-padding-x: 1rem; --bs-btn-font-size: 1.1rem;"
			>Login</button>
			
			<button class="btn btn-primary" type="button" onclick="location.href='${contextPath}'" 
			style="--bs-btn-padding-y: .25rem; --bs-btn-padding-x: 1rem; --bs-btn-font-size: 1.1rem;"
			>Cancel</button>
		</form>
	</main>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
</body>
</html>