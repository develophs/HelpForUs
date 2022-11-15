<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
</style>
</head>
<body>
	<jsp:include page="WEB-INF/views/common/top.jsp"></jsp:include>
	<jsp:include page="WEB-INF/views/common/nav.jsp"></jsp:include>
	
	<div class="container" id="mainDiv">
		<div class="row">
			<div class="col-8">
				<h2>공지 사항</h2>
				<table class="table">
					<thead>
						<tr>
							<th scope="col">#</th>
							<th scope="col">First</th>
							<th scope="col">Last</th>
							<th scope="col">Handle</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<th scope="row">1</th>
							<td>Mark</td>
							<td>Otto</td>
							<td>@mdo</td>
						</tr>
						<tr>
							<th scope="row">2</th>
							<td>Jacob</td>
							<td>Thornton</td>
							<td>@fat</td>
						</tr>
						<tr>
							<th scope="row">3</th>
							<td colspan="2">Larry the Bird</td>
							<td>@twitter</td>
						</tr>
					</tbody>
				</table>
			</div>
			<div class="col-4" id="countDiv">
				<div class="container text-center" id="donationDiv">
					<img src="https://cdn-icons-png.flaticon.com/512/677/677673.png" width="200px;" height="200px;">
					<br><br>
					<strong class="countTitle">오늘 모아진 장미</strong>
					<br><br>
					<p class="count">3,506 송이</p>
				</div>
				<div class="container text-center" id="volunteerCountDiv">
					<img src="https://cdn-icons-png.flaticon.com/512/3045/3045363.png" width="200px;" height="200px;">
					<br><br>
					<strong class="countTitle">모집중인 봉사활동</strong>
					<br><br>
					<p class="count">509 건</p>
				</div>
			</div>
		</div>
	</div>



	<jsp:include page="WEB-INF/views/common/footer.jsp"></jsp:include>
	<script>
		window.onload = () => {
			if(navigator.geolocation){
				navigator.geolocation.getCurrentPosition(showYourLocation);
			} else{
				console.log("실패");
			}
		}
		
		const showYourLocation = (position) => {
			console.log(position.coords.latitude);
			console.log(position.coords.longitude);
		}
	</script>
</body>
</html>