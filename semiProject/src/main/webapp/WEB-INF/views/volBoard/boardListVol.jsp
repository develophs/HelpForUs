<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
    <meta name="generator" content="Hugo 0.104.2">
    <title>Album example · Bootstrap v5.2</title>

    <link rel="canonical" href="https://getbootstrap.com/docs/5.2/examples/album/">    
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
		
    <style>
      .bd-placeholder-img {
        font-size: 1.125rem;
        text-anchor: middle;
        -webkit-user-select: none;
        -moz-user-select: none;
        user-select: none;
      }

      @media (min-width: 768px) {
        .bd-placeholder-img-lg {
          font-size: 3.5rem;
        }
      }

      .b-example-divider {
        height: 3rem;
        background-color: rgba(0, 0, 0, .1);
        border: solid rgba(0, 0, 0, .15);
        border-width: 1px 0;
        box-shadow: inset 0 .5em 1.5em rgba(0, 0, 0, .1), inset 0 .125em .5em rgba(0, 0, 0, .15);
      }

      .b-example-vr {
        flex-shrink: 0;
        width: 1.5rem;
        height: 100vh;
      }

      .bi {
        vertical-align: -.125em;
        fill: currentColor;
      }

      .nav-scroller {
        position: relative;
        z-index: 2;
        height: 2.75rem;
        overflow-y: hidden;
      }

      .nav-scroller .nav {
        display: flex;
        flex-wrap: nowrap;
        padding-bottom: 1rem;
        margin-top: -1px;
        overflow-x: auto;
        text-align: center;
        white-space: nowrap;
        -webkit-overflow-scrolling: touch;
      }
     .btn-group {background: rgb(26, 188, 156);}
	#boardAlign{
		float: left;
	}
	.cards *:hover{ cursor: pointer;}
    </style>

    
  </head>
  <body >
	<jsp:include page="../common/top.jsp"></jsp:include>
	<jsp:include page="../common/nav.jsp"></jsp:include>
	<main>
	  <section class="py-5 text-center container">
	    <div class="row py-lg-5">
	    	<table>
	    		<tr align="center">
		    		<td><a href="volBoardList.vo?category=0"><img alt="전체" src="resources/img/total.png" width="50" height="50"></a></td>
		    		<td><a href="volBoardList.vo?category=1"><img alt="아동" src="resources/img/children.png" width="50" height="50"></a></td>
		    		<td><a href="volBoardList.vo?category=2"><img alt="동물" src="resources/img/animal.png" width="50" height="50"></a></td>
		    		<td><a href="volBoardList.vo?category=3"><img alt="노인" src="resources/img/old.png" width="50" height="50"></a></td>
		    		<td><a href="volBoardList.vo?category=4"><img alt="여성" src="resources/img/woman.png" width="50" height="50"></a></td>
		    		<td><a href="volBoardList.vo?category=5"><img alt="환경" src="resources/img/environment.png" width="50" height="50"></a></td>
		    		<td><a href="volBoardList.vo?category=6"><img alt="장애인" src="resources/img/disabled.png" width="50" height="50"></a></td>
	    		</tr>
	    		<tr>
		    		<th>전체</th>
		    		<th>아동</th>
		    		<th>동물</th>
		    		<th>노인</th>
		    		<th>여성</th>
		    		<th>환경</th>
		    		<th>장애인</th>
	    		</tr>
	    	</table>
	    </div>
	   <table align="right">
	  		<tr>
	  			<c:if test="${ loginUser.memberRight eq 'C' }">
	  			<td style="padding-right: 20px;">
	  				<button class="btn btn-outline-primary" onclick="location.href='writeVolBoardView.vo'">봉사 글 작성</button>
	  			</td>
	  			</c:if>
	  			<td>
	        		<form class="d-flex" role="search" action="${ contextPath }/volBoardList.vo">
	        		<input class="form-control me-2" type="search" placeholder="Search" aria-label="Search" width="150" height="25" name="search">
	        		<input type="hidden" name="page" value="${ pi.currentPage }">
	        		<input type="hidden" name="category" value="${ category }">
	        		<button class="btn btn-outline-success" type="submit">Search</button>
	        		</form>
	  			</td>
	  		</tr>
	  	</table>
	  </section>

	  <div class="album py-5">
	    <div class="container">
	      <div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-3">
	       <c:forEach items="${ vList }" var="v">
	        <div class="col">
	          <div class="card shadow-sm cards">
	          	<c:forEach items="${ aList }" var="a">
		          	<c:if test="${ v.boardId eq a.boardId }">
		            	<c:if test="${ a.originalName != '' }">
		            		<img src="resources/uploadFiles/${ a.renameName }" class="card-img-top" alt="..." height="225">
		            	</c:if>
		            	<c:set var="ch" value="ch"/>
		            </c:if>
	            </c:forEach>
	            <c:if test="${ ch != 'ch' }">
	            	<svg class="bd-placeholder-img card-img-top" width="100%" height="225" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: Thumbnail" preserveAspectRatio="xMidYMid slice" focusable="false"><title>Placeholder</title><rect width="100%" height="100%" fill="#55595c"/><text x="50%" y="50%" fill="#eceeef" dy=".3em">NO IMAGE</text></svg>
	            </c:if>
	            <div class="card-body">
	            <c:set var="content" value="${ fn:substring(v.boardTitle, 0, 25) }..."/>
	            <h5>${ v.boardTitle }</h5>
	            	<c:set var="content" value="${ fn:substring(v.boardContent, 0, 30) }..."/>
	              <p class="card-text">${ content }</p>
	              <div class="d-flex justify-content-between align-items-center">
	              	<small class="text-muted">${ v.memberNickname }</small>
	              	<small class="text-muted">${ v.boardCreateDate }</small>
	              </div>
	              <div class="d-flex justify-content-between align-items-center">
					<p></p>
	              	<small class="text-muted">${ v.boardCount }</small>
	              </div>
	              <input type="hidden" value="${ v.boardId }">
	            </div>
	          </div>
	        </div>
	        </c:forEach>
	        
	      </div>
	    </div>
	  </div>

		<ul class="pagination" style="justify-content: center;">
			<c:if test="${ pi.currentPage > 1 }">
			<li class="page-item"><c:url var="goBack" value="${ loc }">
					<c:param name="page" value="${ pi.currentPage-1 }"></c:param>
					<c:param name="category" value="${ category }"></c:param>
				</c:url> <a class="page-link" href="${ goBack }" aria-label="Previous">
					<span aria-hidden="true">&laquo;</span>
			</a></li>
			</c:if>
			<c:forEach begin="${ pi.startPage }" end="${ pi.endPage }" var="p">
				<c:url var="goNum" value="${ loc }">
					<c:param name="page" value="${ p }"></c:param>
					<c:param name="category" value="${ category }"></c:param>
				</c:url>
				<li class="page-item"><a class="page-link" href="${ goNum }">${ p }</a></li>
			</c:forEach>
			<c:if test="${ pi.currentPage < pi.maxPage }">
			<li class="page-item"><c:url var="goNext" value="${ loc }">
					<c:param name="page" value="${ pi.currentPage+1 }"></c:param>
					<c:param name="category" value="${ category }"></c:param>
				</c:url> <a class="page-link" href="${ goNext }" aria-label="Next"> <span
					aria-hidden="true">&raquo;</span>
			</a></li>
			</c:if>
		</ul>

		<jsp:include page="../common/footer.jsp"/>
	</main>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
	 
	<script>
		window.onload = () => {
			const cards = document.getElementsByClassName('cards');
			for(const card of cards){
				card.addEventListener('click', function() {
					const bId = this.querySelector('input[type="hidden"]').value;
					const nickName = this.querySelector('small').innerText;
					location.href='${contextPath}/volBoardDetail.vo?bId=' + bId + '&nickName=' + nickName;
				});
			}
		}
	</script>
	</body>
	
	
</html>
