<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<!-- Font Awesome -->
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet" />
<!-- Google Fonts -->
<link href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700&display=swap" rel="stylesheet" />
<!-- MDB -->
<link  href="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/5.0.0/mdb.min.css" rel="stylesheet" />
<style>
	*{font-family: 'Nanum Gothic', sans-serif;}
	#writeDiv{
		 margin: auto; padding: 50px; min-height: 800px;
		/* position: absolute; left:0; right:0; top:0; bottom:0; margin:auto;  */
		border: 1px solid black;
	}
	table{
		border: 4px solid lightgray;
	}
	th{
		width: 15%;
		text-align: center; 
		vertical-align: middle;
	}
	#writeImgDiv, #writeMapDiv{
		border: 1px solid black; margin-top: 100px;
		min-height: 400px; width: 600px;
	}
	td{text-align:left;}
	.text1{ align:left; width:300px; height:30px;}
	hr{
		width: 50%; margin-left: auto; margin-right: auto;
		vertical-align: middle;
	}
	
</style>
</head>
<body>
	<jsp:include page="../common/top.jsp"></jsp:include>
	<jsp:include page="../common/nav.jsp"></jsp:include>

	<div class="container text-center" id="writeDiv"  >
		<c:if test="${dB.boardType eq 'Don' }">
		<h2>모금 게시글 수정하기</h2>
		</c:if>
		<c:if test="${dB.boardType eq 'donRev' }">
		<h2>모금 후기 수정하기</h2>
		</c:if>
		<hr>
		<form action="${contextPath}/updateDonBoard.do" id="form" enctype="multipart/form-data" method="post">
			<table class="table table-sm table-bordered" style="table-layout: fixed;">
				<tr>
					<th class="table-active">제목</th>
					<td><input type="text" class="text1" name="boardTitle" required value=${ dB.boardTitle }></td>
					<th class="table-active">목표 금액</th>
					<td><input type="text" class="text1" name="fundraisingGoalPrice" required value=${ dB.fundraisingGoalPrice }></td>
				</tr>
				<tr>
					<th class="table-active">모금 마감일</th>
					<td><input type="Date" class="text1"  min="today" name="boardDeadline" required value=${ dB.boardDeadline }></td>
					
	  
					  
					<th class="table-active">모금 대상</th>
					<td>
						<select name="refCategoryId">
							<option value="1"<c:if test="${dB.refCategoryId == 1}">selected</c:if>>아동</option>
							<option value="2"<c:if test="${dB.refCategoryId == 2}">selected</c:if>>동물</option>
							<option value="3"<c:if test="${dB.refCategoryId == 3}">selected</c:if>>노인</option>
							<option value="4"<c:if test="${dB.refCategoryId == 4}">selected</c:if>>여성</option>
							<option value="5"<c:if test="${dB.refCategoryId == 5}">selected</c:if>>환경</option>
							<option value="6"<c:if test="${dB.refCategoryId == 6}">selected</c:if>>장애인</option>
						</select>
					</td>
				</tr>
				
				<tr>
					<th class="table-active">담당자</th>
					<td><input type="text" class="text1" name="managerName" required value=${ dB.managerName }></td>
					<th class="table-active">연락처</th>
					<td><input type="text" class="text1" name="managerPhone" required value=${ dB.managerPhone }></td>
				</tr>
				<c:forEach items="${ list }" var="a">
					<tr>
						<th class="table-active">이미지</th>
						<td colspan="2">${ a.originalName }</td>
						<td>
							<button type="button" class="btn btn-outline-dark btn-sm deleteAttm" id="delete-${ a.renameName }/${a.level}/${ a.attmId }">
								삭제 OFF 
							</button> 
							<input type="hidden" name="deleteAttm">
						</td>
					</tr>
				</c:forEach>
				<tr>
					<th class="table-active">이미지 추가</th>
					<td colspan="2" id="fileTd">
						<input type="file" class="form-control form-control-md" id="" name="file" multiple/>
					</td>
					<td></td>
				</tr>
				<tr>
					<th class="table-active">내용</th>
					<td colspan="3"><textarea rows="20px;" cols="120px;" name="boardContent" required>${ dB.boardContent }</textarea></td>
				</tr>
				
			</table>
			<input type="hidden" name="boardId" value="${ dB.boardId }">
			<input type="hidden" name="refMemberUsername" value="${ dB.refMemberUsername }">
			<input type="hidden" name="boardType" value="Don">
			
			<br><br>
			
			<button class="btn btn-primary" id="submitButton">수정하기</button>
		</form>
	</div>	

	<jsp:include page="../common/footer.jsp"></jsp:include>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
	<script>
		const delBtns = document.getElementsByClassName('deleteAttm');
		for(const btn of delBtns){
			btn.addEventListener('click', function(){
				const nextHidden = this.nextElementSibling;
				if(nextHidden.value == ''){	// 삭제 버튼을 누르지 않았다면(삭제 OFF)
					this.style.background = 'black';
					this.style.color = 'white';
					this.innerText = '삭제 ON';
					nextHidden.value = this.id.split("-")[1];
				}else{	// 삭제 버튼이 눌린 상태라면(삭제 ON)
					this.style.background = 'none';
					this.style.color = 'black';
					this.innerText = '삭제 OFF';
					nextHidden.removeAttribute('value');
				}
			});
		}
	
		/* const form = document.getElementById('form');
		document.getElementById('submitButton').addEventListener('click', ()=>{
			const files = document.getElementsByName('file');
			let isEmpty = true;
			for(const f of files){
				if(f.value != ''){
					isEmpty = false;
				}
			}
			
			if(!isEmpty){
				form.submit();
			}
		}); */
		
 	</script>
</body>
</html>