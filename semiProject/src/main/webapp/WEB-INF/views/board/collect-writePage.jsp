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
		/* position: absolute; left:0; right:0; top:0; bottom:0; margin:auto; */ 
		
	}
 	#table1{
		border: 4px solid lightgray; 
	}
	  /* table1>th{
		width: 15%;
		text-align: center; 
		vertical-align: middle;
	}   */
	 hr{
		width: 50%; margin-left: auto; margin-right: auto;
		vertical-align: middle;
	} 
	 #writeImgDiv, #writeMapDiv{
		border: 1px solid black; margin-top: 100px;
		min-height: 400px; width: 600px; 
	}
	
	
	#table1{border: 1px solid lightgray;}
 	th,td{text-align:center;}
 	
	
	
</style>
</head>
<body>
	<jsp:include page="top.jsp"></jsp:include>
	<jsp:include page="nav.jsp"></jsp:include>

	<div class="container text-center" id="writeDiv"  >
	<br>
	<br>
		<h2>봉사 활동 모금 글쓰기</h2>
		<hr>
		<div align="center">
		<table style="width:1035px;">
			<tr align="center">
		    		<td><a href="#"><img alt="전체" src="https://cdn-icons-png.flaticon.com/512/1598/1598191.png" width="50" height="50"></a></td>
		    		<td><a href="#"><img alt="아동" src="https://cdn-icons-png.flaticon.com/512/4540/4540679.png" width="50" height="50"></a></td>
		    		<td><a href="#"><img alt="동물" src="https://cdn-icons-png.flaticon.com/512/489/489399.png" width="50" height="50"></a></td>
		    		<td><a href="#"><img alt="노인" src="https://cdn-icons-png.flaticon.com/512/864/864481.png" width="50" height="50"></a></td>
		    		<td><a href="#"><img alt="여성" src="https://cdn-icons-png.flaticon.com/512/2585/2585340.png" width="50" height="50"></a></td>
		    		<td><a href="#"><img alt="환경" src="https://cdn-icons-png.flaticon.com/512/3904/3904971.png" width="50" height="50"></a></td>
		    		<td><a href="#"><img alt="장애인" src="https://cdn-icons-png.flaticon.com/512/1467/1467285.png" width="50" height="50"></a></td>
	    		<tr align="center">
		    		<th>전체</th>
		    		<th>아동</th>
		    		<th>동물</th>
		    		<th>노인</th>
		    		<th>여성</th>
		    		<th>환경</th>
		    		<th>장애인</th>
	    		</tr>
		</table>
		</div>
		<table class="table table-sm table-bordered" id="table1" style="table-layout: fixed;">	
				<tr>
					<th style="font-size:25pt;"><b>제목</b></th>
					<td colspan="3"><input type="text" style="width:100%; height:50px;"></td>
					
					
				<tr>
				<tr>
					<th><b>목표 모금액</b></th>
					<td><input type="number" style="width:100%;"></td>
					<th><b>모집 마감일</b></th>
					<td><input type="Date" style="width:100%;"></td>
				<tr>
				<tr>
					<th><b>담당자 이름</b></th>
					<td><input type="text" style="width:100%"></td>
					<td><b>담당자 연락처</b></td>
					<td><input type="text" style="width:100%"></td>
				<tr>
				<tr>
					<th><b>이미지</b></th>
					<td colspan="3"><input type="file"style="width:100%" ></td>
					
				<tr>
				<tr>
					
					<td colspan="4"><textarea style="height:700px; width:1000px;" placeholder="내용을 입력해주세요."></textarea></td>
					
					
				<tr>			
				
					
			</table>
			
			
		</div>
			
			<br>
			
			<button type="button" class="btn btn-primary">작성하기</button>
			
	

	<jsp:include page="footer.jsp"></jsp:include>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
</body>
</html>