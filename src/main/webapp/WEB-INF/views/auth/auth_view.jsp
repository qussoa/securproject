<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/views/include/include-head.jspf"%>
<style>
#body {
	position: fixed;
	top: 60px;
	left: 0;
	width: 100%;
}
</style>
</head>
<body>
	<%@ include file="/WEB-INF/views/include/include-nav.jspf"%>

	<section id="body">
		<h1>로그인 동적 정보 보기</h1>
		<sec:authorize access="isAnonymous()">
			<p>로그인 비활성화 상태</p>
		</sec:authorize>
		<sec:authorize access="isAuthenticated()">
			<h3>로그인 활성화 상태</h3>
			<p>Principal : <sec:authentication property="principal"/>
			<p>User name : <sec:authentication property="principal.username"/>
			<p>User password : <sec:authentication property="principal.password"/>
			<p>User email : <sec:authentication property="principal.email"/>
			<p>User phone : <sec:authentication property="principal.phone"/>
			<p>User address : <sec:authentication property="principal.address"/>
		</sec:authorize>
		
		<sec:authorize access="hasRole('ROLE_ADMIN')">
			<p>관리자 로그인 활성화 상태</p>
		</sec:authorize>
		
		<sec:authorize access="hasRole('ROLE_USER')">
			<p>사용자 로그인 활성화 상태</p>
		</sec:authorize>
		
		<sec:authorize access="hasAnyRole('ROLE_ADMIN','ROLE_USER')">
			<p>관리자 또는 사용자 로그인 활성화 상태</p>
		</sec:authorize>
	</section>
</body>
</html>