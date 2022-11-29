<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

	<!-- Font Awesome -->
	<link
	  href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css"
	  rel="stylesheet"
	/>
	<!-- Google Fonts -->
	<link
	  href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700&display=swap"
	  rel="stylesheet"
	/>
	<!-- MDB -->
	<link
	  href="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/5.0.0/mdb.min.css"
	  rel="stylesheet"
	/>
	
	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap" rel="stylesheet">
	<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
	
	<style>
		*{font-family: 'MICEGothic Bold';}
		@font-face {
	    font-family: 'MICEGothic Bold';
	    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2206-01@1.0/MICEGothic Bold.woff2') format('woff2');
	    font-weight: 700;
	    font-style: normal;
		}
	
		hr{
			width: 50%; margin-left: auto; margin-right: auto;
		}
		.btn-space{
			margin-right: 300px;
		}
		
		table{border: 4px solid lightgray;}
		
		th, td{
			width: 15%;
			text-align: center;
			font-size: 20px;
		}
		
		#map{
			margin: auto;
			width: 450px;
			height: 300px;
			border: 1px solid black;
		}

	</style>
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/top.jsp"/>
	<jsp:include page="/WEB-INF/views/common/nav.jsp"/>
	
	<br><br>
	
	<div class="mx-auto" style="width: 500px;">
		<table class="table table-sm table-bordered">
			<tr align="center">
				<th align="center">${ b.boardTitle }</th>
			</tr>
		</table>
	</div>
	<br><br>
	
	<div style="border: 5px solid lightgray; width:60%" class="mx-auto">
		<br><br>
		
		<div class="mx-auto" style="height: 40%; width: 50%">
			<div style="border: 1px solid black; padding: 50px;">
			${ b.boardContent }
			</div>
		</div>
		<br><br>
			
		</div>
		<br><br>
		
		<div class="text-center">
			<button onclick="location.href='${contextPath}/notBoardList.no'" class="btn btn-lg btn-space mb-0 text-white" style="background-color: orange">목록</button>
			<c:if test="${ loginUser != null}">
				<c:if test="${ loginUser.memberRight == 'A'}">
					<button id="deleteButton" class="btn btn-lg text-white" style="background-color: orange;">삭제</button>
					<button onclick="location.href='${contextPath}/updateNotBoardView.no?bId=${ b.boardId }'" class="btn btn-lg text-white" style="background-color: green;">수정</button>
				</c:if>
			</c:if>
		</div>
		<br>

	
	
	<br><br><br>
	<br><br><br>
	
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=17211e215fd1702049160ddd7221beba&libraries=services"></script>
	<script>
		window.onload = () => {
			
			if(document.getElementById('deleteButton') != null){
				document.getElementById('deleteButton').addEventListener('click', () => {
					if(confirm('게시글을 삭제하면 다시 되돌릴 수 없습니다, 정말 삭제 하시겠습니까?')){
						location.href="${contextPath}/deleteNotBoard.no?bId=${ b.boardId }" 	
					}
				});
			}
		}
	</script>
</body>
	
</html>