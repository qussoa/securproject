<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="rootPath" value="${pageContext.request.contextPath}" />
<style>
.art-box {
	display: flex;
	flex-wrap: wrap;
	justify-content: center;
}

.userlist-title h3 {
	font-weight: bold;
	color: #5c99db;
	text-align: center;
	margin-top : 30px; 
	
}

img {
	width: 50px;
	margin-right: 10px;
}

.tr_user {
	border-bottom : 1px solid gray;
	border-radius: 0.5rem;
	padding: 10px;
	width: 200px;
	height: 200px;
	margin: 10px;
	flex: 0 0 auto;

}

.no_title {
	font-weight: bold;
	color: #0062cc;
}
</style>


<div class="userlist-title">
	<h3>회원리스트</h3>
</div>
<hr>

<article class="art-box">

	<c:choose>
		<c:when test="${empty userList }">

			<div class="text-center">User 정보 없음</div>

		</c:when>
		<c:otherwise>
			<c:forEach items="${userList}" var="user" varStatus="i">
				<div data-id="${user.username}" class="tr_user ">

					<div class="no_title">
						<img src="${rootPath}/resources/img/user.png"> ${i.count}
						${user.username }
					</div>
					<hr />
					<div>
						${user.email }<br /> ${user.phone }<br /> ${user.address }<br />
					</div>
				</div>
			</c:forEach>
		</c:otherwise>
	</c:choose>

</article>


