<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>관리자 페이지</title>
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
   					<li><p class="menu" onclick="location.href='${contextPath}/allDRepList.me'">모금 댓글</p></li>
   					<li><p class="menu" onclick="location.href='${contextPath}/allVRepList.me'">봉사 후기 댓글</p></li>
   				</ul>
   				
   				<p class="category">회원 관리</p>
   				<ul type="circle">
   					<li><p class="menu" onclick="location.href='${contextPath}/memberList.me'">회원 목록</p></li>
   				</ul>
   				
   				<p class="category">단체 관리</p>
   				<ul type="circle">
	   				<li><p class="menu" onclick="location.href='${contextPath}/groupList.me'">단체 목록</p></li>
				</ul>
   			</div>
   			
   			<%--공백생성 --%>
   			<div class="col-1">
   			</div>
   			<%--공백생성 --%>
   			
   			<%-- 메뉴 선택하면 나오는 화면 컨테이너 --%>
   			<div class="col-8 border border-dark border-2">
   				
            </div>
    	</div>
   	</div>
   			
   			
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