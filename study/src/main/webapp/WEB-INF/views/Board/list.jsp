<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>게시글 목록</title>
		<style>
		table {
			margin: auto;
	    border-top: 1px solid #444444;
	    border-collapse: collapse;
		}
		
		th, td {
			border-bottom: 1px solid #444444;
    	padding: 10px;
		}
		</style>
	</head>
	<body>
	<jsp:include page="../Layout/header.jsp"/>
	
		<table style="margin: auto;">
			<tr>
				<th width="40px">번호</th>
				<th width="400px">제목</th>
				<th width="150px">작성자</th>
				<th width="150px">작성일</th>
				<th width="70px">읽은 수</th>
			</tr>
			<c:forEach items="${board}" var="board">
			<tr>
				<td><a href="view.do?no=${board.no }">${board.no }</a></td>
				<td>${board.b_title }</td>
				<td>${board.b_name }</td>
				<td>${board.b_date }</td>
				<td>${board.b_check }</td>
			</tr>
			</c:forEach>
<!-- 			<tr>
				<td colspan="5" align="center">
					
				</td>
			</tr> -->
		</table>
		<div align="center" style="margin: 20px;">
			<a href="write.do">글 작성</a>
		</div>
	</body>
</html>