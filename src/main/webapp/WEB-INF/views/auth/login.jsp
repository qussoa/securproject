<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="rootPath" value="${pageContext.request.contextPath}" />

<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/views/include/include-head.jspf"%>


<link rel="stylesheet"
	href="${rootPath}/resources/css/login.css?2020-04-09" />

<script>
	$(function() {
		$(document).on("click", "button.join", function() {
			document.location.href = "${rootPath}/join"
		})
	})
</script>
</head>
<body>
	<div class="container login-container">
		<div class="row">
			<div class="col-md-6 login-form">
				<form:form action="${rootPath}/login" method="POST">

					<h3>로그인</h3>

					<div>
						<c:if test="${not empty SPRING_SECURITY_LAST_EXCEPTION}">
							<span>${SPRING_SECURITY_LAST_EXCEPTION.message}</span>
						</c:if>
					</div>
					
					<div class="form-group">
						<input id="username" name="username" type="text"
							class="form-control" placeholder="User ID">
					</div>
					<div class="form-group">
						<input type="password" class="form-control" id="password"
							name="password" placeholder="비밀번호">
					</div>
					<div class="form-group">
						<button class="login btnSubmit">로그인</button>
					</div>
					<div class="form-group">
						<a href="${rootPath}/join" class="join ForgetPwd">회원이 아니신가요?</a>
					</div>
				</form:form>
			</div>
		</div>
	</div>

</body>
</html>



