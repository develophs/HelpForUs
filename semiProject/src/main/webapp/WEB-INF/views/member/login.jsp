<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
<style>
	html, body {height: 100%;}
	body{display: flex; align-items: center; padding-top: 40px; padding-bottom: 40px;}
	.form-signin {max-width: 300px; padding: 15px;}
	.form-floating{padding-bottom:10px;}
</style>
</head>
<body class="text-center">
<c:set value="${ pageContext.servletContext.contextPath }" var="contextPath" scope="application"/>
	<main class="form-signin w-100 m-auto">
		<form action="${contextPath}/login.me" method="POST">
			<h1 class="h3 mb-3 fw-normal">Login</h1>

			<div class="form-floating">
				<input type="text" class="form-control" id="memberUsername" name="memberUsername">
				<label for="memberUsername">ID</label>
			</div>
			
			<div class="form-floating">
				<input type="password" class="form-control" id="memberPwd" name="memberPwd">
				<label for="memberPwd">Password</label>
			</div>

			<button class="btn btn-primary" type="submit"
			style="--bs-btn-padding-y: .25rem; --bs-btn-padding-x: 1rem; --bs-btn-font-size: 1.1rem;"
			>Login</button>
			
			<button class="btn btn-primary" type="button" onclick="location.href='${contextPath}'" 
			style="--bs-btn-padding-y: .25rem; --bs-btn-padding-x: 1rem; --bs-btn-font-size: 1.1rem;"
			>Cancel</button>
			
			<br><br>
			
		</form>
		
		<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal" data-bs-whatever="@mdo"
			style="--bs-btn-padding-y: .5rem; --bs-btn-padding-x: 1.8rem; --bs-btn-font-size: 1.1rem;">비밀번호 찾기</button>
			
			<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
			  <div class="modal-dialog">
			    <div class="modal-content">
			      <div class="modal-header">
			        <h1 class="modal-title fs-5" id="exampleModalLabel">이메일 인증을 통한 비밀번호 재설정</h1>
			        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			      </div>
			      <div class="modal-body">
			        <form action="${contextPath}/modifyPwd.me" id="form" onsubmit="return false;">
			          <div class="mb-3">
			            <label for="emailAdress" class="col-form-label">이메일 주소</label>
			            <input type="text" class="form-control" id="emailAdress" name="emailAdress">
			          </div>
			          <div class="mb-3">
			            <label for="authNumber" class="col-form-label">인증 번호</label>
			            <input type="text" class="form-control" id="authNumber"></textarea>
			          </div>
			        </form>
			      </div>
			      <div class="modal-footer">
			   		<button type="button" class="btn btn-primary" id="sendEmail">인증번호 발송</button>
			        <button type="button" class="btn btn-secondary" id="checkNumber" onclick="check();">인증번호 확인</button>
			      </div>
			    </div>
			  </div>
			</div>
	</main>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
	<script>
	
		let authNumber = 0;
		let mailNumber = 0;
		window.onload = () =>{
			
			document.getElementById('sendEmail').addEventListener('click',function(){
				const email = document.getElementById('emailAdress').value;
				$.ajax({
					url: '${contextPath}/checkEmail.me',
					async : false,
					data: {email,email},
					success: (data)=>{
						if(data.trim()== 'yes'){
							swal('메일이 발송되었습니다.','인증번호를 확인해주세요.');
						} else{
							swal('해당 이메일이 존재하지 않습니다.');
						}
					}
				});
				
				$.ajax({
					url: '${contextPath}/email.me',
					data: {email,email},
					success: (data)=>{
						mailNumber = data;
					}
				});
			});
		}
		
		const form = document.getElementById('form');
		const check = () =>{
			authNumber = document.getElementById('authNumber').value;
			if(mailNumber == '' || mailNumber == null){
				swal('인증번호를 발급받으셔야 합니다.');
				return false;
			} else if(mailNumber != authNumber){
				swal('인증번호가 일치하지 않습니다.');
				return false;
			} else{
				form.submit();
			}
		} 
		
	</script>




</body>
</html>