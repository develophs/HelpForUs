<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">

</head>
<body>
	<div class="container text-center" style="width: 300px; height: 400px; padding-top: 50px;">
		<h1>문의</h1>
		<hr>
		<div class="mb-3">
			<label for="inquiryTitle" class="form-label">제목</label>
			<input type="text" id="inquiryTitle" class="form-control" >
		</div>
		<div class="mb-3">
			<label for="inquiryContent" class="form-label">내용</label>
			<textarea class="form-control" id="inquiryContent" rows="3" style="resize: none"></textarea>
		</div>
		<br>
		<button type="button" class="btn btn-primary">문의하기</button>
		<button type="button" class="btn btn-danger">취소</button>
	</div>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
</body>
</html>