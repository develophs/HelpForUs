<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	#quit{float: right; font-size:1px; color:gray;}
	#quit:hover{font-weight:bold; font-size:1px; cursor:pointer; color:black;}
	.check{float:left;font-size:12px;}
</style>
</head>
<body>
	<jsp:include page="../common/top.jsp"/>
	
	<div class="container text-center">
		<h3 class='mypage'>My Page</h3>
		
		<br>
		
		<div class="row">
    		<div class="col-2 border border-dark border-2">
   				
   				<p class="category">내 정보</p>
   				<ul type="circle">
   					<li><p class="menu" onclick="location.href='${contextPath}/myInfo.me'">내 정보 확인 / 수정</p></li>
   					<li><p class="menu" onclick="location.href='${contextPath}/rose.me'">장미 구입</p></li>
   				</ul>
   				
   				
   				<p class="category">기부 현황</p>
   				<ul type="circle">
   					<li><p class="menu" onclick="location.href='${contextPath}'">기부 내역</p></li>
   					<li><p class="menu" onclick="location.href='${contextPath}'">응원한 모금 게시글</p></li>
   				</ul>
   				
   				
   				<p class="category">봉사 활동 현황</p>
   				<ul type="circle">
	   				<li><p class="menu" onclick="location.href='${contextPath}'">신청한 봉사활동</p></li>
   					<li><p class="menu" onclick="location.href='${contextPath}'">응원한 봉사활동</p></li>
				</ul>
				
				<p class="category">봉사 단체</p>
   				<ul type="circle">
	   				<li><p class="menu" onclick="location.href='${contextPath}'">작성한 기부 현황</p></li>
   					<li><p class="menu" onclick="location.href='${contextPath}'">작성한 봉사모집 현황</p></li>
				</ul>
				
				<p class="category">쪽지함</p>
   				<ul type="circle">
	   				<li><p class="menu" onclick="location.href='${contextPath}'">쪽지함</p></li>
				</ul>
   			</div>
   			
   			<%--공백생성 --%>
   			<div class="col-1">
   			</div>
   			<%--공백생성 --%>
   			
   			<%-- 메뉴 선택하면 나오는 화면 컨테이너 --%>
   			<div class="col-8 border border-dark border-2">
   				
   				<!-- 선택된 제목-->
                <h4 class="seletedCategory">내 정보 수정</h4>
                <br>
                
                <!-- 정보수정칸 -->
                <div class="row justify-content-center">
                    <div class="col-lg-8 col-xl-7">
                        <form id="updateInfo" action="${contextPath}/updateInfo.me" method="POST">
                        	<!-- 아이디 input-->
                            <div class="form-floating mb-3">
                                <input class="form-control" id="memberUsername" name="memberUsername" type="text" value="${ loginUser.memberUsername }"readonly/>
                                <label for="memberUsername">아이디</label>
                            </div>
                            
                            <!-- 비밀번호 input-->
                            <div class="form-floating mb-3">
                                <input class="form-control" id="memberPwd" name="memberPwd"type="password"/>
                                <label for="memberPwd">비밀번호</label>
                            </div>
                            
                             <!-- 비밀번호 확인 input-->
                            <div class="form-floating mb-3">
                                <input class="form-control" id="memberPwd2" name="memberPwd2" type="password"/>
                                <label for="memberPwd2">비밀번호 확인</label>
                            </div>
                            
                             <!-- 닉네임 input-->
                            <div class="form-floating mb-3">
                                <input class="form-control" id="memberNickname" name="memberNickname"type="text" value="${ loginUser.memberNickname }"/>
                                <label for="memberNickname">닉네임</label>
                            </div>
                            <label id="checkNickName" class="check">사용가능한 닉네임 입니다.</label>
                            <br>
                            
                            <!-- 이메일 input-->
                            <div class="form-floating mb-3">
                                <input class="form-control" id="memberEmail" name="memberEmail" type="email" value="${ loginUser.memberEmail }"/>
                                <label for="memberEmail">이메일 주소</label>
                            </div>
                            
                            <!-- 전화번호 input-->
                            <div class="form-floating mb-3">
                                <input class="form-control" id="memberAddress" name="memberAddress" type="text" value="${ loginUser.memberAddress }"/>
                                <label for="memberAddress">주소</label>
                            </div>
                            
                            <!-- 전화번호 input-->
                            <div class="form-floating mb-3">
                                <input class="form-control" id="memberPhone" name="memberPhone" type="text" value="${ loginUser.memberPhone }"/>
                                <label for="memberPhone">전화 번호</label>
                            </div>
                            
                            <button class="btn btn-primary btn-xl " type="submit">수정</button>
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <button class="btn btn-primary btn-xl " type="button" onclick="location.href='${contextPath}'">취소</button>
                        	<br><br>
                        </form>
                    </div>
                </div>
                <div id='quit' style="align:right;">회원 탈퇴</div>
   			</div>
   			
  		</div>
	</div>
	<jsp:include page="../common/footer.jsp"/>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
	<script>
		window.onload = () =>{
			const nickName = document.getElementById('memberNickname');
			const checkNickName = document.getElementById('checkNickName');
			
			nickName.addEventListener('change',function(){
				$.ajax({
					url: '${contextPath}/checkNickName.me',
					data: {nickName:this.value},
					success: (data)=>{
						console.log(data);
						if(data=='yes'){
							checkNickName.style.color = 'red';
							checkNickName.innerText = '이미 사용중인 닉네임 입니다.';
						} else if(data=='no'){
							checkNickName.style.color = 'green';
							checkNickName.innerText = '사용 가능한 닉네임 입니다.';
						}
					},
					error: (data) =>{
						console.log(data);
					}
				});
			});
		}
	</script>
</body>
</html>