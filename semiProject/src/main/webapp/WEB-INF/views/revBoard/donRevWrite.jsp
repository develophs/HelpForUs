<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
    
<!DOCTYPE html>				<!-- 글쓰기 페이지  -->
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
	*{font-family: 'MICEGothic Bold';}
		@font-face {
	    font-family: 'MICEGothic Bold';
	    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2206-01@1.0/MICEGothic Bold.woff2') format('woff2');
	    font-weight: 700;
	    font-style: normal;
		}
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
	<jsp:include page="../common/top.jsp"></jsp:include>
	<jsp:include page="../common/nav.jsp"></jsp:include>	

		<div class="container text-center" id="writeDiv"  >
		<h2>기부 후기</h2>
		<hr>
		<form action="${ contextPath }/insertDonBoard.do" method="POST" enctype="multipart/form-data" id="RevForm">
			<table class="table table-sm table-bordered" style="table-layout: fixed;">
				<tr>
					<th class="table-active">제목</th>
					<td><input type="text" class="text1" name="boardTitle" required value="${d.boardTitle }"></td>
					<th class="table-active">모인 장미</th>
					<td><input type="text" class="text1" name="fundraisingGoalPrice" required value="${d.fundraisingCurrentPrice}" readonly></td>
				</tr>
				<tr>
					<th class="table-active">장미 모금 마감일</th>
					<td><input type="Date" class="text1"  min="today" name="boardDeadline" required value="${d.boardDeadline}" readonly></td>
					<th class="table-active">모금 대상</th>
					<td>
					<input value="${d.categoryName}" readonly>
					<c:choose>
						<c:when test="${d.categoryName eq '아동'}">
    					<input name="refCategoryId" value="1" type="hidden">
    					</c:when>
						<c:when test="${d.categoryName eq '동물'}">
							<input name="refCategoryId" value="2" type="hidden">
	    				</c:when>
						<c:when test="${d.categoryName eq '노인'}">
							<input name="refCategoryId" value="3" type="hidden">
	    				</c:when>
						<c:when test="${d.categoryName eq '여성'}">
							<input name="refCategoryId" value="4" type="hidden">
	    				</c:when>
						<c:when test="${d.categoryName eq '환경'}">
							<input name="refCategoryId" value="5" type="hidden">
	    				</c:when>
						<c:when test="${d.categoryName eq '장애인'}">
							<input name="refCategoryId" value="6" type="hidden">
    					</c:when>
					</c:choose>
									
					</td>
				</tr>
				<tr>
					<th class="table-active">담당자</th>
					<td><input type="text" class="text1" name="managerName" required value="${d.managerName}" ></td>
					<th class="table-active">연락처</th>
					<td><input type="text" class="text1" name="managerPhone" required value="${d.managerPhone}"></td>
				</tr>
				<tr>
					<th class="table-active">이미지</th>
					<td colspan="3" id="fileTd">
						<input type="file" class="form-control form-control-md"  name="file" multiple/>
					</td>
				</tr>
				<tr>
					<th class="table-active">내용</th>
					<td colspan="3"><textarea rows="20px;" cols="120px;" name="boardContent" required></textarea></td>
				</tr>
				
			</table>
			<input type="hidden" name="boardType" value="donRev">
			
			<br><br>
			
			<button class="btn btn-primary" id="submitButton">모금 작성하기</button>
		</form>
	</div>	
	
	
	
	
	
	<jsp:include page="../common/footer.jsp"></jsp:include>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>


</body>
</html>