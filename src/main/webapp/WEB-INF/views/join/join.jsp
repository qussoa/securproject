<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="rootPath" value="${pageContext.request.contextPath}" />

<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/views/include/include-head.jspf"%>
<link rel="stylesheet"
	href="${rootPath}/resources/css/join.css?2020-04-09" />


<script>
	$(function() {

		$(document).on("click", "#btn-join", function() {

			// 유효성검사
			// id, password가 입력되지 않았을때 경고
			let username = $("#username")
			let password = $("#password")
			let re_password = $("#re_password")

			if (username.val() == "") {
				alert("아이디를 입력하세요")
				username.focus()
				return false;
			}

			if (password.val() == "") {
				alert("비밀번호를 입력하세요")
				password.focus()
				return false;
			}

			if (re_password.val() == "") {
				alert("비밀번호 확인 입력하세요")
				re_password.focus()
				return false;
			}

			if (password.val() != re_password.val()) {
				alert("비밀번호와 비빌번호 확인이 다릅니다")
				password.focus()
				return false;
			}
			$("form").submit()

		})

		// 현재 입력박스에서 포커스가 벗어났을때 발생하는 이벤트
		$(document).on(
				"blur",
				"#username",
				function() {

					let username = $(this).val()

					if (username == "") {
						$("#m_username").text("아이디는 반드시 입력해야 합니다")
						$("#username").focus()
						return false;
					}

					$.ajax({

						// 데이터를 전송하기 전에 헤더에 csrf값을 설정한다
						beforeSend : function(ajaxReq) {
							ajaxReq.setRequestHeader("${_csrf.headerName}",
									"${_csrf.token}");
						},
						url : "${rootPath}/user/idcheck",
						method : "POST",
						data : {
							username : username
						},
						success : function(result) {
							if (result == "EXISTS") {

								$("#m_username").text("* 이미 가입된 사용자이름 입니다.")
								$("#m_username").css("color", "red")
								$("#username").focus()
								return false

							} else {

								$("#m_username").text("* 사용가능한 ID 입니다.")

							}
						},
						error : function() {
							$("#m_username").text("* 서버통신오류.")
							return false;
						}

					})

				})

		// 현재 DOM 화면에 class가 view_pass인 모든것에 적용
		$(".view_pass").each(
				function(index, input) {

					// 매개변수로 전달된 input을 선택하여
					// 변수 $input에 임시 저장하라
					let input_ref = $(input)
					$("input#view_pass").click(
							function() {
								let change = $(this).is(":checked") ? "text"
										: "password";
								// 가상의 input 생성
								// <input type='text'> 또는 <input type='password'>
								let ref = $("<input type='" + change + "' />")
										.val(input_ref.val()).insertBefore(
												input_ref);

								input_ref.remove();
								input_ref = ref;
							})
				})
	})
</script>
<style>
.message {
	color: #0062cc;
	font-weight: bold;
	font-size: 0.5rem;
}
</style>
</head>
<body>
	<%@ include file="/WEB-INF/views/include/include-nav.jspf"%>

	<div class="container join-container">
		<div class="row">
			<div class="col-md-6 join-form">
				<h3>회원가입</h3>
				
				<form:form method="POST" action="${rootPath}/join/join_next"
					modelAttribute="userVO">
					
					<div class="form-group">
						<form:input type="text" path="username" placeholder="사용자 ID"
							class="form-control" />
					</div>
					
					<div class="message form-group" id="m_username"></div>
					
					<div class="form-group">
						<form:input type="password" path="password"
							class="view_pass form-control" placeholder="비밀번호" />
						<input type="password" id="re_password" name="re_password"
							class="view_pass form-control" placeholder="비밀번호 재입력" >
					</div>
					<div class="option form-group">
						<label for="view_pass"> 
						<input type="checkbox"	id="view_pass" class="checkbox"> 비밀번호 보이기
						</label>
					</div>
					<div class="form-group">
						<button type="button" id="btn-join" class="btnSubmit">회원가입</button>
					</div>
					<div class="form-group">
						<a href="#" type="button" id="btn-loss" class="ForgetPwd" >아이디 또는 비밀번호를 잃어버리셨어요?</a>
					</div>
				</form:form>
			</div>
		</div>
	</div>
</body>
</html>

