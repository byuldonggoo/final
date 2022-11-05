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
    
   <!--  <script type="text/javascript">
    
    function buttonRoute(){
    	const buttons = document.querySelectorAll('button');
    	for (let i = 0; i < buttons.length; i++) {
    		  let item = buttons[i].dataset.oper;
    		  let form = document.querySelector('form');
    		  if(item==='remove'){
    			  const link='/board/remove'
    				  form.setAttribute('action',link);
    				  form.submit();
    			  return;
    		  }
    		  else if(item==='list'){
    			  const link='/board/list'
    				  form.setAttribute('action',link);
    				  form.setAttribute('method','get');
    				  form.reset();
    				  form.submit();
    			  return;
    		  }  
    		}	
    }
    </script> -->
</head>
<body>
    <div class="container mt-5">
    <h1 class="text-center" style="font-size:50px;">Modify</h1>
    </div>
    <form action="/board/modify" method="post" id="registerform">
    <div class="container w-50">
        <div class="row">
             <div class="form-group">
                <label style="font-size:30px;" class="col-form-label mt-4" for="inputDefault">Title</label>
                <input type="text" class="form-control" name="bdtitle" value="${board.bdtitle }">
              </div>
              <div class="form-group">
                <label style="font-size:30px;" for="exampleTextarea" class="form-label mt-4">Content</label>
                <textarea class="form-control" id="exampleTextarea"rows="10" name="content">${board.content }</textarea>
              </div>
              <input type="hidden" name="writer" value="나중에"/><!-- 로그인하면 닉네임으로 작성자넣기 -->
              <input type="hidden" name="delcheck" value="N"/>
              <input type="hidden" name="bdnum" value='<c:out value ="${board.bdnum }"/>'/>
              <input type="hidden" name="pageNum" value='<c:out value ="${cri.pageNum }"/>'/>
              <input type="hidden" name="amount" value='<c:out value ="${cri.amount }"/>'/>
              
              
              <div class="row mt-5">
            <div class="col-md-4 b">
            	<div class="d-grid gap-2">
                    <button data-oper='modify' class="btn btn-lg btn-primary" type="submit">Modify</button>
                </div>
			</div>
            <div class="col-md-4 b">
            	<div class="d-grid gap-2">
                    <button data-oper='remove' class="btn btn-lg btn-primary" type="submit">Delete</button>
                </div>
            </div>
            <div class="col-md-4 b">
            	<div class="d-grid gap-2">
                    <button data-oper='list' class="btn btn-lg btn-primary" type="submit">List</button>
                </div>
            </div>
        	</div>
              
        </div>
    </div>
    </form>
   
  	<script type="text/javascript">
  	
  		$(document).ready(function(){
  			const formObj = $("form");
  			
  			$('button').on("click",function(e){
  				e.preventDefault();
  			
  			let operation=$(this).data("oper");
  			
  			console.log(operation);
  			
  			if(operation==='remove'){
  				formObj.attr("action","/board/remove");
  			}else if(operation==='list'){
  				formObj.attr("action","/board/list").attr("method","get");
  				const pageNumTag=$("input[name='pageNum']").clone();
  				const amountTag=$("input[name='amount']").clone();
  				
  				formObj.empty();
  				formObj.append(pageNumTag);
  				formObj.append(amountTag);
  			}
  			formObj.submit();
  			});
  		});
  	</script>
   
   
    </body>
