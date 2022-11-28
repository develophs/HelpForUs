<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!doctype html>				<!--후기게시판 메인  -->
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
	
    <!-- Favicons -->
<link rel="apple-touch-icon" href="/docs/5.2/assets/img/favicons/apple-touch-icon.png" sizes="180x180">
<link rel="icon" href="/docs/5.2/assets/img/favicons/favicon-32x32.png" sizes="32x32" type="image/png">
<link rel="icon" href="/docs/5.2/assets/img/favicons/favicon-16x16.png" sizes="16x16" type="image/png">
<link rel="manifest" href="/docs/5.2/assets/img/favicons/manifest.json">
<link rel="mask-icon" href="/docs/5.2/assets/img/favicons/safari-pinned-tab.svg" color="#712cf9">
<link rel="icon" href="/docs/5.2/assets/img/favicons/favicon.ico">
<meta name="theme-color" content="#712cf9">


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
     .btn-group {background: rgb(26, 188, 156); align:right;}
	#boardAlign{
		float: left;
	}
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
		    		<td><a href="revBoardList.re?category=0"><img alt="전체" src="https://cdn-icons-png.flaticon.com/512/1598/1598191.png" width="50" height="50"></a></td>
		    		<td><a href="revBoardList.re?category=1"><img alt="아동" src="https://cdn-icons-png.flaticon.com/512/4540/4540679.png" width="50" height="50"></a></td>
		    		<td><a href="revBoardList.re?category=2"><img alt="동물" src="https://cdn-icons-png.flaticon.com/512/489/489399.png" width="50" height="50"></a></td>
		    		<td><a href="revBoardList.re?category=3"><img alt="노인" src="https://cdn-icons-png.flaticon.com/512/864/864481.png" width="50" height="50"></a></td>
		    		<td><a href="revBoardList.re?category=4"><img alt="여성" src="https://cdn-icons-png.flaticon.com/512/2585/2585340.png" width="50" height="50"></a></td>
		    		<td><a href="revBoardList.re?category=5"><img alt="환경" src="https://cdn-icons-png.flaticon.com/512/3904/3904971.png" width="50" height="50"></a></td>
		    		<td><a href="revBoardList.re?category=6"><img alt="장애인" src="https://cdn-icons-png.flaticon.com/512/1467/1467285.png" width="50" height="50"></a></td>
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
	  			<td>
	        		<form class="d-flex" role="search" action="${ contextPath }/revBoardList.re">
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
	       <c:forEach items="${ rList }" var="r">
	        <div class="col">
	          <div class="card shadow-sm cards">
	          	<c:set var="fileO" value="false"/>
	          	<c:set var="isBreak" value="true"/>
	          	<c:set var="imageName"/>
	          	<c:if test="${ isBreak }">
		          	<c:forEach items="${ aList }" var="a">
			          	<c:if test="${ r.boardId eq a.boardId }">
			          		<c:set var="fileO" value="true"/>
			          		<c:set var="isBreak" value="false"/>
			          		<c:set var="imageName" value="${ a.renameName }"/>
			            </c:if>
		            </c:forEach>
		            <c:if test="${ fileO }">
		            	<img src="resources/uploadFiles/${ imageName }" class="card-img-top" alt="..." width="100%" height="225">
		            </c:if>
		            <c:if test="${ !fileO }">
		            	<svg class="bd-placeholder-img card-img-top" width="100%" height="225" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: Thumbnail" preserveAspectRatio="xMidYMid slice" focusable="false"><title>Placeholder</title><rect width="100%" height="100%" fill="#55595c"/><text x="50%" y="50%" fill="#eceeef" dy=".3em">Thumbnail</text></svg>
		            </c:if>
	            </c:if>
	            <div class="card-body">
	           
	            <h5>
	             <c:if test="${ r.boardType eq 'volRev'}">
	            	[봉사후기]
	            </c:if>
	            <c:if test="${ r.boardType eq 'donRev'}">
	            	[기부후기]
	            </c:if>
	            ${ fn:substring(r.boardTitle, 0, 15) }</h5>
	            	<c:set var="content" value="${ fn:substring(r.boardContent, 0, 20) }..."></c:set>
	              <p class="card-text">${ content }</p>
	              <div class="d-flex justify-content-between align-items-center">
	              	<small class="text-muted">${ r.boardId }</small>
	              </div>
	              <div class="d-flex justify-content-between align-items-center">
	              	<small class="text-muted">${ r.memberNickname }</small>
	                <small class="text-muted">${ r.boardCreateDate }</small>
	                <input id="bType" type="hidden" value="${ r.boardType }">
	                
	              </div>
	              <small class="text-muted">${ r.boardCount }</small>
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
	<script>
		window.onload = () => {

			const cards = document.getElementsByClassName('cards');
			
			for(const card of cards){
				card.addEventListener('click', function() {
					const small = this.querySelectorAll('small');
					const bId = small[0].innerText;
					const nickName = small[1].innerText;
					const bType = this.querySelector('input').value;
					
						if(bType =="donRev" ){
							location.href='${contextPath}/selectDonBoard.do?bId=' + bId+'&nickName='+nickName;
						}else{
							location.href='${contextPath}/volBoardDetail.vo?bId=' + bId+'&nickName='+nickName;
						}
						
					});
					
		
			}
		}
	</script>
	     
	</body>
	
</html>
