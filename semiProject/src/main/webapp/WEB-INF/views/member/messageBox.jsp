<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>마이페이지</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<style>
	.mypage{padding-top:15px; text-align:left; font-weight:bold;}
	.category{font-weight:bold; text-align:left; font-size:24px; padding-top:15px;}
	.menu{text-align:left; font-size:15px;}
	.menu:hover{font-weight:bold; cursor:pointer;}
	#divTable{padding-left: 75px; padding-right: 75px}
	
</style>
<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
</head>
<body>
<jsp:include page="../common/top.jsp"/>
	
	
	<div class="container text-center">
		<c:if test="${loginUser.memberRight =='B'}">
			<h3 class='mypage'>My Page</h3>
		</c:if>
		
		<c:if test="${loginUser.memberRight =='C'}">
			<h3 class='mypage'>단체 정보 페이지</h3>
		</c:if>
		
		<br>
		
		<div class="row">
    		<div class="col-2 border border-dark border-2">
   				
   				<c:if test="${loginUser.memberRight =='B'}">
   					<p class="category">내 정보</p>
   				</c:if>
   				
   				<c:if test="${loginUser.memberRight =='C'}">
   					<p class="category">단체 정보</p>
   				</c:if>
   				
   				<ul type="circle">
   					<c:if test="${loginUser.memberRight =='B'}">
   						<li><p class="menu" onclick="location.href='${contextPath}/myInfo.me'">내 정보 확인 / 수정</p></li>
	   				</c:if>
	   				
	   				<c:if test="${loginUser.memberRight =='C'}">
	   					<li><p class="menu" onclick="location.href='${contextPath}/myInfo.me'">단체 정보 확인 / 수정</p></li>
	   				</c:if>
   					<li><p class="menu" onclick="location.href='${contextPath}/rose.me'">장미 구입</p></li>
   				</ul>
   				
   				
   				<c:if test="${loginUser.memberRight =='B'}">
   				
   				<p class="category">기부 현황</p>
   				<ul type="circle">
   					<li><p class="menu" onclick="location.href='${contextPath}/donBoard.me'">기부 내역</p></li>
   					<li><p class="menu" onclick="location.href='${contextPath}'">응원한 모금 게시글</p></li>
   				</ul>
   				
   				
   				<p class="category">봉사 활동 현황</p>
   				<ul type="circle">
	   				<li><p class="menu" onclick="location.href='${contextPath}/volBoard.me'">신청한 봉사활동</p></li>
   					<li><p class="menu" onclick="location.href='${contextPath}'">응원한 봉사활동</p></li>
				</ul>
				
				</c:if>
				
				<c:if test="${loginUser.memberRight =='C'}">
					<p class="category">봉사 모집 현황</p>
	   				<ul type="circle">
	   					<li><p class="menu" onclick="location.href='${contextPath}/volList.me'">작성한 봉사모집 현황</p></li>
	   					<li><p class="menu" onclick="location.href='${contextPath}/endVolList.me'">봉사모집 마감 현황</p></li>
					</ul>
					
					<p class="category">모금 현황</p>
	   				<ul type="circle">
		   				<li><p class="menu" onclick="location.href='${contextPath}/donList.me'">작성한 기부 현황</p></li>
		   				<li><p class="menu" onclick="location.href='${contextPath}/endDonList.me'">기부 마감 현황</p></li>
					</ul>
				</c:if>
				
				<p class="category">쪽지함</p>
   				<ul type="circle">
	   				<li><p class="menu" onclick="location.href='${contextPath}/message.me'">쪽지함</p></li>
				</ul>
   			</div>
   			
   			
   			<%--공백생성 --%>
   			<div class="col-1">
   			</div>
   			<%--공백생성 --%>
   			
   			<div class="col-9 border border-dark " id="divTable">
   				<h3 style="text-align: center; padding-bottom: 20px; padding-top: 50px;">쪽지함</h3>
   				<div style="height: 400px">
   				
	   				<div class="btn-toolbar mb-3" role="toolbar" aria-label="Toolbar with button groups">
						<div class="btn-group me-2" role="group" aria-label="First group">
						    <button type="button" class="btn btn-outline-secondary" id="sendBoxBtn" onclick="location.href='${contextPath}/message.me?msgType='+1">보낸쪽지함</button>
						    <button type="button" class="btn btn-outline-secondary" id="receiveBoxBtn" onclick="location.href='${contextPath}/message.me?msgType='+0">받은쪽지함</button>
						</div>
					</div>
					<br><br><br>
					<table class="table" id="sendBox">
						<thead>
						    <tr>
						      <th scope="col">제목</th>
							      <c:if test="${msgType==0}">
							      	<th scope="col">보낸사람</th>
							      </c:if>
							      <c:if test="${msgType!=0}">
							      	<th scope="col">받는사람</th>
							      </c:if>
						      <th scope="col">날짜</th>
						      <th scope="col">확인</th>
						      <th scope="col">삭제</th>
						    </tr>
						</thead>
						<tbody class="table-group-divider" >
							<c:forEach items="${msgList}" var="m">
								<form method="POST" id="msgList">
									<input type="hidden" value='${m.messageId }' name="messageId"  id="messageId">
								</form>
								<c:set var="title" value="${fn:substring(m.messageTitle, 0, 15)}"></c:set>
								<tr>
									<td><c:if test="${m.boardType eq 'Vol'}">[봉사]</c:if><c:if test="${m.boardType eq 'Don'}">[기부]</c:if>${m.messageTitle}</td>
								    <c:if test="${loginUser.memberUsername eq m.receiverUsername}">
							      		<td scope="col">${m.senderUsername}</td>
							   		</c:if>
									<c:if test="${loginUser.memberUsername eq m.senderUsername}">
							      		<td scope="col">${m.receiverUsername}</td>
							      	</c:if>
							      	<td>${m.messageCreateDate}</td>
								    <td><button id="msgDetail">확인</button></td>
								    <td><button id="deleteBtn">삭제</button></td>
							    </tr>
						    </c:forEach>				  
					  </tbody>
					</table>
   				</div>
   			
   			<!-- 페이징 처리 -->
		   		<nav aria-label="Standard pagination example" style="align-content: center;">
		        	<ul class="pagination">
		        	<c:if test="${ pi.currentPage > 1 }">
			            <li class="page-item">
			            	<c:url var="goBack" value="${ loc }">
			            		<c:param name="page" value="${ pi.currentPage-1}"/>
			            		<c:param name="msgType" value="${ msgType }"/>
			            	</c:url>
			            	<a class="page-link" href="${ goBack }" aria-label="Previous">
			            		<span aria-hidden="true">&laquo;</span>
			              	</a>
			            </li>
			            </c:if>
			            <c:forEach begin="${pi.startPage }" end="${pi.endPage }" var="p">
			            	<c:url var="goNum" value="${loc}">
			            		<c:param name="page" value="${ p }"></c:param>
			            		<c:param name="msgType" value="${ msgType }"></c:param>
			            	</c:url>
			            	<li class="page-item"><a class="page-link" href="${goNum }">${ p }</a></li>
			            </c:forEach>
			            <c:if test="${ pi.currentPage < pi.maxPage }">
			            <li class="page-item">
			            	<c:url var="goNext" value="${loc}">
			            		<c:param name="page" value="${ pi.currentPage+1 }"></c:param>
			            		<c:param name="msgType" value="${ msgType }"></c:param>
			            	</c:url>
			            	<a class="page-link" href="${goNext }" aria-label="Next">
			            		<span aria-hidden="true">&raquo;</span>
			            	</a>
			            </li>
			            </c:if>
			    	</ul>
        		</nav>
   			</div>
			   <div style="height: 100px;"></div>
  		</div>
  		
  		<!-- 메세지 삭제 모달창 -->
  		<div class="modal fade" tabindex="-1" role="dialog" id="modalChoice">
			<div class="modal-dialog" role="document">
	    		<div class="modal-content rounded-3 shadow">
	      			<div class="modal-body p-4 text-center">
	        			<h3 class="mb-0">쪽지를 삭제하시겠습니까?</h3>
	      			</div>
	      			<div class="modal-footer flex-nowrap p-0">
	        			<button type="button" class="btn btn-lg btn-link fs-6 text-decoration-none col-6 m-0 rounded-0 border-end" id="delete">
	        				<strong>네</strong>
	        			</button>
	        			<button type="button" class="btn btn-lg btn-link fs-6 text-decoration-none col-6 m-0 rounded-0" data-bs-dismiss="modal">아니오</button>
	      			</div>
	    		</div>
  			</div>
		</div>
	
	
	<!-- 메세지 확인 모달창 -->
		<div class="modal fade" id="msgDetailModal" aria-hidden="true" aria-labelledby="exampleModalToggleLabel" tabindex="-1">
		  <div class="modal-dialog modal-dialog-centered">
		    <div class="modal-content">
		      <div class="modal-body" style="text-align: left">
		    	제목<input type="text" class="form-control " id="recipient-name" name="selectMsgDetail" readonly>
		    	내용<input class="form-control" name="selectMsgDetail" readonly style="height: 300px">
		      	<br>
		      	아이디 : <input readonly="readonly" name="selectMsgDetail" readonly style="border: none;">
		      </div>
		      <div class="modal-footer">
		      	 <c:if test="${msgType!=1}">
		        	<button class="btn btn-primary" data-bs-target="#exampleModalToggle2" data-bs-toggle="modal" id="delete">답장하기</button>
		        </c:if>
		        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
		      </div>
		    </div>
		  </div>
		</div>
		
	<!-- 메세지 답장 모달창 -->
		<div class="modal fade" id="exampleModalToggle2" aria-hidden="true" aria-labelledby="exampleModalToggleLabel2" tabindex="-1">
		  <div class="modal-dialog modal-dialog-centered">
	 		<form method="POST" id="msgForm" action="inquiryVol.vo">	    
	 			<div class="modal-content">
				   	<div class="modal-header">
				        <h1 class="modal-title fs-5" id="exampleModalToggleLabel2">SEND MESSAGE</h1>
				        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
				    </div>
				 	<div class="modal-body">
					    <div class="mb-3" style="text-align: left;">
					    	제목<input type="text" class="form-control " id="recipient-name" name="messageTitle">
					    	내용<input class="form-control" style="height: 300px" name="messageContent">
					      	<br>
					      	보낼 아이디 : <input type="text" name="receiverUsername" class="reMsgInput" readonly style="border: none;">
					      	<input type="hidden" name="refBoardId" class="reMsgInput">
					      	<input type="hidden" name="boardType" class="reMsgInput">
					    </div>
					 </div>
					 <div class="modal-footer">
						<button type="submit" class="btn btn-primary" id="sendBtn"><strong>보내기</strong></button>
				      	<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
					 </div>
		    	</div> 
		    </form>
		  </div>
		</div>

	
	
	
	
	
		
	</div>
