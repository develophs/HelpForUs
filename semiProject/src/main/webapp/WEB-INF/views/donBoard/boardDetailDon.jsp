<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

	<!-- Font Awesome -->
	<link
	  href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css"
	  rel="stylesheet"
	/>
	<!-- Google Fonts -->
	<link
	  href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700&display=swap"
	  rel="stylesheet"
	/>
	<!-- MDB -->
	<link
	  href="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/5.0.0/mdb.min.css"
	  rel="stylesheet"
	/>
	
	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap" rel="stylesheet">
	<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
	
	<style>
		*{font-family: 'Nanum Gothic', sans-serif;}
	
		hr{
			width: 50%; margin-left: auto; margin-right: auto;
		}
		.btn-space{
			margin-right: 300px;
		}
		
		table{border: 4px solid lightgray;}
		
		#totalTable{
			border: none;
			text-align: center;
		}
		
		th{
			width: 15%;
			text-align: center;
		}
		
		#total{
			margin: auto;
			width: 450px;
			height: 300px;
			border: 3px solid mistyrose;
			text-align: center;
		}
		
		#roseDon{
			width: 230px;
			height: 230px;
		}
		
		.roseCount{
			width: 80px;
		}
		
		#replyDiv{
			text-align: center;
		}
		
	</style>
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/top.jsp"/>
	<jsp:include page="/WEB-INF/views/common/nav.jsp"/>
	
	<br><br>
	
	<div class="mx-auto m-3">
		<button onclick="location.href='${contextPath}/donBoardList.do?page=${page}'" class="btn btn-lg btn-space mb-0 text-white" style="background-color: orange">목록</button>
		<c:if test="${ loginUser != null && dB.refMemberUsername != loginUser.memberUsername}">
			<button id="inquiry" onclick="$('#modal').modal('show')" class="btn btn-lg mb-0 text-white" style="background-color: skyblue">문의</button>
			<c:if test="${ cheer == null }">
				<button onclick="location.href='${contextPath}/cheerBoard.do?bId=${ dB.boardId }'" class="btn btn-lg mb-0 text-white" style="background-color: gray">응원하기</button>
			</c:if>
			<c:if test="${ cheer != null }">
				<button onclick="location.href='${contextPath}/cheerCancle.do?bId=${ dB.boardId }'" class="btn btn-lg mb-0 text-white" style="background-color: gray">응원취소</button>
			</c:if>
		</c:if>
		<c:if test="${ loginUser == null || dB.refMemberUsername == loginUser.memberUsername }">
			<button id="inquiry" class="btn btn-lg mb-0 text-white" style="background-color: skyblue" disabled>문의</button>
			<button class="btn btn-lg mb-0 text-white" style="background-color: gray" disabled>응원하기</button>
		</c:if>
		
			
	</div>
	
	<div class="mx-auto" style="width: 750px">
		<table class="table table-sm table-bordered">
			<tr>
				<th>${ dB.boardTitle }</th>
			</tr>
		</table>
	</div>
	
	<div style="border: 5px solid lightgray; width:60%" class="mx-auto">
		<br>
		<div class="mx-auto" style="width: 750px">
			<table class="table table-sm table-bordered">
				<tr>
					<th class="table-active">모금기간</th>
					<td>${ dB.boardDeadline }까지</td>
					<th class="table-active">후원대상</th>
					<td>${ dB.categoryName }</td>
				</tr>
				<tr>
					<th class="table-active">모인 장미</th>
					<fmt:parseNumber var="currentPrice" value="${ dB.fundraisingCurrentPrice/100 }" integerOnly="true"/>
					<td>${ currentPrice }</td>
					<th class="table-active">목표 장미</th>
					<fmt:parseNumber var="goalPrice" value="${ dB.fundraisingGoalPrice/100 }" integerOnly="true"/>
					<td>${ goalPrice }</td>
				</tr>
				<tr>
					<th class="table-active">담당자</th>
					<td>${ dB.managerName }</td>
					<th class="table-active">연락처</th>
					<td>${ dB.managerPhone }</td>
				</tr>
			</table>
		</div>
		
		<br><br>
		
		<div class="mx-auto" style="height: 20%; text-align: center">
			<c:forEach items="${ aList }" var="a">
				<img style="margin: auto; width: 700px; height: 500px;" src="resources/uploadFiles/${ a.renameName }">
			</c:forEach>
		</div>
		
		<br><br><br>
		
		<div class="mx-auto" style="height: 40%; width: 50%">
			${ dB.boardContent }
		</div>
		<br><br>
		<div id="total">
			<table id="totalTable">
				<tr>
					<td>기부된 장미</td>
					<td>목표 장미</td>
				</tr>
				<tr>
					<th>${ currentPrice } 송이</th>
					<th>${ goalPrice } 송이</th>
				</tr>
				<tr>
					<td colspan="2"><img src="resources/img/roseDon.png" id="roseDon"></td>
				</tr>
				
			</table>
			
		</div>
		<br><br><br>
		
		<div class="text-center">
			<c:if test="${ loginUser != null}">
				<c:if test="${ dB.refMemberUsername == loginUser.memberUsername || loginUser.memberRight == 'A'}">
					<button id="deleteBtn" class="btn btn-lg text-white" style="background-color: orange;">삭제</button>
					<button onclick="location.href='${contextPath}/goUpdateDonBoard.do?bId=${ dB.boardId }'" class="btn btn-lg text-white" style="background-color: green;">수정</button>
				</c:if>
			</c:if>
		</div>
		
		<br><br>
		
		<c:if test="${ reply != null }">
			<div id="replyDiv">
				<h4>기부자 댓글</h4>
				<table class="table" style="width: 80%; margin-left: auto; margin-right: auto;">
					<tr>
						<th style="width:10%">작성자</th>
						<th>내용</th>
						<th style="width:10%">작성일</th>
					</tr>
					<c:forEach items="${ reply }" var="r">
						<tr>
							<td>${ r.nickName }</td>
							<td>${ r.replyContent }</td>
							<td>${ r.replyCreateDate }</td>
						</tr>
					</c:forEach>
				</table>
			</div>
		</c:if>
		
		
		
		<div class="text-center">
			<c:if test="${ loginUser != null && dB.refMemberUsername != loginUser.memberUsername }">
				<button onclick="$('#roseModal').modal('show')" class="btn btn-lg text-white" style="background-color: orange">장미 보내기</button>
			</c:if>
		</div>
		<br>
	</div>
	
	<div class="modal fade" id="modal" aria-hidden="true" aria-labelledby="exampleModalToggleLabel2" tabindex="-1">
	  <div class="modal-dialog modal-dialog-centered">
			<div class="modal-content">
			  	<div class="modal-header">
			        <h1 class="modal-title fs-5" id="exampleModalToggleLabel2">SEND MESSAGE</h1>
			        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			    </div>
			 	<div class="modal-body" style="text-align: left">
				    	제목<input type="text" class="form-control input" id="recipient-name" name="messageTitle">
				    	내용<input class="form-control input" style="height: 300px" name="messageContent">
				      	<br>
				      	보낼 아이디 : <input value="${ dB.refMemberUsername }" type="text" name="receiverUsername" class="input" readonly style="border: none;">
				      	<input value="${ dB.boardId }" type="hidden" name="refBoardId" class="input">
				 </div>
				 <div class="modal-footer">
					<button class="btn btn-primary" id="sendBtn" ><strong>보내기</strong></button>
			      	<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
				 </div>
	    	</div> 
	  </div>
	</div>
	
	<form action="${ contextPath }/roseDonation.do" method="POST">
		<div class="modal fade" id="roseModal" aria-hidden="true" aria-labelledby="exampleModalToggleLabel2" tabindex="-1">
		  <div class="modal-dialog modal-dialog-centered">
				<div class="modal-content">
				  	<div class="modal-header">
				        <h1 class="modal-title fs-5" id="exampleModalToggleLabel2">ROSE</h1>
				        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
				    </div>
				 	<div class="modal-body" style="text-align: left">
					    	<h5 id="rose">보유 중인 장미 : ${ loginUser.memberRose } 송이</h5>
					    	<br>
					    	<h5><b>기부할 장미 : <span id="addRose"></span> 송이</b></h5>
					    	<br>
			              	<div class="row mx-auto">
				                <div class="col-3">
			                		<input type="button" class="btn roseCount text-white" style="background-color: lightcoral" value="1">
				                </div>
					            
					            <div class="col-3">
			                		<input type="button" class="btn roseCount text-white" style="background-color: lightcoral" value="10">
				                </div>
			                	<div class="col-3">
				                	<input type="button" class="btn roseCount text-white" style="background-color: lightcoral" value="30">
				                </div>
					            
					            <div class="col-3">
			                		<input type="button" class="btn roseCount text-white" style="background-color: lightcoral" value="50">
				                </div>
				                
				                <br><br><br>
				                
				                <div class="col-3">
				                	<input type="button" class="btn roseCount text-white" style="background-color: lightcoral" value="100">
				                </div>
					            
					            <div class="col-3">
				                	<input type="button" class="btn roseCount text-white" style="background-color: lightcoral" value="300">
				                </div>
				                <div class="col-3">
				                	<input type="button" class="btn roseCount text-white" style="background-color: lightcoral" value="500">
				                </div>
					       		<div class="col-3">
				                	<input type="button" class="btn roseCount text-white" style="background-color: lightcoral" value="1000">
				            	</div>
			                </div>
			                <br><br>
			                <h5><b>응원 댓글</b></h5>
			                <input type="text" id="reply" name="reply" class="form-control" placeholder="따뜻한 한마디를 남겨주세요.">
						 </div>
						 <br>
					 <div class="modal-footer">
					 	<input type="hidden" name="bId" id="bId" value="${ dB.boardId }">
					 	<input type="hidden" name="writer" id="writer" value="${ dB.memberNickname }">
					 	<input type="hidden" id="totalRose" name="totalRose">
						<input type="button" class="btn text-white" value="리셋" style="background-color: darkkhaki" id="reset">
						
						
						<input type="submit" class="btn text-white" id="roseSend" style="background-color: #0088ff; display: none" value="기부하기">
				      	<!-- <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button> -->
					 </div>
		    	</div> 
		  </div>
		</div>
	</form>
	
	
	<br><br><br>
	<br><br><br>
	
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
	
	<script>
	window.onload=()=>{
		document.getElementById('sendBtn').addEventListener('click', () => {
			const input = document.getElementsByClassName('input');
			console.log(input[2].value);
			$.ajax({
				url: '${ contextPath }/inquiry.me',
				data: {messageTitle:input[0].value,
					   messageContent:input[1].value,
					   receiverUsername:input[2].value,
					   refBoardId:input[3].value},
				success: (data) => {
					$('#modal').modal('hide')
					 reMsgInput[0].value = '';
					 reMsgInput[1].value = ''; 
					 location.reload();
				},
				error: (data) => {
					console.log(data);
				}
			});
		});
		
		// 장미 기부하기(모달)
		var count = 0;
		
		document.getElementById('addRose').innerHTML = count;
		$('.roseCount').click(function(){
			if(count <= ${loginUser.memberRose}){
				if(count + Number(($(this).attr('value'))) <= ${loginUser.memberRose}){
					count += Number(($(this).attr('value')));
				}else{
					alert('보유 장미 개수보다 많은 장미를 선택할 수 없습니다.');
				}
			}
			if(count>0) {
				document.getElementById('roseSend').style.display = 'inline';
			}
			
			$('#reset').click(function(){
				count = 0;
				document.getElementById('addRose').innerHTML = count;
				document.getElementById('roseSend').style.display = 'none';
			});
			
			document.getElementById('addRose').innerHTML = count;
			document.getElementById('totalRose').value = count;
			

		});
		
		$('#deleteBtn').click(function(){
			if(confirm('게시글을 삭제하면 다시 되돌릴 수 없습니다, 정말 삭제하시겠습니까?')){
				location.href="${contextPath}/deleteDonBoard.do?bId=${ dB.boardId }" 	
			}else{
				alert('취소를 누르셨습니다.');
			}
		});
		
	}
	</script>
	
</body>
</html>