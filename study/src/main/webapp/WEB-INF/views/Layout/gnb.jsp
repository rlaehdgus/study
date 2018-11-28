<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<style>
			a {
				text-decoration: none;
				color: black;
				font-weight: bold;
			}
			
			ul {
				list-style: none;
				margin: 0;
				padding: 0;
				text-align: center;
			}
			
			li {
				margin: 0;
				padding: 10px;
				border: 0;
				display: inline;
			}
			
			.gnb {
				margin: 30px;
			}
		</style>
	</head>
	<body>
		<nav>
			<c:if test="${member.u_id eq 'admin' }">
				<div class="gnb">
					<ul>
						<li><a href="list.do">게시판</a></li>
					</ul>
				</div>
			</c:if>
			<c:if test="${member.u_id ne 'admin' }">
				<div class="gnb">
					<ul>
						<li><a href="list.do">게시판</a></li>
						<li>미정</li>
						<li>미정</li>
						<li>미정</li>
					</ul>
				</div>
			</c:if>
		</nav>
	</body>
</html>