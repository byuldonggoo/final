<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@include file="includes/header.jsp"%>

<div class="container w-25">
	
	<form role="form" method='post' action="/login" id="loginform"> <!-- 스프링 시큐리티에서 POST방식을 이용하는 경우 기본적으로 CSRF토큰 이용.-->
	<div class="row">
	<h1 class="mt-5">Sign in</h1>
	<div>
		<p style="color:red"><c:out value="${error}"/></p>
		<p style="color:red"><c:out value="${logout}"/></p>
	</div>
		<div class="form-group">
		  <label class="col-form-label mt-4" for="inputDefault">id</label>
		  <input type="text" class="form-control" name='username' placeholder="아이디를 입력하세요" id="inputDefault" autofocus>
		</div>
	</div>
	
	<div class="row">
		<div class="form-group">
		  <label class="col-form-label mt-4" for="inputDefault">password</label>
		  <input type="password" class="form-control" name='password' placeholder="비밀번호를 입력하세요" id="inputDefault">
		</div>
		<div class="form-check form-switch mt-3">
        <input class="form-check-input" type="checkbox" id="flexSwitchCheckDefault" name='remember-me'>
        <label class="form-check-label" for="flexSwitchCheckDefault">자동 로그인</label>
        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/> <!-- CSRF토큰 -->
        <div>
        <a href="#" class="btn btn-success btn-primary mt-4" style="width:100%; background-color:#000000;">Login</a>
        </div>
      </div>
	</div>
	</form>
		
	</div>
	
	<script>
	
	$(".btn-success").on("click",function(e){
		e.preventDefault();
		$("#loginform").submit();
	})
	
	</script>

</body>
</html>