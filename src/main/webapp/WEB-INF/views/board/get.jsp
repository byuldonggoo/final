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
textarea {
    width: 100%;
    height: 6.25em;
    border: none;
    resize: none;
  }
    </style>
</head>
<body>
    
    <form action="/board/register" method="post" id="registerform">
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
                    <button data-oper='modify' class="btn btn-lg btn-primary" style="width:100%" type="button" onclick="location.href='/board/modify?bdnum=<c:out value="${board.bdnum}"/>'">Modify</button>
                </div>
                <div class="col-md-4 b">
                    <button class="btn btn-lg btn-primary" style="width:100%" type="button">Delete</button>
                </div>
                <div class="col-md-4 b">
                    <button data-oper='list' class="btn btn-lg btn-primary" style="width:100%" type="button" onclick="location.href='/board/list'">List</button>
                </div>
            </div>
        </div>
    </div>
    </form>
    </body>
