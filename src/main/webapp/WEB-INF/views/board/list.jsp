<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="${path}/resources/css/bootstrap.min.css">
     <script type="text/javascript" src="${path}/resources/js/jquery-3.6.0.min.js"></script>

<style>

@import url('https://fonts.googleapis.com/css2?family=Poor+Story&display=swap');

 h3{
        font-family: 'Poor Story', sans-serif;
        font-size:27px;
  }
 #regbtn{
 font-family: 'Poor Story', sans-serif;
 font-size:20px;
 }
 #regbtn:hover{
 opacity:0.7;
 }
 
 a{
 	text-decoration: none;
 }
 
 a:hover{
 	text-decoration:underline;
 }

</style>  

<script type="text/javascript">

function doAction() {
	const registerButton = document.getElementById("regbtn");
	registerButton.addEventListener('click', () => {
		location.href ='/board/register';
	    });
  };

</script>

    
</head>
<body>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.min.js" integrity="sha384-IDwe1+LCz02ROU9k972gdyvl+AESN10+x7tBKgc9I5HFtuNz0wWnPclzo6p9vxnk" crossorigin="anonymous"></script>
    
    <nav class="navbar navbar-expand-lg navbar-dark bg-primary">
        <div class="container-fluid">
          <a class="navbar-brand" href="#">Navbar</a>
          <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarColor01" aria-controls="navbarColor01" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
          </button>
          <div class="collapse navbar-collapse" id="navbarColor01">
            <ul class="navbar-nav me-auto">
              <li class="nav-item">
                <a class="nav-link active" href="#">Home
                  <span class="visually-hidden">(current)</span>
                </a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="#">Features</a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="#">Pricing</a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="#">About</a>
              </li>
              <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" data-bs-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">Dropdown</a>
                <div class="dropdown-menu">
                  <a class="dropdown-item" href="#">Action</a>
                  <a class="dropdown-item" href="#">Another action</a>
                  <a class="dropdown-item" href="#">Something else here</a>
                  <div class="dropdown-divider"></div>
                  <a class="dropdown-item" href="#">Separated link</a>
                </div>
              </li>
            </ul>
            <form class="d-flex">
	            <div class="form-group">
			      <select class="form-select" id="exampleSelect1">
			        <option>Title</option>
			        <option>Content</option>
			        <option>Writer</option>
			      </select>
			    </div>
              <input class="form-control me-sm-2" type="text" placeholder="Search">
              <button class="btn btn-secondary my-2 my-sm-0" type="submit">Search</button>
            </form>
          </div>
        </div>
      </nav>

<div class="container mt-5">
	<div class="row">
		<div class="col-md-2 mb-2" style="margin-left:1180px;">
		<button type="button" class="btn btn-primary btn-lg" id="regbtn" onclick="doAction()">새글 등록</button>
		</div>
	</div>
    <div class="row">
    <c:forEach items="${list}" var="board">
        <div class="col-md-4 b">
            <div class="card mb-3">
                <h3 class="card-header"><a class='move' href='<c:out value="${board.bdnum}"/>'><c:out value="${board.bdtitle}"/></a></h3>
                <img src="${path}/resources/img/parrot.jpg" class="d-block user-select-none" width="100%" height="100%" aria-label="Placeholder: Image cap" focusable="false" role="img" preserveAspectRatio="xMidYMid slice" viewBox="0 0 318 180" style="font-size:1.125rem;text-anchor:middle">
                    <rect width="100%" height="100%" fill="#868e96"></rect>
                </img>
            </div>
        </div>
        </c:forEach>
       
    </div>
</div>

<!-- 페이지번호 -->

<div class="container mb-5">
    <ul class="pagination float-end">
    
      <li id="prev" class="page-item"> <!-- disabled -->
        <a class="page-link page" href="${pageMaker.startPage -1 }">&laquo;</a>
      </li>
      
      <c:forEach var="num" begin="${pageMaker.startPage }" end="${pageMaker.endPage }">
      <li class="page-item ${pageMaker.cri.pageNum == num ? "active":"" }"> <!-- 클릭한 페이지 클래스추가 active (검은색으로 바뀜)  -->
        <a class="page-link page" href="${num }">${num }</a>
      </li>
      </c:forEach>
      
      <li id="next" class="page-item">
        <a class="page-link page" href="${pageMaker.endPage +1 }">&raquo;</a>
      </li>
    </ul>
</div>

<form id='actionForm' action="/board/list" method='get'>
	<input type='hidden' name='pageNum' value='${pageMaker.cri.pageNum }'>
	<input type='hidden' name='amount' value='${pageMaker.cri.amount }'>
</form>

<!-- 모달창 -->

<div class="modal" id="listModal">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">Modal title</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close">
          <span aria-hidden="true"></span>
        </button>
      </div>
      <div class="modal-body">
        <p>처리가 완료되었습니다.</p>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-primary">Save changes</button>
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>


<script type="text/javascript">

$(document).ready(function(){
	
	//모달창 글등록
	let result='<c:out value="${result}"/>';
	checkModal(result);
	
	function checkModal(result){
		if(result==='' || history.state){
			return;
		}
		if(parseInt(result)>0){
			$(".modal-body").html(
			"게시글 " + parseInt(result) + "번이 등록되었습니다.");
		}
		$("#listModal").modal("show");
	}
	
	//prev,next버튼 disabled 클래스추가 조건
	const prev='<c:out value="${pageMaker.prev}"/>';
	const next='<c:out value="${pageMaker.next}"/>';
	console.log(prev);
	console.log(next);
	prevcheck(prev);
	nextcheck(next);
	
	function prevcheck(prev){
		if(prev!=='true'){
			$("#prev").addClass('disabled');
		}
	}
	
	function nextcheck(next){
		if(next!=='true'){
			$("#next").addClass('disabled');
		}
	}
	
	const actionForm = $("#actionForm");
	$(".page").on("click",function(e){
		e.preventDefault();
		actionForm.find("input[name='pageNum']").val($(this).attr("href"));
		actionForm.submit();
	});
	
	$(".move").on("click",function(e){
		e.preventDefault();
		actionForm.append("<input type='hidden' name='bdnum' value='" + $(this).attr("href") + "'>");  
		actionForm.attr("action","/board/get");
		actionForm.submit();
	});
});

</script>


</body>
</html>