<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="f" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>글 작성</title>
	</head>
	<body>
		<f:form modelAttribute="boardVo" action="write_add.do" method="POST">
			<div>
				<span>제목</span><input type="text" name="b_title" />
			</div>
			<div>
				<span>작성자</span><input type="text" name="b_name" />
			</div>
			<div>
				
			</div>
		</f:form>
	</body>
</html>