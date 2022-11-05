<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@include file="../includes/header.jsp" %>

    <div class="container w-50">
        <div class="row">
            <div class="form-group">
                <label style="font-size:30px;" class="col-form-label mt-4" for="inputDefault">Title</label>
                <input type="text" class="form-control" name="bdtitle" value="${board.bdtitle }" readonly="readonly">
              </div>
        </div>
        <div class="row mt-5">
            <img src="${path}/resources/img/parrot.jpg" class="rounded img-fluid" alt="첨부이미지">
            <!--style="width:100%;height:530px; -->
        </div>
        <div class="row">
              <div class="form-group">
                <label style="font-size:30px;" for="exampleTextarea" class="form-label mt-4">Content</label>
                <textarea class="form-control" id="exampleTextarea"rows="10" name="content" readonly="readonly">${board.content }</textarea>
              </div>
        </div>
       
            <div class="row mb-5 mt-5">
                <div class="col-md-4 b">
                    <button data-oper='modify' class="btn btn-lg btn-primary" style="width:100%" type="button">Modify</button>
                </div>
                <div class="col-md-4 b">
                    <button data-oper='remove' class="btn btn-lg btn-primary" style="width:100%" type="button">Delete</button>
                </div>
                <div class="col-md-4 b">
                    <button data-oper='list' class="btn btn-lg btn-primary" style="width:100%" type="button">List</button>
                </div>
                <form id='operForm' action="/board/modify" method="get">
                	<input type="hidden" id='bdnum' name='bdnum' value='<c:out value="${board.bdnum }"/>'>
                	<input type='hidden' name='pageNum' value='<c:out value="${cri.pageNum }"/>'>
                	<input type='hidden' name='amount' value='<c:out value="${cri.amount }"/>'>
                	<input type='hidden' name='keyword' value='<c:out value="${cri.keyword }"/>'>
                	<input type='hidden' name='type' value='<c:out value="${cri.type }"/>'>
            </form>
            </div>
        </div>
        
        <script type="text/javascript">
        	$(document).ready(function(){
        		const operForm=$("#operForm");
        		
        		$("button[data-oper='modify']").on("click",function(e){
        			operForm.attr("action","/board/modify").submit();
        		});
        		
        		$("button[data-oper='list']").on("click",function(e){
        			operForm.find("#bdnum").remove()
        			operForm.attr("action","/board/list");
        			operForm.submit();
        		});
        		
        		$("button[data-oper='remove']").on("click",function(e){
        			operForm.attr("action","/board/remove").attr("method","post").submit();
        		});
        	});
        	
        </script>
    </body>
