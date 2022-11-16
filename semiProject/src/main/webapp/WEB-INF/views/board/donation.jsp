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
		<h1>장미 보내기</h1>
		<hr>
		<p>보유 장미 : 4000 송이</p>
		<div class="mb-3">
			<input type="number" min="0"> <label>송이</label>
		</div>
		<div class="mb-3">
			<textarea class="form-control" id="inquiryContent" placeholder="응원의 한마디" rows="3" style="resize: none"></textarea>
		</div>
		<br>
		<button type="button" class="btn btn-primary">기부하기</button>
		<button type="button" class="btn btn-danger">취소</button>
	</div>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
</body>
</html>