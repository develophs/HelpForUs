<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>      
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>관리자 페이지</title>
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
		<h3 class='mypage'>관리자 페이지</h3>
		
		<br>
		
		<div class="row">
    		<div class="col-2 border border-dark border-2">
   				
   				<p class="category">게시물 관리</p>
   				<ul type="circle">
   					<li><p class="menu" onclick="location.href='${contextPath}/allDList.me'">모금 게시글</p></li>
   					<li><p class="menu" onclick="location.href='${contextPath}/allVList.me'">봉사 게시글</p></li>
   				</ul>
   				
   				<p class="category">후기 관리</p>
   				<ul type="circle">
   					<li><p class="menu" onclick="location.href='${contextPath}/allDRevList.me'">모금 후기</p></li>
   					<li><p class="menu" onclick="location.href='${contextPath}/allVRevList.me'">봉사 후기</p></li>
   				</ul>
   				
   				<p class="category">댓글 관리</p>
   				<ul type="circle">
   					<li><p class="menu" onclick="location.href='${contextPath}/allRepList.me?boardType=Don'">모금 댓글</p></li>
   					<li><p class="menu" onclick="location.href='${contextPath}/allRepList.me?boardType=Vol'">봉사 댓글</p></li>
   					<li><p class="menu" onclick="location.href='${contextPath}/allRRepList.me'">후기 댓글</p></li>
   				</ul>
   				
   				<p class="category">회원 관리</p>
   				<ul type="circle">
   					<li><p class="menu" onclick="location.href='${contextPath}/memberList.me'">회원 목록</p></li>
   				</ul>
   				
   				<p class="category">단체 관리</p>
   				<ul type="circle">
	   				<li><p class="menu" onclick="location.href='${contextPath}/groupList.me'">단체 목록</p></li>
	   				<li><p class="menu" onclick="location.href='${contextPath}/groupCertificate.me'">단체 증명서 확인창</p></li>
				</ul>
				
   			
   			</div>
   			
   			
   			
   			<%--공백생성 --%>
   			<div class="col-1">
   			</div>
   			<%--공백생성 --%>
   			
   			<div class="col-9 border border-dark border-2">
   				<h4 style="padding:10px;">작성된 봉사 후기 게시판</h4>
   				
					<table class="table table-hover">
					
					  <thead>
					    <tr>
					      <th scope="col">Board_No</th>
					      <th scope="col">제목</th>
					      <th scope="col">작성자</th>
					      <th scope="col">작성일</th>
					    </tr>
					  </thead>
					  
					  <tbody class="table-group-divider" >
							<c:forEach items="${allDList}" var="ad"> 
							  <tr>
							    <td>${ad.boardId}</td>
							    <td>${ad.boardTitle}</td>
							    <td>${ad.memberNickname}</td>
							    <td>${ad.boardCreateDate}</td>
							   </tr>
							 </c:forEach>
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
	<script>
		const trs = document.querySelectorAll('tbody tr');
		for(const tr of trs){
			tr.addEventListener('click',function(){
				const tds = this.querySelectorAll('td');
				const boardId = tds[0].innerText;
				const writer = tds[2].innerText;
				location.href='${contextPath}/volBoardDetail.vo?bId=' + boardId + '&nickName=' + writer;
			})
		}
	</script>
</body>
</html>