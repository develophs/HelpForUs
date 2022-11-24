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
</style>
</head>
<body>
	<jsp:include page="../common/top.jsp"/>
	
	
	<div class="container text-center">
		<h3 class='mypage'>단체 정보 페이지</h3>
		
		<br>
		
		<div class="row">
    		<div class="col-2 border border-dark border-2">
   				
   				<p class="category">단체 정보</p>
   				<ul type="circle">
   					<li><p class="menu" onclick="location.href='${contextPath}/myInfo.me'">단체 정보 확인 / 수정</p></li>
   				</ul>
   				<p class="category"></p>
   				
   				
   				<p class="category">봉사 모집 현황</p>
	   			<ul type="circle">
	   				<li><p class="menu" onclick="location.href='${contextPath}/volList.me'">진행중인 모집 현황</p></li>
	   				<li><p class="menu" onclick="location.href='${contextPath}/endVolList.me'">봉사모집 마감 현황</p></li>
				</ul>
					
				<p class="category">모금 현황</p>
	   			<ul type="circle">
		   			<li><p class="menu" onclick="location.href='${contextPath}/donList.me'">진행중인 모금 현황</p></li>
		   			<li><p class="menu" onclick="location.href='${contextPath}/endDonList.me'">모금 마감 현황</p></li>
				</ul>
				
				<p class="category">쪽지함<img id="msgBox" src='https://cdn-icons-png.flaticon.com/512/6188/6188613.png' style='display: none;'></p>
   				<ul type="circle">
	   				<li><p class="menu" onclick="location.href='${contextPath}/message.me'">쪽지함</p></li>
				</ul>
				
				<p class="category">단체 서류 제출</p>
	   			<ul type="circle">
		   			<li><p class="menu" onclick="location.href='${contextPath}/certificateView.me'">서류 제출함</p></li>
				</ul>
   			
   			</div>
   			
   			
   			
   			<%--공백생성 --%>
   			<div class="col-1">
   			</div>
   			<%--공백생성 --%>
   			
   			<div class="col-9 border border-dark border-2">
   				<h4 style="padding:10px;">마감된 봉사활동</h4>
   				
					<table class="table table-hover">
					
					  <thead>
					    <tr>
					      <th scope="col">글 제목</th>
					      <th scope="col">마감 일</th>
					      <th scope="col">신청자</th>
					    </tr>
					  </thead>
					  
					  <tbody class="table-group-divider" >
					  
						  <c:if test="${list != null}">
							  <c:forEach items="${list}" var="v"> 
							    <tr>
							      <td>${v.boardTitle}</td>
							      <td>${v.boardDeadline}</td>
							      <td><button >신청자 보기</button></td>
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
				
   			<div style="padding-top: 50px;"></div>
   		</div>
		<div style="height: 100px;"></div>
  	</div>
</div>

	<jsp:include page="../common/footer.jsp"/>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
	<script type="text/javascript">
		document.getElementById('nullList').innerText ='${message}';
	</script>
	
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