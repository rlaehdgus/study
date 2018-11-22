<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Main</title>
	</head>
	<body>
		<header>
			헤더
		</header>
		
		<nav>
		<div>
			<jsp:include page="../Member/join.jsp"/>		
		</div>
		<div>
			<jsp:include page="../Member/login.jsp"/>
		</div>
		</nav>
		
		<section>
			몸통
		</section>
		
		<footer>
			하단
		</footer>
	</body>
</html>