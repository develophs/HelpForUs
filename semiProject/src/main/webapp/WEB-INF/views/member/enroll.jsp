<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<style>
	.check{
	float:left;
	font-size:12px;}
</style>
<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
</head>
<body>
<div class="container text-center">

                <h4 class="seletedCategory" style="padding-top:50px; padding-bottom:30px;">회원 가입</h4>
                <br>
                
                
                <div class="row justify-content-center">
                    <div class="col-lg-8 col-xl-7">
                        <form id="enroll" action="${contextPath}/enroll.me" method="POST">
                        	<!-- 아이디 input-->
                            <div class="form-floating mb-3">
                                <input class="form-control" id="memberUsername" name="memberUsername" type="text" required/>
                                <label for="memberUsername">아이디</label>
                            </div> 
                            <label id="checkUsername" class="check">아이디를 입력해주세요.</label>
                            <br>
                            
                            <!-- 비밀번호 input-->
                            <div class="form-floating mb-3">
                                <input class="form-control" id="memberPwd" name="memberPwd" type="password" required/>
                                <label for="memberPwd">비밀번호</label>
                            </div>
                            
                             <!-- 비밀번호 확인 input-->
                            <div class="form-floating mb-3">
                                <input class="form-control" id="memberPwd2" name="memberPwd2" type="password" required/>
                                <label for="memberPwd2">비밀번호 확인</label>
                            </div>
                            
                            <!-- 이름 input-->
                            <div class="form-floating mb-3">
                                <input class="form-control" id="memberName" name="memberName" type="text" required/>
                                <label for="memberName">이름</label>
                            </div>
                            
                             <!-- 닉네임 input-->
                            <div class="form-floating mb-3">
                                <input class="form-control" id="memberNickname" name="memberNickname" type="text" required/>
                                <label for="memberNickname">닉네임</label>
                            </div>
                            <label id="checkNickName" class="check">닉네임을 입력해주세요.</label>
                            <br>
                            
                            <!-- 이메일 input-->
                            <div class="form-floating mb-3">
                                <input class="form-control" id="memberEmail" name="memberEmail" type="email" required/>
                                <label for="memberEmail">이메일 주소</label>
                            </div>
                            
                            <!-- 전화번호 input-->
                            <div class="form-floating mb-3">
                                <input class="form-control" id="memberAddress" name="memberAddress" type="text" required/>
                                <label for="memberAddress">주소</label>
                            </div>
                            
                            <!-- 전화번호 input-->
                            <div class="form-floating mb-3">
                                <input class="form-control" id="memberPhone" name="memberPhone" type="text" required/>
                                <label for="memberPhone">전화 번호</label>
                            </div>
                            
                            <button class="btn btn-primary btn-xl " type="submit">회원가입</button>
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <button class="btn btn-primary btn-xl " type="button" onclick="location.href='${contextPath}'">취소</button>
                        	<br><br>
                        </form>
                    </div>
                </div>
   			</div>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
	
	<script>
		window.onload = () =>{
			
			const userName = document.getElementById('memberUsername');
			const checkId = document.getElementById('checkUsername');
			const userNameVal = userName.value;
			
			userName.addEventListener('change',function(){
				$.ajax({
					url: '${contextPath}/checkUesrname.me',
					data: {userName:this.value},
					success: (data)=>{
						console.log(data);
						if(data=='yes'){
							checkId.style.color = 'red';
							checkId.innerText = '이미 사용중인 아이디 입니다.';
						} else if(data=='no'){
							checkId.style.color = 'green';
							checkId.innerText = '사용 가능한 아이디 입니다.';
						} 
					},
					error: (data) =>{
						console.log(data);
					}
				});
			});
			
			
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