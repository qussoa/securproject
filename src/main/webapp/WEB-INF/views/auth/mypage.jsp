<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>

<c:set var="rootPath" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/views/include/include-head.jspf"%>
<script>
	$(function() {
		$("input").prop("readonly", true)

		$(document).on("click", "#btn_update", function() {
			let pass = $("#password").val()
			if (pass == "") {
				alert("수정하려면 비밀번호를 입력후 \n" + "다시 수정버튼을 클릭하세요")
				$("div.password").css("display", "block")
				$("#password").prop("readonly", false)
				$("#password").focus()
				return false;
			}
			if (pass != "") {

				let token = $

				$.ajax({
					url : '${rootPath}/user/password',
					method : 'POST',
					data : {
						password : pass,
						"${_csrf.parameterName}" : "${_csrf.token}"
					},

					success : function(result) {
						if (result == "PASS_OK") {
							$("input").prop("readonly", false)
							$("input").css("color", "blue")
							$("button#btn_save").prop("disabled", false)
							$("button#btn_update").prop("disabled", true)
						} else {
							alert("비밀번호가 일치하지 않습니다")
						}
					},
					error : function() {
						alert('서버 통신 오류')
					}
				})
			}
		})

	})
</script>
<style>
section {
	position: fixed;
	top: 70px;
	left: 0;
	width: 100%;
}

form div.password {
	display: none;
}

form input.auth {
	display: block;
}

.userlist-title h2 {
	font-weight: bold;
	color: #5c99db;
	text-align: center;
	margin-top: 30px;
}
</style>
</head>
<body>
	<%@ include file="/WEB-INF/views/include/include-nav.jspf"%>
	<section>
	
		<div class="userlist-title">
				<h2>회원정보 수정</h2>
			</div>
		

		<form:form modelAttribute="userVO" class="container">
			<hr>

			<div class="d-flex justify-content-between">
				<div class="col-3 d-flex justify-content-center">
					<img src="${rootPath}/resources/img/user.png" width="200px"
						height="200px" />
				</div>
				<div class="col-8">
					<div class="form-group">
						<label>username</label>
						<form:input path="username" class="form-control" />
					</div>
					<div class="password form-group">
						<label>password</label> <input id="password" type="password"
							placeholder="비밀번호를 입력!!" class="form-control">
					</div>
					<div class="form-group">
						<label>email</label>
						<form:input path="email" placeholder="email" class="form-control" />
					</div>
					<div class="form-group">
						<label>phone</label>
						<form:input path="phone" placeholder="phone" class="form-control" />
					</div>
					<div class="form-group">
						<label>address</label>
						<form:input path="address" placeholder="address"
							class="form-control" />
					</div>
				</div>


			</div>


			<hr>
			<div class="form-group d-flex justify-content-end">
				<button type="button" class="btn btn-primary mr-2" id="btn_update">수정</button>
				<button type="submit" class="btn btn-primary mr-2" id="btn_save">저장</button>
				<button type="submit" class="btn btn-primary" id="btn_loss_pass">비밀번호
					찾기</button>
			</div>
		</form:form>
	</section>


</body>
</html>





