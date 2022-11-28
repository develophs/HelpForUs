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
		
			#index_02{
	    width: 500px;
	    height: 200px;
	    border: 1px solid dimgrey;
	    margin: 50px auto;
	}
	
	#header2{
	    height: 100px;
	    border-bottom: 1px solid dimgrey;
	    box-sizing: border-box;
	    text-align: center;
	    line-height: 100px;
	    font-size: 1.5rem;
	}
	
	#slide2{
	    height: 300px;
	    border-bottom: 1px solid dimgrey;
	    overflow: hidden;
	}
	#slide2>ul{
	    height: 900px;
	}
	#slide2>ul>li{
	    height: 300px;
	}
	

		
		
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
	</style>
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/top.jsp"/>
	<jsp:include page="/WEB-INF/views/common/nav.jsp"/>
	
	<br><br>
	${nickName}
	<div class="mx-auto m-3">
		<button onclick="location.href='${contextPath}/revBoardList.re?page=${page}'" class="btn btn-lg btn-space mb-0 text-white" style="background-color: orange">목록</button>
		<c:if test="${ loginUser != null && dB.refMemberUsername != loginUser.memberUsername}">
			<button onclick="window.open('${contextPath}/inquiryDonView.do?boardId=${ dB.boardId }&writer=${ dB.refMemberUsername }', 'inquiryVol', 'width = 500, height = 400, left = 350, top = 100')" class="btn btn-lg mb-0 text-white" style="background-color: skyblue">문의</button>
			<c:if test="${ cheer == null }">
				<button onclick="location.href='${contextPath}/cheerBoard.do?bId=${ dB.boardId }'" class="btn btn-lg mb-0 text-white" style="background-color: gray">응원하기</button>
			</c:if>
			<c:if test="${ cheer != null }">
				<button onclick="location.href='${contextPath}/cheerCancle.do?bId=${ dB.boardId }'" class="btn btn-lg mb-0 text-white" style="background-color: gray">응원취소</button>
			</c:if>
		</c:if>
		<c:if test="${ loginUser == null || dB.refMemberUsername == loginUser.memberUsername }">
			<button class="btn btn-lg mb-0 text-white" style="background-color: skyblue" disabled>문의</button>
			<button class="btn btn-lg mb-0 text-white" style="background-color: gray" disabled>응원하기</button>
		</c:if>
			<a id="btnKakao" onclick="kakaoShare()" class="kakaotalk" target="_self" title="카카오톡 새창열림"><img style="width: 50px; height: 50px;" src="https://cdn-icons-png.flaticon.com/128/7468/7468476.png"></a>
			
	</div>
	
	<div class="mx-auto" style="width: 750px">
		<table class="table table-sm table-bordered">
			<tr>
				<th>[기부후기]${ dB.boardTitle }</th>
				
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
					<th class="table-active">담당자</th>
					<td>${ dB.managerName }</td>
					<th class="table-active">연락처</th>
					<td>${ dB.managerPhone }</td>
				</tr>
				<tr>
					<th class="table-active">모인 장미</th>
					<td>${ dB.fundraisingCurrentPrice }</td>
				</tr>
			</table>
		</div>
		
		<br><br>
		
		<div class="mx-auto" style="height: 20%; text-align: center">
			<c:forEach items="${ aList }" var="a">
			
				<img style="margin: auto" src="resources/uploadFiles/${ a.renameName }">
			</c:forEach>
		</div>
		
		<br><br><br>
		
		<div class="mx-auto" style="height: 50%; width: 50%">
			${ dB.boardContent }
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
			      <th scope="col" style="width: 35%">작성자</th>
			      <th scope="col" style="width: 35%">내용</th>
			      <th scope="col" style="width: ">작성일</th>
			    </tr>
			    </thead>
			    <tbody id="replyTbody">
				    <c:forEach items="${ reply }" var="r">
				    	<tr>
				    		<td>${ r.refMemberUsername }</td>
				    		<td>${ r.replyContent }</td>
				    		<td>${ r.replyModifyDate }</td>
				    	</tr>
				    </c:forEach>
				</tbody>
			</table>
		</div>
	</div>
	

	
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
		
	<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
	
	<script>
	window.onload = () => {
		
	Kakao.init('e642cc213c74d7f2a652d395b7b56e6d');
	Kakao.isInitialized();
	const currUrl =	$(location).attr('href');
	const imgUrl = 	$(location).attr('href')
	function kakaoShare() {
		Kakao.Share.sendDefault({
			  objectType: 'feed',
			  content: {
			    title: '${dB.boardTitle}',
			    description: '${ fn:substring(dB.boardContent, 0, 20) }',
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
	
	
	
	

	
		document.getElementById('replyButton').addEventListener('click', () => {
		
		$.ajax({
			url: '${contextPath}/insertReply.co',
			data: {replyContent:document.getElementById('replyContent').value,
				   refBoardId:${dB.boardId},refMemberUsername:'${loginUser.memberUsername}'},
			success: (data) => {
				document.getElementById('replyContent').value = '';
				const tbody = document.getElementById('replyTbody');
				tbody.innerHTML = '';
				
				for(const r of data){
					let str ='<tr><td>'+ r.refMemberUsername +'</td>';
					 str +='<td>'+ r.replyContent +'</td>';
					str +='<td>'+ r.replyModifyDate +'</td></tr>';
					
					console.log(str);
					
					tbody.innerHTML += str;
				}
			},
			error: (data) => {
				console.log(data);
			}
			
		});
	});
	} 
	</script>
</body>
</html>