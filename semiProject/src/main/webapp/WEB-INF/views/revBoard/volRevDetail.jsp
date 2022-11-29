<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
 <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
		*{font-family: 'MICEGothic Bold';}
		@font-face {
	    font-family: 'MICEGothic Bold';
	    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2206-01@1.0/MICEGothic Bold.woff2') format('woff2');
	    font-weight: 700;
	    font-style: normal;
		}
	
		hr{
			width: 50%; margin-left: auto; margin-right: auto;
		}
		.btn-space{
			margin-right: 300px;
		}
		
		table{border: 4px solid lightgray; text-align: center;}
		
		th, td{
			width: 15%;
			text-align: center;
		}
		
		#map{
			margin: auto;
			width: 450px;
			height: 300px;
			border: 1px solid black;
		}
		#table th{
			width: 5%;
		}

	</style>
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/top.jsp"/>
	<jsp:include page="/WEB-INF/views/common/nav.jsp"/>
	
	<br><br>
	
	<div class="mx-auto m-3">
		<button onclick="location.href='${contextPath}/revBoardList.re'" class="btn btn-lg btn-space mb-0 text-white" style="background-color: orange">목록</button>
		 <c:if test="${ loginUser != null && vBoard.refMemberUsername != loginUser.memberUsername}">
			<button id="inquiry" onclick="$('#modal').modal('show')" class="btn btn-lg mb-0 text-white" style="background-color: skyblue">문의</button>
		</c:if>
		<c:if test="${ loginUser == null || vBoard.refMemberUsername == loginUser.memberUsername }">
			<button class="btn btn-lg mb-0 text-white" style="background-color: skyblue" disabled>문의</button>
		</c:if> 
		<a id="btnKakao" onclick="kakaoShare()" class="kakaotalk" target="_self" title="카카오톡 새창열림"><img style="width: 50px; height: 50px;" src="https://cdn-icons-png.flaticon.com/128/7468/7468476.png"></a>
	</div>
	
	<div class="mx-auto" style="width: 750px">
		<table class="table table-sm table-bordered">
			<tr align="center">
				<th style="width: 2%">
					[봉사후기]
				</th>
				<th align="center">${ vBoard.boardTitle }</th>
			</tr>
		</table>
	</div>
	
	<div style="border: 5px solid lightgray; width:60%" class="mx-auto">
		<br>
		<div class="mx-auto" style="width: 850px">
			<table class="table table-sm table-bordered" id="table">
				<tr>
					<th class="table-active">봉사 날짜</th>
					<td>${ vBoard.volunteerDate }</td>
					<th class="table-active">봉사 장소</th>
					<td>${ vBoard.volunteerLocation }</td>
				</tr>
				<tr>
					<th class="table-active">모집기간</th>
					<td>${ vBoard.boardDeadline } 까지</td>
					<th class="table-active">봉사대상</th>
					<td>${ vBoard.categoryName }</td>
				</tr>
				<tr>
					<th class="table-active">모집인원</th>
					<td>${ vBoard.volunteerGoalPeople }</td>
					<th class="table-active">신청인원</th>
					<td>${ vBoard.volunteerCurrentPeople }</td>
				</tr>
				<tr>
					<th class="table-active">담당자</th>
					<td>${ vBoard.managerName }</td>
					<th class="table-active">연락처</th>
					<td>${ vBoard.managerPhone }</td>
				</tr>
			</table>
		</div>
		
		<br><br>
		
		<div class="mx-auto" style="height: 20%; text-align: center">
			<c:forEach items="${ aList }" var="a">
				<img style="margin: auto; width: 800px; height: 500px;" src="resources/uploadFiles/${ a.renameName }">
			</c:forEach>
		</div>
		
		<br><br><br>
		
		<div class="mx-auto" style="height: 40%; width: 50%">
			${ vBoard.boardContent }
		</div>
		<br><br>
	
		<br><br>
		
		<div class="text-center">
			<c:if test="${ loginUser != null}">
				<c:if test="${ vBoard.refMemberUsername == loginUser.memberUsername || loginUser.memberRight == 'A'}">
					<button id="deleteButton" class="btn btn-lg text-white" style="background-color: orange;">삭제</button>
					<button onclick="location.href='${contextPath}/updateVolBoardView.vo?bId=${ vBoard.boardId }'" class="btn btn-lg text-white" style="background-color: green;">수정</button>
				</c:if>
			</c:if>
		</div>
		<br><br>
	
	
	
	<div style="margin: 50px;">
			<h4>댓글</h4>
			<br>
			<div class="input-group">
	  			<textarea class="form-control" rows="3" id="replyContent" style="resize: none;"></textarea>
	 			<button class="btn btn-outline-secondary" type="button" id="replyButton"
	 			<c:if test="${ loginUser == null }"> disabled </c:if>
	 			>Button</button>
			</div>
			<br>
			<table class="table">
			  <thead>
			   <tr>
			      <th scope="col" style="width: 60%">내용</th>
			      <th scope="col" style="width: 15%">작성자</th>
			      <th scope="col" style="width: 15%">작성일</th>
			      <th scope="col" style="width: 10%"></th>
			    </tr>
			    </thead>
			    <tbody id="replyTbody">
				    <c:forEach items="${ rList }" var="r">
				    	<tr>
				    		<td>${ r.replyContent }</td>
				    		<td>${ r.nickName }</td>
				    		<td>${ r.replyModifyDate }</td>
				    		<c:if test="${ loginUser != null && (r.refMemberUsername == loginUser.memberUsername || loginUser.memberRight == 'A') }">
				    			<td id="deleteReply" class="deleteReply">삭제</td>
				    			<input type="hidden" value="${ r.replyId }">
				    		</c:if>
				    	</tr>
				    </c:forEach>
				</tbody>
			</table>
		</div>
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
				      	보낼 아이디 : <input value="${ vBoard.refMemberUsername }" type="text" name="receiverUsername" class="input" readonly style="border: none;">
				      	<input value="${ vBoard.boardId }" type="hidden" name="refBoardId" class="input">
				 </div>
				 <div class="modal-footer">
					<button class="btn btn-primary" id="sendBtn" ><strong>보내기</strong></button>
			      	<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
				 </div>
	    	</div> 
	  </div>
	</div>	
	
	
	
	<br><br><br>
	<br><br><br>
	
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=17211e215fd1702049160ddd7221beba&libraries=services"></script>
		<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
	<script>
		
	
	Kakao.init('e642cc213c74d7f2a652d395b7b56e6d');
	Kakao.isInitialized();
	const currUrl =	$(location).attr('href');
	function kakaoShare() {
		Kakao.Share.sendDefault({
			  objectType: 'feed',
			  content: {
			    title: '${vBoard.boardTitle}',
			    description: '${ fn:substring(vBoard.boardContent, 0, 20) }',
			    imageUrl: 'https://ifh.cc/g/WPbPc8.jpg',
			    link: {
			      webUrl: currUrl,
			    },
			  },
			  buttons: [
			    {
			      title: 'HelpForUs로 이동',
			      link: {
			        webUrl: currUrl,
			      },
			    },
			  ],
			});
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	window.onload = () => {
		
			
			if(document.getElementById('deleteButton') != null){
				document.getElementById('deleteButton').addEventListener('click', () => {
					if(confirm('게시글을 삭제하면 다시 되돌릴 수 없습니다, 정말 삭제 하시겠습니까?')){
						location.href="${contextPath}/deleteVolBoard.vo?bId=${ vBoard.boardId }" 	
					}
				});
			}
			
			
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
			
			document.getElementById('replyButton').addEventListener('click', () => {
				$.ajax({
					url: '${contextPath}/insertReply.co',
					data: {replyContent:document.getElementById('replyContent').value,
						   refBoardId:${vBoard.boardId}, refMemberUsername:'${loginUser.memberUsername}'},
					success: (data) => {
						document.getElementById('replyContent').value = '';
						const tbody = document.getElementById('replyTbody');
						tbody.innerHTML = '';
						
						for(const r of data){
							let str = '<tr><td>' + r.replyContent + '</td>';
							str += '<td>' + r.nickName + '</td>';
							str += '<td>' + r.replyModifyDate + '</td>';
							if(${loginUser ne null}){
								if(r.refMemberUsername == '${ loginUser.memberUsername }'){
									str += '<td id="deleteReply" class="deleteReply">삭제</td>';
					    			str += '<input type="hidden" value="${ r.replyId }">';
								}else if(${r.memberRight eq 'A'}){
									str += '<td id="deleteReply" class="deleteReply">삭제</td>';
					    			str += '<input type="hidden" value="${ r.replyId }">';
								}	
							}
							str += '</tr>';
							
							tbody.innerHTML += str;
						}
					},
					error: (data) => {
						console.log(data);
					}
					
				});
			});	
			
			const deleteReply = document.getElementsByClassName('deleteReply');
			for(const d of deleteReply){
				d.addEventListener('mouseover', () => {
					d.style.cursor = 'pointer';
				});
				d.addEventListener('click', function() {
					location.href = '${contextPath}/deleteReply.co?rId=' + d.nextElementSibling.value + '&bId=' + ${vBoard.boardId} + '&bType=Vol';
				});
			}
		}
	</script>
</body>
	
</html>