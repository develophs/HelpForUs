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
		border: 1px solid lightgray;
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
	<jsp:include page="top.jsp"></jsp:include>
	<jsp:include page="nav.jsp"></jsp:include>

	<div class="container text-center" id="writeDiv"  >
		<h2>봉사 활동 후기 글쓰기</h2>
		<hr>
		<table class="table table-sm table-bordered" style="table-layout: fixed;">
				<tr>
					<th class="table-active">일시 및 장소</th>
					<td><input type="text" class="text1"  style=" width:100%"></td>
					<th class="table-active">활동자</th>
					<td><input type="text" class="text1" style=" width:100%"></td>
				</tr>
				<tr>
					<th class="table-active">참석자</th>
					<td><input type="text" class="text1"style=" width:100%">
					
					<th class="table-active">봉사대상</th>
					<td><input type="text" class="text1" style=" width:100%"></tr>
				<tr>
					<th class="table-active">활동목적</th>
					<td><input  type="text" style="width:100%"></td>
					<th class="table-active">신청인원</th>
					<td><select style="width:80%">
					<option>1</option>
					<option>2</option>
					<option>3</option>
					<option>4</option>
					<option>5</option>
					<option>6</option>
					<option>7</option>
					</select></td>
				</tr>
				<tr>
					<th class="table-active">담당자</th>
					<td><input type="text" class="text1" ></td>
					<th class="table-active">연락처</th>
					<td><input type="text" class="text1" ></td>
				</tr>
				<tr>
					<th class="table-active">봉사장소</th>
					<td colspan="3"><input type="text" class="text1" style="width:100%"></td>
					
				</tr>
				<tr>
					<th class="table-active">이미지</th>
					<td colspan="3"><input type="file"></td>
					
				</tr>
				<tr>
					<th class="table-active">내용</th>
					<td colspan="3"><textarea rows="20px;" cols="120px;"></textarea></td>
				
			</table>
			
			
			<br><br>
			
			
			
			
			<br><br>
			
			<button type="button" class="btn btn-primary">모집하기</button>
			
	</div>

	<jsp:include page="footer.jsp"></jsp:include>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
</body>
</html>