<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
		    		<td><a href="#"><img alt="전체" src="resources/img/total.png" width="50" height="50"></a></td>
		    		<td><a href="#"><img alt="아동" src="resources/img/children.png" width="50" height="50"></a></td>
		    		<td><a href="#"><img alt="동물" src="resources/img/animal.png" width="50" height="50"></a></td>
		    		<td><a href="#"><img alt="노인" src="resources/img/old.png" width="50" height="50"></a></td>
		    		<td><a href="#"><img alt="여성" src="resources/img/woman.png" width="50" height="50"></a></td>
		    		<td><a href="#"><img alt="환경" src="resources/img/environment.png" width="50" height="50"></a></td>
		    		<td><a href="#"><img alt="장애인" src="resources/img/disabled.png" width="50" height="50"></a></td>
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
	  				<button class="btn btn-outline-success" onclick="location.href='writeVolBoardView.vo'">봉사 글 작성</button>
	  			</td>
	  			</c:if>
	  			<td>
	        		<form class="d-flex" role="search">
	        		<input class="form-control me-2" type="search" placeholder="Search" aria-label="Search" width="150" height="25" >
	        		<button class="btn btn-outline-success" type="submit">Search</button>
	        		</form>
	  			</td>
	  		</tr>
	  	</table>
	  </section>
		
	  <div class="album py-5">
	    <div class="container">
	      <div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-3">
	       
	        <div class="col">
	          <div class="card shadow-sm">
	            <svg class="bd-placeholder-img card-img-top" width="100%" height="225" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: Thumbnail" preserveAspectRatio="xMidYMid slice" focusable="false"><title>Placeholder</title><rect width="100%" height="100%" fill="#55595c"/><text x="50%" y="50%" fill="#eceeef" dy=".3em">Thumbnail</text></svg>
	            <div class="card-body">
	            <h5>타이틀타이틀타이틀</h5>
	              <p class="card-text">여기에는 게시글 내용 잘라서 넣으면 어떄요?짧게 잘라서요 뭔지 알죠? 한줄요약같은 느낌으루다가</p>
	              <div class="d-flex justify-content-between align-items-center">
	                <div class="btn-group">
	                  <button type="button" class="btn btn-sm btn-outline-secondary">신청하기</button>
	                </div>
	                <small class="text-muted">11/23일 마감</small>
	              </div>
	            </div>
	          </div>
	        </div>
	        
	         <div class="col">
	          <div class="card shadow-sm">
	            <svg class="bd-placeholder-img card-img-top" width="100%" height="225" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: Thumbnail" preserveAspectRatio="xMidYMid slice" focusable="false"><title>Placeholder</title><rect width="100%" height="100%" fill="#55595c"/><text x="50%" y="50%" fill="#eceeef" dy=".3em">Thumbnail</text></svg>
	
	            <div class="card-body">
	            <h5>타이틀타이틀타이틀</h5>
	              <p class="card-text">여기에는 게시글 내용 잘라서 넣으면 어떄요?짧게 잘라서요 뭔지 알죠? 한줄요약같은 느낌으루다가</p>
	              <div class="d-flex justify-content-between align-items-center">
	                <div class="btn-group">
	                  <button type="button" class="btn btn-sm btn-outline-secondary">신청하기</button>
	                </div>
	                <small class="text-muted">11/23일 마감</small>
	              </div>
	            </div>
	          </div>
	        </div>
	        
	         <div class="col">
	          <div class="card shadow-sm">
	            <svg class="bd-placeholder-img card-img-top" width="100%" height="225" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: Thumbnail" preserveAspectRatio="xMidYMid slice" focusable="false"><title>Placeholder</title><rect width="100%" height="100%" fill="#55595c"/><text x="50%" y="50%" fill="#eceeef" dy=".3em">Thumbnail</text></svg>
	
	            <div class="card-body">
	            <h5>타이틀타이틀타이틀</h5>
	              <p class="card-text">여기에는 게시글 내용 잘라서 넣으면 어떄요?짧게 잘라서요 뭔지 알죠? 한줄요약같은 느낌으루다가</p>
	              <div class="d-flex justify-content-between align-items-center">
	                <div class="btn-group">
	                  <button type="button" class="btn btn-sm btn-outline-secondary">신청하기</button>
	                </div>
	                <small class="text-muted">11/23일 마감</small>
	              </div>
	            </div>
	          </div>
	        </div>
	        
	         <div class="col">
	          <div class="card shadow-sm">
	            <svg class="bd-placeholder-img card-img-top" width="100%" height="225" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: Thumbnail" preserveAspectRatio="xMidYMid slice" focusable="false"><title>Placeholder</title><rect width="100%" height="100%" fill="#55595c"/><text x="50%" y="50%" fill="#eceeef" dy=".3em">Thumbnail</text></svg>
	
	            <div class="card-body">
	            <h5>타이틀타이틀타이틀</h5>
	              <p class="card-text">여기에는 게시글 내용 잘라서 넣으면 어떄요?짧게 잘라서요 뭔지 알죠? 한줄요약같은 느낌으루다가</p>
	              <div class="d-flex justify-content-between align-items-center">
	                <div class="btn-group">
	                  <button type="button" class="btn btn-sm btn-outline-secondary">신청하기</button>
	                </div>
	                <small class="text-muted">11/23일 마감</small>
	              </div>
	            </div>
	          </div>
	        </div>
	        
	         <div class="col">
	          <div class="card shadow-sm">
	            <svg class="bd-placeholder-img card-img-top" width="100%" height="225" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: Thumbnail" preserveAspectRatio="xMidYMid slice" focusable="false"><title>Placeholder</title><rect width="100%" height="100%" fill="#55595c"/><text x="50%" y="50%" fill="#eceeef" dy=".3em">Thumbnail</text></svg>
	
	            <div class="card-body">
	            <h5>타이틀타이틀타이틀</h5>
	              <p class="card-text">여기에는 게시글 내용 잘라서 넣으면 어떄요?짧게 잘라서요 뭔지 알죠? 한줄요약같은 느낌으루다가</p>
	              <div class="d-flex justify-content-between align-items-center">
	                <div class="btn-group">
	                  <button type="button" class="btn btn-sm btn-outline-secondary">신청하기</button>
	                </div>
	                <small class="text-muted">11/23일 마감</small>
	              </div>
	            </div>
	          </div>
	        </div>
	        
	         <div class="col">
	          <div class="card shadow-sm">
	            <svg class="bd-placeholder-img card-img-top" width="100%" height="225" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: Thumbnail" preserveAspectRatio="xMidYMid slice" focusable="false"><title>Placeholder</title><rect width="100%" height="100%" fill="#55595c"/><text x="50%" y="50%" fill="#eceeef" dy=".3em">Thumbnail</text></svg>
	
	            <div class="card-body">
	            <h5>타이틀타이틀타이틀</h5>
	              <p class="card-text">여기에는 게시글 내용 잘라서 넣으면 어떄요?짧게 잘라서요 뭔지 알죠? 한줄요약같은 느낌으루다가</p>
	              <div class="d-flex justify-content-between align-items-center">
	                <div class="btn-group">
	                  <button type="button" class="btn btn-sm btn-outline-secondary">신청하기</button>
	                </div>
	                <small class="text-muted">11/23일 마감</small>
	              </div>
	            </div>
	          </div>
	        </div>
	        
	         <div class="col">
	          <div class="card shadow-sm">
	            <svg class="bd-placeholder-img card-img-top" width="100%" height="225" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: Thumbnail" preserveAspectRatio="xMidYMid slice" focusable="false"><title>Placeholder</title><rect width="100%" height="100%" fill="#55595c"/><text x="50%" y="50%" fill="#eceeef" dy=".3em">Thumbnail</text></svg>
	
	            <div class="card-body">
	            <h5>타이틀타이틀타이틀</h5>
	              <p class="card-text">여기에는 게시글 내용 잘라서 넣으면 어떄요?짧게 잘라서요 뭔지 알죠? 한줄요약같은 느낌으루다가</p>
	              <div class="d-flex justify-content-between align-items-center">
	                <div class="btn-group">
	                  <button type="button" class="btn btn-sm btn-outline-secondary">신청하기</button>
	                </div>
	                <small class="text-muted">11/23일 마감</small>
	              </div>
	            </div>
	          </div>
	        </div>
	        
	         <div class="col">
	          <div class="card shadow-sm">
	            <svg class="bd-placeholder-img card-img-top" width="100%" height="225" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: Thumbnail" preserveAspectRatio="xMidYMid slice" focusable="false"><title>Placeholder</title><rect width="100%" height="100%" fill="#55595c"/><text x="50%" y="50%" fill="#eceeef" dy=".3em">Thumbnail</text></svg>
	
	            <div class="card-body">
	            <h5>타이틀타이틀타이틀</h5>
	              <p class="card-text">여기에는 게시글 내용 잘라서 넣으면 어떄요?짧게 잘라서요 뭔지 알죠? 한줄요약같은 느낌으루다가</p>
	              <div class="d-flex justify-content-between align-items-center">
	                <div class="btn-group">
	                  <button type="button" class="btn btn-sm btn-outline-secondary">신청하기</button>
	                </div>
	                <small class="text-muted">11/23일 마감</small>
	              </div>
	            </div>
	          </div>
	        </div>
	        
	         <div class="col">
	          <div class="card shadow-sm">
	            <svg class="bd-placeholder-img card-img-top" width="100%" height="225" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: Thumbnail" preserveAspectRatio="xMidYMid slice" focusable="false"><title>Placeholder</title><rect width="100%" height="100%" fill="#55595c"/><text x="50%" y="50%" fill="#eceeef" dy=".3em">Thumbnail</text></svg>
	
	            <div class="card-body">
	            <h5>타이틀타이틀타이틀</h5>
	              <p class="card-text">여기에는 게시글 내용 잘라서 넣으면 어떄요?짧게 잘라서요 뭔지 알죠? 한줄요약같은 느낌으루다가</p>
	              <div class="d-flex justify-content-between align-items-center">
	                <div class="btn-group">
	                  <button type="button" class="btn btn-sm btn-outline-secondary">신청하기</button>
	                </div>
	                <small class="text-muted">11/23일 마감</small>
	              </div>
	            </div>
	          </div>
	        </div>
	        
	         <div class="col">
	          <div class="card shadow-sm">
	            <svg class="bd-placeholder-img card-img-top" width="100%" height="225" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: Thumbnail" preserveAspectRatio="xMidYMid slice" focusable="false"><title>Placeholder</title><rect width="100%" height="100%" fill="#55595c"/><text x="50%" y="50%" fill="#eceeef" dy=".3em">Thumbnail</text></svg>
	
	            <div class="card-body">
	            <h5>타이틀타이틀타이틀</h5>
	              <p class="card-text">여기에는 게시글 내용 잘라서 넣으면 어떄요?짧게 잘라서요 뭔지 알죠? 한줄요약같은 느낌으루다가</p>
	              <div class="d-flex justify-content-between align-items-center">
	                <div class="btn-group">
	                  <button type="button" class="btn btn-sm btn-outline-secondary">신청하기</button>
	                </div>
	                <small class="text-muted">11/23일 마감</small>
	              </div>
	            </div>
	          </div>
	        </div>
	       
	        <div class="col">
	          <div class="card shadow-sm">
	            <svg class="bd-placeholder-img card-img-top" width="100%" height="225" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: Thumbnail" preserveAspectRatio="xMidYMid slice" focusable="false"><title>Placeholder</title><rect width="100%" height="100%" fill="#55595c"/><text x="50%" y="50%" fill="#eceeef" dy=".3em">Thumbnail</text></svg>
	
	            <div class="card-body">
	            <h5>타이틀타이틀타이틀</h5>
	              <p class="card-text">여기에는 게시글 내용 잘라서 넣으면 어떄요?짧게 잘라서요 뭔지 알죠? 한줄요약같은 느낌으루다가</p>
	              <div class="d-flex justify-content-between align-items-center">
	                <div class="btn-group">
	                  <button type="button" class="btn btn-sm btn-outline-secondary">신청하기</button>
	                </div>
	                <small class="text-muted">11/23일 마감</small>
	              </div>
	            </div>
	          </div>
	        </div>
	        
	        <div class="col">
	          <div class="card shadow-sm">
	            <svg class="bd-placeholder-img card-img-top" width="100%" height="225" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: Thumbnail" preserveAspectRatio="xMidYMid slice" focusable="false"><title>Placeholder</title><rect width="100%" height="100%" fill="#55595c"/><text x="50%" y="50%" fill="#eceeef" dy=".3em">Thumbnail</text></svg>
	
	            <div class="card-body">
	            <h5>타이틀타이틀타이틀</h5>
	              <p class="card-text">여기에는 게시글 내용 잘라서 넣으면 어떄요?짧게 잘라서요 뭔지 알죠? 한줄요약같은 느낌으루다가</p>
	              <div class="d-flex justify-content-between align-items-center">
	                <div class="btn-group">
	                  <button type="button" class="btn btn-sm btn-outline-secondary">신청하기</button>
	                </div>
	                <small class="text-muted">11/23일 마감</small>
	              </div>
	            </div>
	          </div>
	        </div>
	      </div>
	    </div>
	  </div>
	  <jsp:include page="../common/pagination.jsp"/>
	  <jsp:include page="../common/footer.jsp"/>
	</main>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
	     
	</body>
	
	
</html>
