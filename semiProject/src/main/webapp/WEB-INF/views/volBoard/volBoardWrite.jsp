<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<!-- Font Awesome -->
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet" />
<!-- Google Fonts -->
<link href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700&display=swap" rel="stylesheet" />
<!-- MDB -->
<link  href="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/5.0.0/mdb.min.css" rel="stylesheet" />
<style>
	*{font-family: 'Nanum Gothic', sans-serif;}
	#writeDiv{
		 margin: auto; padding: 50px; min-height: 800px;
		/* position: absolute; left:0; right:0; top:0; bottom:0; margin:auto;  */
		border: 1px solid black;
	}
	table{
		border: 4px solid lightgray;
	}
	th{
		width: 15%;
		text-align: center; 
		vertical-align: middle;
	}
	hr{
		width: 50%; margin-left: auto; margin-right: auto;
		vertical-align: middle;
	}
	#writeImgDiv, #writeMapDiv{
		border: 1px solid black; margin-top: 100px;
		min-height: 400px; width: 600px;
	}
	td{text-align:left;}
	.text1{ align:left; width:300px; height:30px;}

	
</style>
</head>
<body>
	<jsp:include page="../common/top.jsp"></jsp:include>
	<jsp:include page="../common/nav.jsp"></jsp:include>

	<div class="container text-center" id="writeDiv"  >
		<h2>봉사 활동 모집 글쓰기</h2>
		<hr>
		<form action="${contextPath}/writeVolBoard.vo" id="form" enctype="multipart/form-data" method="post">
			<table class="table table-sm table-bordered" style="table-layout: fixed;">
				<tr>
					<th class="table-active">제목</th>
					<td><input type="text" class="text1" name="boardTitle" required></td>
					<th class="table-active">봉사날짜</th>
					<td><input type="Date" class="text1" name="volunteerDate" required></td>
				</tr>
				<tr>
					<th class="table-active">모집기간</th>
					<td><input type="Date" class="text1"  min="today" name="boardDeadline" required></td>
					
	  
					  
					<th class="table-active">봉사대상</th>
					<td>
						<select name="refCategoryId">
							<option value="1">아동</option>
							<option value="2">동물</option>
							<option value="3">노인</option>
							<option value="4">여성</option>
							<option value="5">환경</option>
							<option value="6">장애인</option>
						</select>
					</td>
				</tr>
				<tr>
					<th class="table-active">모집인원</th>
					<td>
						<input type="number" min="1" class="text1" name="volunteerGoalPeople" required>
					</td>
					<th class="table-active">봉사장소</th>
					<td><input type="text" id="address" class="text1" name="volunteerLocation" readonly required></td>
				</tr>
				<tr>
					<th class="table-active">담당자</th>
					<td><input type="text" class="text1" name="managerName" required></td>
					<th class="table-active">연락처</th>
					<td><input type="text" class="text1" name="managerPhone" required></td>
				</tr>
				<tr>
					<th class="table-active">이미지</th>
					<td colspan="2" id="fileTd">
						<input type="file" class="form-control form-control-md" id="" name="file" multiple/>
					</td>
					<td></td>
				</tr>
				<tr>
					<th class="table-active">내용</th>
					<td colspan="3"><textarea rows="20px;" cols="120px;" name="boardContent" required></textarea></td>
				
			</table>
			<input type="hidden" name="boardType" value="Vol">
			
			<br><br>
			
			
			
			
			<br><br>
			
			<button class="btn btn-primary" id="submitButton">모집하기</button>
		</form>
	</div>	

	<jsp:include page="../common/footer.jsp"></jsp:include>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script>
		window.onload = () => {
			document.getElementById('address').addEventListener('click', () => {
				 new daum.Postcode({
					 oncomplete: function(data){
						 document.getElementById("address").value = data.address;
					 }
				 }).open();
			});
		}
	
 	</script>
</body>
</html>