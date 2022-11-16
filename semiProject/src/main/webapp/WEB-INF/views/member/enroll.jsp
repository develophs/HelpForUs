<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
</head>
<body>
<div class="container text-center">

                <h4 class="seletedCategory" style="padding-top:50px; padding-bottom:30px;">회원 가입</h4>
                <br>
                
                
                <div class="row justify-content-center">
                    <div class="col-lg-8 col-xl-7">
                        <form id="enroll" action="${contextPath}" method="POST">
                        	<!-- 아이디 input-->
                            <div class="form-floating mb-3">
                                <input class="form-control" id="id" type="text"/>
                                <label for="id">아이디</label>
                            </div>
                            
                            <!-- 비밀번호 input-->
                            <div class="form-floating mb-3">
                                <input class="form-control" id="pwd" type="password" />
                                <label for="pwd">비밀번호</label>
                            </div>
                            
                             <!-- 비밀번호 확인 input-->
                            <div class="form-floating mb-3">
                                <input class="form-control" id="pwd2" type="password" />
                                <label for="pwd2">비밀번호 확인</label>
                            </div>
                            
                            <!-- 이름 input-->
                            <div class="form-floating mb-3">
                                <input class="form-control" id="name" type="text"/>
                                <label for="name">이름</label>
                            </div>
                            
                             <!-- 닉네임 input-->
                            <div class="form-floating mb-3">
                                <input class="form-control" id="nickName" type="text"/>
                                <label for="nickName">닉네임</label>
                            </div>
                            
                            <!-- 이메일 input-->
                            <div class="form-floating mb-3">
                                <input class="form-control" id="email" type="email"/>
                                <label for="email">이메일 주소</label>
                            </div>
                            
                            <!-- 전화번호 input-->
                            <div class="form-floating mb-3">
                                <input class="form-control" id="address" type="tel"/>
                                <label for="address">주소</label>
                            </div>
                            
                            <!-- 전화번호 input-->
                            <div class="form-floating mb-3">
                                <input class="form-control" id="phone" type="tel"/>
                                <label for="phone">전화 번호</label>
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