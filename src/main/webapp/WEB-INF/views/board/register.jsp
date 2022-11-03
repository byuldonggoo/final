<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="${path}/resources/css/bootstrap.min.css">
</head>
<body>
    <div class="container mt-5">
    <h1 class="text-center" style="font-size:50px;">Register</h1>
    </div>
    <div class="container w-50">
        <div class="row">
            <div class="form-group">
                <label style="font-size:30px;" class="col-form-label mt-4" for="inputDefault">Title</label>
                <input type="text" class="form-control" placeholder="Default input" id="inputDefault">
              </div>
              <div class="form-group">
                <label style="font-size:30px;" for="exampleTextarea" class="form-label mt-4">Content</label>
                <textarea class="form-control" id="exampleTextarea" rows="10"></textarea>
              </div>
              <div class="mt-5">
                <div class="d-grid gap-2">
                    <button class="btn btn-lg btn-primary" type="button">Submit</button>
                  </div>
            </div>
        </div>
    </div>
