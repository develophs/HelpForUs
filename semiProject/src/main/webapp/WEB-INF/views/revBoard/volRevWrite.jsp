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
	<form action="${ contextPath }/writeVolBoard.vo" method="POST" enctype="multipart/form-data" id="RevForm">
		<h2>봉사 후기</h2>
		<br>
		
		<table class="table table-sm table-bordered" style="table-layout: fixed;">
				<tr>
					<th class="table-active">제목 :</th>
					<td><input  id="title" type="text" class="text1" name="boardTitle" style=" width:100%" value="${v.boardTitle }"></td>
					<th class="table-active">봉사 날짜 :</th>
					<td><input id="voldate" type="Date" name="volunteerDate" class="text1" style=" width:100%" value="${v.volunteerDate}" readonly></td>
				</tr>
				
				<tr>
					<th class="table-active">이름 :</th>
					<td><input type="text" id="nickname" name="refMemberUsername" class="text1"style=" width:100%" value="${v.memberNickname}" readonly>
					
					<th class="table-active">봉사대상 :</th>
					<td><input value="${ v.categoryName}" readonly></td>
					<c:choose>
						<c:when test="${v.categoryName eq '아동'}">
    					<input name="refCategoryId" value="1" type="hidden">
    					</c:when>
						<c:when test="${v.categoryName eq '동물'}">
							<input name="refCategoryId" value="2" type="hidden">
	    				</c:when>
						<c:when test="${v.categoryName eq '노인'}">
							<input name="refCategoryId" value="3" type="hidden">
	    				</c:when>
						<c:when test="${v.categoryName eq '여성'}">
							<input name="refCategoryId" value="4" type="hidden">
	    				</c:when>
						<c:when test="${v.categoryName eq '환경'}">
							<input name="refCategoryId" value="5" type="hidden">
	    				</c:when>
						<c:when test="${v.categoryName eq '장애인'}">
							<input name="refCategoryId" value="6" type="hidden">
    					</c:when>
					</c:choose>
					
				
				<tr>
					<th class="table-active">봉사장소 :</th>
					<td colspan="1"><input type="text" name="volunteerLocation" id="vollocation" class="text1" style="width:100%"  value="${v.volunteerLocation }" readonly></td>
					<th class="table-active">마감일 :</th>
					<td><input name="boardDeadline" value="${v.boardDeadline }" readonly></td>
				</tr>
				<tr>
					<th class="table-active">담당자</th>
					<td><input type="text" class="text1" name="managerName" required value="${v.managerName}" ></td>
					<th class="table-active">연락처</th>
					<td><input type="text" class="text1" name="managerPhone" required value="${v.managerPhone}"></td>
				</tr>
		
				
				<tr>
					<th class="table-active" id="filearea">이미지</th>
					<td colspan="3"><input type="file" name="file" id="filearea" multiple></td>	
				</tr>
				
				<tr>
					<th class="table-active">내용</th>
					<td colspan="3"><textarea rows="20px;" name="boardContent" cols="120px;" placeholder="내용을 입력해주세요 "></textarea></td>
			</table>
			
			
			<br><br>
			
			
			
			
			<br><br>
			<input type="hidden" name="boardType" value="volRev">
			<button type="submit" id="submitButton" class="btn btn-primary"  >글 작성하기</button>
		</form>	
	</div>
	
	
	
	
	
	<jsp:include page="../common/footer.jsp"></jsp:include>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
</body>
</html>