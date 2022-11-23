<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
</head>
<body>
	<div class="container text-center" style="width: 300px; height: 400px; padding-top: 50px;">
		<h1>문의</h1>
		<hr>
		<div class="mb-3">
			<label for="inquiryTitle" class="form-label">제목</label>
			<input type="text" name="messageTitle" class="form-control input" >
		</div>
		<div class="mb-3">
			<label for="inquiryContent" class="form-label">내용</label>
			<textarea class="form-control input" name="messageContent" rows="3" style="resize: none"></textarea>
		</div>
		<input type="hidden" class="input" name="receiverUsername" value="${ writer }">
		<input type="hidden" class="input" name="refBoardId" value="${ bId }">
		<br>
		<button type="button" class="btn btn-primary" id="inquiry">문의하기</button>
		<button onclick="window.close()" type="button" class="btn btn-danger">취소</button>
	</div>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
	<script>
		window.onload = () => {
			document.getElementById('inquiry').addEventListener('click', () => {
				const input = document.getElementsByClassName('input');
				console.log(input[2].value);
				$.ajax({
					url: '${ contextPath }/inquiry.me',
					data: {messageTitle:input[0].value,
						   messageContent:input[1].value,
						   receiverUsername:input[2].value,
						   refBoardId:input[3].value},
					success: (data) => {
						window.close();
					},
					error: (data) => {
						console.log(data);
					}
				});
			});
		}
	</script>
</body>
</html>