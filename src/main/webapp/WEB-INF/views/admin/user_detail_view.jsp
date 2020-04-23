<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<%@ include file="/WEB-INF/views/include/include-head.jspf"%>
<c:set var="rootPath" value="${pageContext.request.contextPath}" />

<script>
	$(function() {
		/*
		$("#auth_append").click(function(){
			let auth_input = $("<input/>",{	class:"auth",name:"auth"})
			$("div#auth_box").append(auth_input)
		})
		 */
	})
</script>
<style>
section {
	margin: 10px auto;
	width: 70%;
	justify-content: center;
}

form {
	width: 100%;
	margin: 10px auto;
}

form label {
	display: inline-block;
	width: 150px;
	text-align: right;
}

form input.auth {
	display: block;
}

.userlist-title h3 {
	font-weight: bold;
	color: #5c99db;
	text-align: center;
	margin-top: 30px;
}

img {
	width: 200px;
	height: 200px;
	margin: 0 auto;
}

.big-box {
	margin-top: 64px;
	display: flex;
}

input {
	outline: none;
	border: none;
	border-bottom: 1px solid gray;
}

</style>


<div class="userlist-title">
	<h3>회원정보수정</h3>
</div>
<hr>

<section>
	<div class="big-box d-flex justify-content-center
	">
		<div class="img-box">
			<img src="${rootPath}/resources/img/user.png" />
		</div>
		<div>
			<div class="input-boxs">
				<form:form modelAttribute="userVO">
					<div class="input-handle">
						<label for="username">UserName</label>
						<form:input path="username" readonly="true" />
					</div>
					<div class="input-handle">
						<label for="eamil">email </label>
						<form:input path="email" />
					</div>
					<div class="input-handle">
						<label for="phone">phone</label>
						<form:input path="phone" />
					</div>
					<div class="input-handle">
						<label for="address">address</label>
						<form:input path="address" />
					</div>
					<div>
						<label for="address">계정 활성화 </label>
						<form:checkbox path="enabled" />
					</div>
					<div id="auth_box" class="input-handle">
						<div class="d-flex justify-content-end">
							<button id="auth_append" type="button"
							class="btn btn-outline-primary"
							>권한 설정</button>
						</div>
						<c:if test="${not empty userVO.authorities}">
							<c:forEach items="${userVO.authorities }" var="auth">
								<input name="auth" value="${auth.authority }" class="auth">
							</c:forEach>
						</c:if>
					</div>

					<button type="button" id="btn_save" class="btn btn-outline-primary mt-2">저장</button>


				</form:form>
			</div>
		</div>
	</div>
</section>






