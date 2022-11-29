<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<style>
	.check{
		float:left;
		font-size:12px;
	}
	#memberAddress:hover{
		cursor:pointer;
	}
	
</style>
<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
</head>
<body>
<div class="container text-center">

                <h4 class="seletedCategory" style="padding-top:50px; padding-bottom:30px;">회원 가입</h4>
                <br>
                
                
                <div class="row justify-content-center">
                    <div class="col-lg-8 col-xl-7">
                        <form id="enroll" action="${contextPath}/enroll.me" method="POST" onsubmit="return false;">
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
                                <c:if test="${ right =='B'}">
                                	<label for="memberName">이름</label>
                                </c:if>
                                <c:if test="${ right =='D'}">
                                	<label for="memberName">봉사 단체 명</label>
                                </c:if>
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
                            
                            <div class="form-floating mb-3">
                                <input class="form-control" id="validEmail" name="validEmail" type="text" required/>
                                <label for="memberEmail">인증번호를 입력해주세요.</label>
                                <button class="btn btn-primary" id='mailButton' type="button" style="float:left;">인증번호 발송</button>
                            </div>    
                                
                            <br>
                            <!-- 주소 input-->
                            <div class="form-floating mb-3">
                                <input class="form-control" id="memberAddress" name="memberAddress" type="text" 
                                onclick="openAddress();" required/>
                                <label for="memberAddress">주소 (클릭)</label>
                            </div>
                            
                            
                            <!-- 전화번호 input-->
                            <div class="form-floating mb-3">
                                <input class="form-control" id="memberPhone" name="memberPhone" type="text" required/>
                                <label for="memberPhone">전화 번호</label>
                            </div>
                            
                            <input type="hidden" name="memberRight" value="${right}">
                            
                            <button class="btn btn-primary btn-xl " type="submit" onclick="check();">회원가입</button>
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <button class="btn btn-primary btn-xl " type="button" onclick="location.href='${contextPath}'">취소</button>
                        	<br><br>
                        </form>
                    </div>
                </div>
   			</div>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
	
	<script>
	
		let authNumber = 0;
	 	let mailNumber = 0;	
	
 		window.onload = () =>{
 			document.getElementById('mailButton').addEventListener('click',function(){
 				const email = $('#memberEmail').val();
 				
 				$.ajax({
 					url : '${contextPath}/email.me',
 					data : {email,email},
 					success : (data)=>{
 						 	mailNumber = data;
 							swal('메일이 발송되었습니다.','인증번호를 확인해주세요.');
 					}
 				});
 			});
 			
 			const userName = document.getElementById('memberUsername');
 			const checkId = document.getElementById('checkUsername');
 			
 			userName.addEventListener('blur',function(){
 				
 				const regUserName = /^[a-z0-9]{5,12}$/g;
 				
 				const val = this.value.trim();
 				
 				if(val == ''){
 					checkId.style.color = 'black';
 					checkId.innerText = '아이디를 입력해주세요.';
 				} else{
 					const checked = regUserName.test(val);
 					$.ajax({
 						url: '${contextPath}/checkUesrname.me',
 						data: {userName:val},
 						success: (data)=>{
 							if(data=='yes'){
 								checkId.style.color = 'red';
 								checkId.innerText = '이미 사용중인 아이디 입니다.';
 							} else if(data=='no'){
 								if(!checked){
 									checkId.style.color ='red';
 									checkId.innerText ='아이디가 적합하지 않습니다.';
 								} else{
 									checkId.style.color = 'green';
 									checkId.innerText = '사용 가능한 아이디 입니다.';
 								}
 							}
 						},
 						error: (data) =>{
 							console.log(data);
 						}
 					});
 				}
 			});
 			
 			
 			const nickName = document.getElementById('memberNickname');
 			const checkNickName = document.getElementById('checkNickName');
			
 			nickName.addEventListener('change',function(){
 				if(this.value.trim() == ''){
 					checkNickName.style.color = 'black';
					checkNickName.innerText = '닉네임을 입력해주세요.';
				}else{
 					$.ajax({
 						url: '${contextPath}/checkNickName.me',
						data: {nickName:this.value},
 						success: (data)=>{
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
 				}
 			});
 		}
			
 		const check = () =>{
 			authNumber = $('#validEmail').val();
 			
			console.log(authNumber);
			console.log(mailNumber);
			
			const userName = document.getElementById('memberUsername').value;
 	        const regUserName = /^[a-z0-9]{5,12}$/g;
	        
 		    if (!regUserName.test(userName)){
 		       swal('아이디가 적합하지 않습니다.','영어 소문자, 숫자로 5글자 이상 12글자 이하입니다.');
 		       return false;
 		    } 
			
 			const regPwd = /^[A-Za-z0-9]{6,12}$/g;
			
			const pwd = document.getElementById('memberPwd').value;
 			const pwd2 = document.getElementById('memberPwd2').value;
			
 			const form = document.querySelector('form');
			
 			if(pwd.trim() == '' || pwd2.trim() == '' ){
 				swal('비밀번호가 공백입니다.','비밀번호를 입력 해주세요.');
 				return false;
 			} else if(pwd != pwd2){
 				swal('비밀번호가 일치하지 않습니다.','다시 확인 해주세요.');
 		        return false;
 			} else if(!regPwd.test(pwd) || regPwd.test(pwd2)){
 				swal('비밀번호가 적합하지 않습니다.','영어 대-소문자,숫자로 6글자 이상 12글자 이하입니다.');
 				return false;
 			} else if(authNumber != mailNumber){
 				swal('인증번호가 일치하지 않습니다.','다시 확인해주세요.');
 				return false;
 			} else{
 				form.submit();
 			}
		
 		}
	</script>
	
	<!-- 회원가입 시 주소 검색 -->
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script>
			const searchAddress = document.getElementById('memberAddress');
			
	    	const openAddress = function(){
	    		new daum.Postcode({
	    			oncomplete: function(data){
	    				searchAddress.value = data.address;
	    			}
	    			
	    			}).open({
	    				 popupTitle: '주소 검색'
	    			})
	    	};
	</script>

</body>
</html>