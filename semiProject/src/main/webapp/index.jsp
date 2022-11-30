<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HELP FOR US</title>
<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
<style>
	#mainDiv{
		margin-top: 100px; 
		font-family: 'MICEGothic Bold';
	}
	#countDiv>div{
		border: 1px solid black; width: 330px; height: 400px;
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
	#moreNot{
		text-decoration: none; color: black;
	}
	
	@font-face {
    font-family: 'MICEGothic Bold';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2206-01@1.0/MICEGothic Bold.woff2') format('woff2');
    font-weight: 700;
    font-style: normal;
	}
</style>
</head>
<body>
	<jsp:include page="WEB-INF/views/common/top.jsp"></jsp:include>
	<jsp:include page="WEB-INF/views/common/nav.jsp"></jsp:include>
	
	<div class="container" id="mainDiv">
		<div class="row">
			<div class="col-8 left">
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
						<c:forEach begin="1" end="5">
							<tr class="nots">
								<td>공지</td>
								<td class="notTitle"></td>
								<td class="notDate"></td>
								<td class="notCount"></td>
							</tr>
						</c:forEach>
						<tr align="right">
							<td colspan="4" align="right"><a href="${ contextPath }/notBoardList.no" id="moreNot">...더보기</a></td>
						</tr>
					</tbody>
				</table>
				
				<br><br>
				
				<h3>최신 글</h3>
				
				<br>
				
				<c:forEach begin="1" end="5">
					<div class="card mb-3 cards" style="max-width: 100%; height: 200px;">
						<div class="row g-0">
							<div class="col-md-4">
								<img src="resources/img/peoples.png" class="img-fluid rounded-start img" alt="..." id="cardImg">
							</div>
							<div class="col-md-8">
								<div class="card-body">
									<h5 class="card-title title"></h5>
									<p class="card-text content"></p>
									<p class="card-text">
										<small class="text-muted date"></small>
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
					<p class="count"></p>
				</div>
				<div class="container text-center" id="volunteerCountDiv">
					<img src="resources/img/peoples.png" width="200px;" height="200px;">
					<br><br>
					<strong class="countTitle">오늘 신청한 봉사자</strong>
					<br><br>
					<p class="count"></p>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="WEB-INF/views/common/footer.jsp"/>
	<script>
		window.onload = () => {
			$.ajax({
				url: '${ contextPath }/count.co',
				success: (data) => {
					const counts = document.getElementsByClassName('count');
					counts[0].innerText = data[0] + '송이';
					counts[1].innerText = data[1] + '명';
				},
				error: (data) => {
					console.log(data);
				}
			});
			
			$.ajax({
				url: '${ contextPath }/latestBoard.co',
				success: (data) => {
					const cards = document.getElementsByClassName('cards');
					const title = document.getElementsByClassName('title');
					const content = document.getElementsByClassName('content');
					const date = document.getElementsByClassName('date');
					const img = document.getElementsByClassName('img');
					
					for(const i in data.bList){
						for(const a of data.aList){
							if(data.bList[i].boardId == a.boardId){
								img[i].src = 'resources/uploadFiles/' + a.renameName;
							}
						}
						title[i].innerText = data.bList[i].boardTitle;
						content[i].innerText = data.bList[i].boardContent.substring(0, 20);
						date[i].innerText = data.bList[i].boardCreateDate;
						
						cards[i].addEventListener('click', () => {
							console.log(data.bList[i].boardType);
							switch(data.bList[i].boardType){
							case 'Vol': case 'volRev':
								location.href='${contextPath}/volBoardDetail.vo?bId=' + data.bList[i].boardId + '&userName=' + data.bList[i].refMemberUsername;
								break;
							case 'Don': case 'donRev':
								location.href='${contextPath}/selectDonBoard.do?bId=' + data.bList[i].boardId + '&userName=' + data.bList[i].refMemberUsername;
								break;
							}
						});
					}

				},
				error: (data) => {
					console.log(data);
				}
			});
			
			$.ajax({
				url: '${ contextPath }/selectNot.co',
				success: (data) => {
					const nots = document.getElementsByClassName('nots');
					const title = document.getElementsByClassName('notTitle');
					const date = document.getElementsByClassName('notDate');
					const count = document.getElementsByClassName('notCount');
					
					for(const i in data){
						const hidden = nots[i].querySelectorAll('input[type="hidden"]');
						
						title[i].innerText = data[i].boardTitle;
						date[i].innerText = data[i].boardModifyDate;
						count[i].innerText = data[i].boardCount;
						
						nots[i].addEventListener('mouseover', () => {
							nots[i].style.background = 'lightgray';
							nots[i].style.cursor = 'pointer';
						});
						
						nots[i].addEventListener('mouseout', () => {
							nots[i].style.background = 'white';
						});
						
						nots[i].addEventListener('click', () => {
							location.href='${contextPath}/notBoardDetail.no?bId=' + data[i].boardId + '&userName=' + data[i].refMemberUsername;
						});
					}
				},
				erro: (data) => {
					console.log(data);
				}
			});
		}
	</script>
</body>
</html>