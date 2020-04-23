<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<c:set var="rootPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>□□□ 나의 JSP page □□□</title>
<%@ include file="/WEB-INF/views/include/include-head.jspf"%>
<link rel="stylesheet"
	href="${rootPath}/resources/css/email.css?2020-04-09" />
<style type="text/css">
section.email_body {
	width: 80%;
	margin: 120px auto;
	display: flex;
	flex-flow: column;
	justify-content: center;
	align-items: center;
}

span#secret {
	display: none;
}
</style>
<script>
	$(function() {
		$(document).on("click", "#btn_email_ok", function() {
			let secret_key = $("span#secret").text()
			//alert(secret_key)
			let secret_value = $("input#email_ok").val()
			if (secret_value == "") {
				alert("인증코드를 입력한 후 버튼 클릭")
				$("input#email_ok").focus()
				return false
			}
			$.ajax({
				url : "${rootPath}/join/email_token_check",
				method : "POST",
				data : {
					"${_csrf.parameterName}" : "${_csrf.token}",
					secret_id : "${username}",
					secret_key : secret_key,
					secret_value : secret_value
				},
				success : function(result) {
					//alert(result)
					document.location.replace("${rootPath}/user/login")
				},
				error : function() {
					alert("서버통신오류")
				}

			})
		})
	})
</script>
</head>
<body>
	<%@ include file="/WEB-INF/views/include/include-nav.jspf"%>
	<section class="email-container">
		<div class="row">
			<div class="col-md-6 email-form">
				<h2>Email 인증</h2>
				<div class="form-group">
					<h6>Email을 인증하셔야 활성화됩니다</h6>
				</div>
				<form:form action="${rootPath}/join/join_last"
					modelAttribute="userVO">
					<div class="form-group">
						<form:input type="email" path="email" placeholder="email"
							class="form-control" />
					</div>
					<c:choose>
						<c:when test="${JOIN == 'EMAIL_OK' }">
							<div class="form-group">
								<p class="auth-input">인증 mail이 오지않았다면 재전송을 눌러주세요</p>
								<button class="email btnSubmit">email 재전송</button>
							</div>
							<div class="form-group">
								<p class="auth-input">E-mail을 열어서 인증 후 입력란에 입력해주시오</p>
							</div>
							<div class="form-group">
								<span id="secret" class="ForgetPwb">${MY_Email_Secret}</span>
							</div>
							<div class="form-group">
								<input id="email_ok" class="form-control">
							</div>
							<div class="form-group">
								<button type="button" class="email btnSubmit" id="btn_email_ok">인증하기</button>
							</div>
						</c:when>
						<c:otherwise>
							<div class="form-group">
								<button class="email btnSubmit">email 인증하기</button>
							</div>
						</c:otherwise>
					</c:choose>
				</form:form>
			</div>
		</div>
	</section>

</body>
</html>