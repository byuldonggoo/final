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
</head>
<body>
    <div class="container mt-5">
    <h1 class="text-center" style="font-size:50px;">Register</h1>
    </div>
    <form action="/board/register" method="post" id="registerform">
    <div class="container w-50">
        <div class="row">
            <div class="form-group">
                <label style="font-size:30px;" class="col-form-label mt-4" for="inputDefault">Title</label>
                <input type="text" class="form-control" placeholder="" name="bdtitle">
              </div>
              <div class="form-group">
                <label style="font-size:30px;" for="exampleTextarea" class="form-label mt-4">Content</label>
                <textarea class="form-control" id="exampleTextarea" rows="10" name="content"></textarea>
              </div>
              <input type="hidden" name="writer" value="나중에"/><!-- 로그인하면 닉네임으로 작성자넣기 -->
              <input type="hidden" name="delcheck" value="N"/>
              <div class="mt-5">
                <div class="d-grid gap-2">
                    <button class="btn btn-lg btn-primary" type="submit">Submit</button>
                </div>
            </div>
        </div>
    </div>
    </form>
    </body>
