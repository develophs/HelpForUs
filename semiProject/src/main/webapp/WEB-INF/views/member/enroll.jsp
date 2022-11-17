<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
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
                                <input class="form-control" id="memberUsername" name="memberUsername" type="text"/>
                                <label for="memberUsername">아이디</label>
                            </div>
                            
                            <!-- 비밀번호 input-->
                            <div class="form-floating mb-3">
                                <input class="form-control" id="memberPwd" name="memberPwd" type="password" />
                                <label for="memberPwd">비밀번호</label>
                            </div>
                            
                             <!-- 비밀번호 확인 input-->
                            <div class="form-floating mb-3">
                                <input class="form-control" id="memberPwd2" name="memberPwd2" type="password" />
                                <label for="memberPwd2">비밀번호 확인</label>
                            </div>
                            
                            <!-- 이름 input-->
                            <div class="form-floating mb-3">
                                <input class="form-control" id="memberName" name="memberName" type="text"/>
                                <label for="memberName">이름</label>
                            </div>
                            
                             <!-- 닉네임 input-->
                            <div class="form-floating mb-3">
                                <input class="form-control" id="memberNickname" name="memberNickname" type="text"/>
                                <label for="memberNickname">닉네임</label>
                            </div>
                            
                            <!-- 이메일 input-->
                            <div class="form-floating mb-3">
                                <input class="form-control" id="memberEmail" name="memberEmail" type="email"/>
                                <label for="memberEmail">이메일 주소</label>
                            </div>
                            
                            <!-- 전화번호 input-->
                            <div class="form-floating mb-3">
                                <input class="form-control" id="memberAddress" name="memberAddress" type="tel"/>
                                <label for="memberAddress">주소</label>
                            </div>
                            
                            <!-- 전화번호 input-->
                            <div class="form-floating mb-3">
                                <input class="form-control" id="memberPhone" name="memberPhone" type="tel"/>
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
</body>
</html>