<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<c:set var="rootPath" value="${pageContext.request.contextPath }" />
<html>
<head>
<%@ include file="/WEB-INF/views/include/include-head.jspf"%>
<link rel="stylesheet"
	href="${rootPath}/resources/css/admin_main.css?2020-04-09" />
<script>
	$(function(){
		$(document).on("click","#user_list",function(){
			$.get("${rootPath}/admin/user_list",function(result){
				$("#admin_content").html(result)
			})
		})
		$(document).on("click","div.tr_user",function(){
			let username = $(this).data("id")
			$.get("${rootPath}/admin/user_detail_view/"+username,function(result){
				$("#admin_content").html(result)
			})
		})
		$(document).on("click","button#btn_save",function(){
			let formdata = $("form").serialize()
			$.post("${rootPath}/admin/user_detail_view",formdata,function(result){
				$("#admin_content").html(result)
			alert("update 성공")
			})
		})
		$(document).on("click","#auth_append",function(){
			let auth_input = $("<input/>",{	class:"auth",name:"auth"})
			$("div#auth_box").append(auth_input)
		})
	})

</script>
</head>
<body>
	<%@ include file="/WEB-INF/views/include/include-nav.jspf"%>
	
	<section id="body-section">

			<ul class="nav  nav-tabs justify-content-center">
				<li class="nav-item">
				<a class="nav-link" href="#">관리자 페이지</a>
				</li>
				<li class="nav-item">
				<a class="nav-link active"  href="javascript:void(0)" id="user_list">UserList</a>
				</li>
				<li class="nav-item">
				<a class="nav-link"  href="#">Menu 1</a>
				</li>
				<li class="nav-item">
				<a class="nav-link"  href="#">Menu 2</a>
				</li>
			</ul>
	
		<article id="admin_content"></article>
		
	</section>
</body>
</html>