<jsp:include page="../common/footer.jsp"/>
	<script>
		window.onload = () =>{
			
			const form = document.getElementById('msgList');
			
			document.getElementById('deleteBtn').addEventListener('click', ()=>{
				$('#modalChoice').modal('show');	
			});
			
			document.getElementById("delete").addEventListener('click', ()=>{
				form.action = '${contextPath}/deleteMsg.me';
				form.submit();
			});
			
			
			document.getElementById('msgDetail').addEventListener('click', ()=>{
				$.ajax({
					url: '${contextPath}/selectMsg.me',
					data: {messageId:document.getElementById('messageId').value},
					success: (data) => {
						$('#msgDetailModal').modal('show')
						const inputMsg = document.getElementsByName("selectMsgDetail");
						inputMsg[0].value=data.messageTitle;
						inputMsg[1].value=data.messageContent;
						inputMsg[2].value=data.receiverUsername;
						
						const reMsgInput = document.getElementsByClassName('reMsgInput');
						reMsgInput[0].value=data.senderUsername;
						reMsgInput[1].value=data.refBoardId;
						reMsgInput[2].value=data.boardType;
						
					},
					error: (data) => {
						console.log(data);
					}
				});
				
				
			});
			
			
			
			
			
		}
	</script>

	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
</body>
</html>