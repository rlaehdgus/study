<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<style>
		#wrap {
			float: left;
			padding-right: 10px;
		}
		</style>
	</head>
	<body>
		<div>
			<header>
			<c:if test="${empty member.u_id }">
				<div style="float: right;">
					<jsp:include page="../Member/login.jsp"/>
					<jsp:include page="../Member/join.jsp"/>
				</div>
			</c:if>
			<c:if test="${!empty member.u_id }">
				<div style="float: right; padding-right: 10px;">
					<a href="mypage.do">마이페이지</a>
					<a href="logout.do">로그아웃</a>
				</div>
			</c:if>
				<h2><a href="/main.do">Spring Study</a></h2>
			</header>
		
			<jsp:include page="../Layout/gnb.jsp"/>
		</div>
	</body>
</html>