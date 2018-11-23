<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<style>
		a{
			text-decoration: none;
			color: black;
			font-weight: bold;
		}
		</style>
	</head>
	<body>
		<nav>
			<c:if test="${empty member.u_id }">
					로그인을 해주세요
					<div class="gnb">
						<jsp:include page="../Member/login.jsp"/>
						<jsp:include page="../Member/join.jsp"/>
					</div>
				</c:if>
				<c:if test="${!empty member.u_id }">
					<span>${member.u_id }(${member.u_name })님 안녕하세요</span>
					<div>
						<div>
							<a href="mypage.do">마이페이지</a><br>
							<a href="logout.do">로그아웃</a>
						</div>
					</div>
				</c:if>
		</nav>
	</body>
</html>