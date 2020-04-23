<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="/WEB-INF/views/include/include-head.jspf"%>
<c:set var="rootPath" value="${pageContext.request.contextPath }" />
<script>
	wow = new WOW({
		boxClass : 'wow', // 스크롤 이벤트를 등록할 클래스 
		animateClass : 'animated', // 기본값 animated => animate.css library 를 적용한다 
		offset : 0, // data-wow-offset 의 기본값 0 
		mobile : true, // 모바일에서 동작할 것인지 
		live : true
	})
	wow.init();
</script>

<link rel="stylesheet"
	href="${rootPath}/resources/css/intro.css?2020-04-09" />


<div class="container container-intro">
	<div>
		<span id="type-text ">[포트폴리오]</span> <span class="blinking-cursor">_</span>
	</div>
	<hr />
	<div class="row">
		<div class="col-7 d-flex justify-content-center wow fadeInLeft"
			data-wow-delay="0.5s">
			<img class="my-img" src="${rootPath}/resources/img/me.png">
		</div>
		<div
			class="col-5 d-flex flex-column justify-content-center wow fadeInRight"
			data-wow-delay="0.7s">
			<div>
				<h4 class="myname">Lee Jeong Yeon(イジョンヨン)</h4>
				<h6 class="intro-co">
					HP <span>010-4053-9404</span>
				</h6>
				<h6 class="intro-co">
					ADDR <span>광주광역시 남구 백운동</span>
				</h6>
				<h6 class="intro-co">
					EMAIL <span>qussoa@naver.com</span>
				</h6>
				<h6 class="intro-co">
					<a href="https://github.com/qussoa"> <img class="github"
						src="${rootPath}/resources/img/github.png" />
					</a> <span>https://github.com/qussoa</span>
				</h6>
			</div>
		</div>
	</div>
	<div class="wow flipInX" data-wow-delay="1.2s">
		<hr />
	</div>
	<div class="main-story">
		<div class="wow bounceInDown" data-wow-delay="1.5s">
			<h3 class="main-story-title">"[이야기]"</h3>
		</div>
		<div class="wow flipInX" data-wow-delay="1.7s">
			<span class="hash-tag">#언제나</span> <span class="hash-tag">#발전하는</span>
			<span class="hash-tag">#행복한</span> <span class="hash-tag">#개발자</span>
		</div>
	</div>
	<div class="wow flipInX" data-wow-delay="1.9s">
		<hr />
	</div>
	<div class="row d-flex justify-content-center wow bounceInDown"
		data-wow-delay="2.1s">
		<div id="carouselExampleControls" class="carousel slide test"
			data-ride="carousel">
			<div class="carousel-inner">
				<c:forEach begin="1" end="9" varStatus="vo">
					<div
						class="carousel-item 
						<c:if test="${vo.count==1}">active</c:if>
					">
						<img src="${rootPath}/resources/img/ppt/slide${vo.count}.png"
							class="d-block w-100">
					</div>
				</c:forEach>
			</div>
			<a class="carousel-control-prev" href="#carouselExampleControls"
				role="button" data-slide="prev"> <span
				class="carousel-control-prev-icon" aria-hidden="true"></span> <span
				class="sr-only">Previous</span>
			</a> <a class="carousel-control-next" href="#carouselExampleControls"
				role="button" data-slide="next"> <span
				class="carousel-control-next-icon" aria-hidden="true"></span> <span
				class="sr-only">Next</span>
			</a>
		</div>
	</div>
	<div class="wow flipInX" data-wow-offset="10">
		<hr />
	</div>

	<div class="wow flipInX" data-wow-offset="10">
		<h3 class="wow flipInX" data-wow-offset="10">약력</h3>
		<h6 class="wow flipInX" data-wow-offset="10">
			<span class="date-de">2009-03~2012.02</span> <span class="de-write">조성고등학교
				졸업</span>
		</h6>
		<h6 class="wow flipInX" data-wow-offset="10">
			<span class="date-de">2012-03 </span><span class="de-write">순천대학교
				일본어일본문화학과 입학</span>
		</h6>
		<h6 class="wow flipInX" data-wow-offset="10">
			<span class="date-de">2013-05~2015.12.29 </span><span
				class="de-write">일본 워킹홀리데이</span>
		</h6>
		<h6 class="wow flipInX" data-wow-offset="10">
			<span class="date-de">2018.10</span> <span class="de-write">JPT
				일본어자격시험 700점</span>
		</h6>
		<h6 class="wow flipInX" data-wow-offset="10">
			<span class="date-de">2018.10</span><span class="de-write">
				한국사능력검정시험 2급</span>
		</h6>
		<h6 class="wow flipInX" data-wow-offset="10">
			<span class="date-de">2019.02</span><span class="de-write">
				순천대학교 졸업</span>
		</h6>
		<h6 class="wow flipInX" data-wow-offset="10">
			<span class="date-de">2019.12 </span><span class="de-write">컴퓨터활용능력
				2급</span>
		</h6>

	</div>
	<div class="wow flipInX" data-wow-offset="10">
		<hr />
	</div>
	<div class="wow flipInX" data-wow-offset="15">
		<h3 class="text-right wow flipInX" data-wow-offset="10">보유기술</h3>
		<h5 class="text-right wow flipInX" data-wow-offset="10"
			id="text-write-title">Spring Framework</h5>
		<p class="text-right wow flipInX" data-wow-offset="10"
			id="text-write-sub">Spring Framewrok 4, 5 기반</p>
		<p class="text-right wow flipInX" data-wow-offset="10"
			id="text-write-sub">MVC 프로젝트 구축</p>
		<p class="text-right wow flipInX" data-wow-offset="10"
			id="text-write-sub">공공 DB OpenAPI 활용 프로젝트 경험</p>
		<p class="text-right wow flipInX" data-wow-offset="10"
			id="text-write-sub">Security 적용 경험</p>
		<h5 class="text-right wow flipInX" data-wow-offset="10"
			id="text-write-title">JavaScript</h5>
		<p class="text-right wow flipInX" data-wow-offset="10"
			id="text-write-sub">Web 환경 인터렉티브 구축 JS 이벤트 핸들링
		<h5 class="text-right wow flipInX" data-wow-offset="10"
			id="text-write-title">HTML5</h5>
		<p class="text-right wow flipInX" data-wow-offset="10"
			id="text-write-sub">Semantic HTML 5 Web 화면 구현
		<h5 class="text-right wow flipInX" data-wow-offset="10"
			id="text-write-title">jQuery</h5>
		<p class="text-right wow flipInX" data-wow-offset="10"
			id="text-write-sub">Ajax 활용 RESTFul Front-end 개발
		<h5 class="text-right wow flipInX" data-wow-offset="10"
			id="text-write-title">Java</h5>
		<p class="text-right wow flipInX" data-wow-offset="10"
			id="text-write-sub">Java 1.8 기반 프로그래밍 언어 활용기술
		<h5 class="text-right wow flipInX" data-wow-offset="10"
			id="text-write-title">MY-SQL</h5>
		<p class="text-right wow flipInX" data-wow-offset="10"
			id="text-write-sub">MyBatis DB와 연동하여 동적쿼리 구현 가능
		<h5 class="text-right wow flipInX" data-wow-offset="10"
			id="text-write-title">Oracle SQL</h5>
		<p class="text-right wow flipInX" data-wow-offset="10"
			id="text-write-sub">Oracle 11g 활용한 Tablespace, Table, Sequence
			작성가능 CRUD
		<p class="text-right wow flipInX" data-wow-offset="10"
			id="text-write-sub">Join, SubQuery 작성가능</p>
		<h5 class="text-right wow flipInX" data-wow-offset="10"
			id="text-write-title">Bootstrap</h5>
		<p class="text-right wow flipInX" data-wow-offset="10"
			id="text-write-sub">반응형 UI 구현 CSS3 HTML5 기반 CSS 디자인 화면구현
	</div>
</div>



<div class="wow flipInX" data-wow-offset="10">
	<hr />
</div>













