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
		*{font-family: 'Nanum Gothic', sans-serif;}
	
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
	
	<div class="mx-auto m-3">
		<button onclick="location.href='volBoardList.vo'" class="btn btn-lg btn-space mb-0 text-white" style="background-color: orange">목록</button>
		<c:if test="${ loginUser != null }">
			<button onclick="#" class="btn btn-lg mb-0 text-white" style="background-color: skyblue"
			<c:if test="${ vBoard.refMemberUsername == loginUser.memberUsername }">
					disabled
			</c:if>
			>문의</button>
			<c:if test="${ cheer == null }">
				<button onclick="location.href='${contextPath}/cheerBoard.vo?boardId=${ vBoard.boardId }'" class="btn btn-lg mb-0 text-white" style="background-color: gray"
				<c:if test="${ vBoard.refMemberUsername == loginUser.memberUsername }">
					disabled
				</c:if>
				>응원하기</button>
			</c:if>
			<c:if test="${ cheer != null }">
				<button onclick="location.href='${contextPath}/cheerCancle.vo?boardId=${ vBoard.boardId }'" class="btn btn-lg mb-0 text-white" style="background-color: gray">응원취소</button>
			</c:if>
		</c:if>
		<c:if test="${ loginUser == null && vBoard.refMemberUsername == loginUser.memberUsername }">
			<button class="btn btn-lg mb-0 text-white" style="background-color: skyblue" disabled>문의</button>
			<button class="btn btn-lg mb-0 text-white" style="background-color: gray" disabled>응원하기</button>
		</c:if>
	</div>
	
	<div class="mx-auto" style="width: 750px">
		<table class="table table-sm table-bordered">
			<tr align="center">
				<th style="width: 2%">
				<c:if test="${ vBoard.volunteerGoalPeople > vBoard.volunteerCurrentPeople }">
					모집중
				</c:if>
				<c:if test="${ vBoard.volunteerGoalPeople <= vBoard.volunteerCurrentPeople }">
					모집마감
				</c:if>
				</th>
				<th align="center">${ vBoard.boardTitle }</th>
			</tr>
		</table>
	</div>
	
	<div style="border: 5px solid lightgray; width:60%" class="mx-auto">
		<br>
		<div class="mx-auto" style="width: 750px">
			<table class="table table-sm table-bordered">
				<tr>
					<th class="table-active">봉사 날짜</th>
					<td>${ vBoard.volunteerDate }</td>
					<th class="table-active">봉사 장소</th>
					<td>${ vBoard.volunteerLocation }</td>
				</tr>
				<tr>
					<th class="table-active">모집기간</th>
					<td>${ vBoard.boardDeadline } 까지</td>
					<th class="table-active">봉사대상</th>
					<td>${ vBoard.categoryName }</td>
				</tr>
				<tr>
					<th class="table-active">모집인원</th>
					<td>${ vBoard.volunteerGoalPeople }</td>
					<th class="table-active">신청인원</th>
					<td>${ vBoard.volunteerCurrentPeople }</td>
				</tr>
				<tr>
					<th class="table-active">담당자</th>
					<td>${ vBoard.managerName }</td>
					<th class="table-active">연락처</th>
					<td>${ vBoard.managerPhone }</td>
				</tr>
			</table>
		</div>
		
		<br><br>
		
		<div class="mx-auto" style="height: 20%; text-align: center">
			<c:forEach items="${ aList }" var="a">
				<img style="margin: auto" src="resources/uploadFiles/${ a.renameName }">
			</c:forEach>
		</div>
		
		<br><br><br>
		
		<div class="mx-auto" style="height: 40%; width: 50%">
			${ vBoard.boardContent }
		</div>
		<br><br>
		
		<div id="map">
			지도가 들어갈 공간
		</div>
		<br><br>
		
		<div class="text-center">
			<c:if test="${ loginUser != null }">
				<c:if test="${ vBoard.refMemberUsername != loginUser.memberUsername }">
					<button onclick="#" class="btn btn-lg text-white" style="background-color: orange">봉사 신청</button>
				</c:if>
				<c:if test="${ vBoard.refMemberUsername == loginUser.memberUsername }">
					<button onclick="location.href='${contextPath}/deleteVolBoard.vo?bId=${ vBoard.boardId }'" class="btn btn-lg text-white" style="background-color: orange;">삭제</button>
					<button onclick="location.href='${contextPath}/updateVolBoardView.vo?bId=${ vBoard.boardId }'" class="btn btn-lg text-white" style="background-color: green;">수정</button>
				</c:if>
			</c:if>
			<c:if test="${ loginUser == null }">
				<button onclick="#" class="btn btn-lg text-white" style="background-color: orange">봉사 신청</button>
			</c:if>
		</div>
		<br>
	</div>
	
	
	<br><br><br>
	<br><br><br>
	
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
	
	<script>
	</script>
</body>
	
</html>