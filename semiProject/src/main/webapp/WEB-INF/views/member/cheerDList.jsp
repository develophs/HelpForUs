<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>마이페이지</title>
<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<style>
	.mypage{padding-top:15px; text-align:left; font-weight:bold;}
	.category{font-weight:bold; text-align:left; font-size:22px; padding-top:5px;}
	.menu{text-align:left; font-size:13px; margin:1px;}
	.menu:hover{font-weight:bold; cursor:pointer; text-decoration:underline;}
	.seletedCategory{font-weight:bold; text-align:center; font-size:22px; padding-top:5px;}
	.row{height:700px;}
	.title{font-weight:bold; text-align:left; font-size:22px; padding:30px;}
</style>
</head>
<body>
	<jsp:include page="../common/top.jsp"/>
	
	
	<div class="container text-center">
		<c:if test="${loginUser.memberRight =='B'}">
			<h3 class='mypage'>My Page</h3>
		</c:if>
		
		<br>
		
		<div class="row">
    		<div class="col-2 border border-dark border-2">
   				
   				<p class="category">내 정보</p>
   				<ul type="circle">
   					<li><p class="menu" onclick="location.href='${contextPath}/myInfo.me'">내 정보 확인</p></li>
   					<li><p class="menu" onclick="location.href='${contextPath}/rose.me'">장미 내역</p></li>
   				</ul>
   				<p class="category"></p>
   				
   				
   				<p class="category">기부 현황</p>
   				<ul type="circle">
   					<li><p class="menu" onclick="location.href='${contextPath}/donBoard.me'">기부 내역</p></li>
   					<li><p class="menu" onclick="location.href='${contextPath}/cheerDBoard.me'">응원한 모금 게시글</p></li>
   				</ul>
   				
   				
   				<p class="category">봉사 활동 현황</p>
   				<ul type="circle">
	   				<li><p class="menu" onclick="location.href='${contextPath}/volBoard.me'">신청한 봉사활동</p></li>
   					<li><p class="menu" onclick="location.href='${contextPath}/cheerVBoard.me'">응원한 봉사활동</p></li>
				</ul>
				
				<p class="category">쪽지함<img id="msgBox" src='https://cdn-icons-png.flaticon.com/512/6188/6188613.png' style='display: none;'></p>
   				<ul type="circle">
	   				<li><p class="menu" onclick="location.href='${contextPath}/message.me'">쪽지함</p></li>
				</ul>
   			
   			</div>
   			
   			<%--공백생성 --%>
   			<div class="col-1">
   			</div>
   			<%--공백생성 --%>
   			
   			<div class="col-9 border border-dark border-2">
   				<h3 class="title">응원한 기부 활동</h3>
   				
   				<div class="w-60 jstify-content-center">
   					<table class="table table-hover" style="padding: 10px;">
	   					<thead>
		   					<tr class="table-active align-middle">
		   						<th>글번호</th>
		   						<th>단체명</th>
		   						<th>제목</th>
		   						<th>마감일</th>
		   					</tr>
		   				<thead>	
		   				
		   				<tbody class="table-group-divider" >
					  	 <c:if test="${cDList != null}">
							  <c:forEach items="${cDList}" var="list"> 
							    <tr>
							      <td>${list.board.boardId}</td>
							      <td>${list.member.memberNickname}</td>
							      <td>${list.board.boardTitle}</td>
							      <td>${list.board.boardDeadline}</td>
							    </tr>
							  </c:forEach>
						  </c:if>
						  
						  <c:if test="${message != null}">
							  <tr>
							  	<td colspan="3" id="nullList"></td>
							  </tr>
						  </c:if> 
					    
					  </tbody>
     			</table>
   			</div>
   				
     			<ul class="pagination" style="justify-content: center;">
					<c:if test="${ pi.currentPage > 1 }">
					<li class="page-item"><c:url var="goBack" value="${ loc }">
							<c:param name="page" value="${ pi.currentPage-1 }"></c:param>
						</c:url> <a class="page-link" href="${ goBack }" aria-label="Previous">
							<span aria-hidden="true">&laquo;</span>
					</a></li>
					</c:if>
					<c:forEach begin="${ pi.startPage }" end="${ pi.endPage }" var="p">
						<c:url var="goNum" value="${ loc }">
							<c:param name="page" value="${ p }"></c:param>
						</c:url>
						<li class="page-item"><a class="page-link" href="${ goNum }">${ p }</a></li>
					</c:forEach>
					<c:if test="${ pi.currentPage < pi.maxPage }">
					<li class="page-item"><c:url var="goNext" value="${ loc }">
							<c:param name="page" value="${ pi.currentPage+1 }"></c:param>
						</c:url> <a class="page-link" href="${ goNext }" aria-label="Next"> <span
							aria-hidden="true">&raquo;</span>
					</a></li>
					</c:if>
				</ul>
   			</div>
  		</div>
	</div>
	
	<br><br><br>

	<script type="text/javascript">
		document.getElementById('nullList').innerText ='${message}';
	</script>

	<jsp:include page="../common/footer.jsp"/>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
	<script>
	
	window.onload=()=>{

		setInterval(
			function alarm() {
				$.ajax({
					url: '${ contextPath }/msgAlarm.me',
					success: (data) => {
						if(data>0){
							document.getElementById('msgBox').style="width: 40px; height:30px; padding-left: 10px;"
						}
						
					},
					error: (data) => {
						console.log(data);
					}
				});
		 },1000);
		
		
	}
	</script>
</body>
</html>