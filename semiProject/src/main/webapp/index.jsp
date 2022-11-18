<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HELP FOR US</title>
<style>
	#mainDiv{
		margin-top: 100px; 
	}
	#countDiv>div{
		border: 1px solid black; width: 300px; height: 400px;
		margin: 80px; padding: 20px;
	}
	.countTitle{
		font-size: 30px;
	}
	.count{
		font-size: 20px;
	}
	#cardImg{
		height: 200px;
	}
	.card *:hover{
		cursor: pointer;
	}
</style>
</head>
<body>
	<jsp:include page="WEB-INF/views/common/top.jsp"></jsp:include>
	<jsp:include page="WEB-INF/views/common/nav.jsp"></jsp:include>
	
	<div class="container" id="mainDiv">
		<div class="row">
			<div class="col-8">
				<h3>공지 사항</h3>
				
				<br>
				
				<table class="table">
					<thead class="table-light">
						<tr>
							<th scope="col" width="150px">#</th>
							<th scope="col">제목</th>
							<th scope="col" width="200px">작성일</th>
							<th scope="col" width="100px">조회수</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach begin="1" end="4">
						<tr>
							<td>공지</td>
							<td>제목입니다</td>
							<td>2022-11-11</td>
							<td>99</td>
						</tr>
						</c:forEach>
					</tbody>
				</table>
				
				<br><br>
				
				<h3>최신 글</h3>
				
				<br>
				
				<c:forEach begin="1" end="4">
				<div class="card mb-3" style="max-width: 100%; height: 200px;">
					<div class="row g-0">
						<div class="col-md-4">
							<img src="resources/img/peoples.png" class="img-fluid rounded-start" alt="..." id="cardImg">
						</div>
						<div class="col-md-8">
							<div class="card-body">
								<h5 class="card-title">제목</h5>
								<p class="card-text">This is a wider card with supporting
									text below as a natural lead-in to additional content. This
									content is a little bit longer.</p>
								<p class="card-text">
									<small class="text-muted">2022-11-11</small>
								</p>
							</div>
						</div>
					</div>
				</div>
				</c:forEach>
			</div>
			<div class="col-4" id="countDiv">
				<div class="container text-center" id="donationDiv">
					<img src="resources/img/rose.png" width="200px;" height="200px;">
					<br><br>
					<strong class="countTitle">오늘 모아진 장미</strong>
					<br><br>
					<p class="count">3,506 송이</p>
				</div>
				<div class="container text-center" id="volunteerCountDiv">
					<img src="resources/img/peoples.png" width="200px;" height="200px;">
					<br><br>
					<strong class="countTitle">모집중인 봉사활동</strong>
					<br><br>
					<p class="count">509 건</p>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="WEB-INF/views/common/footer.jsp"/>
</body>
</html>