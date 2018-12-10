<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>게시글 목록</title>
		<style>
/* 		table {
			margin: auto;
	    border-top: 1px solid #444444;
	    border-collapse: collapse;
		}
		
		th, td {
			border-bottom: 1px solid #444444;
    	padding: 10px;
		} */
		</style>
	</head>
	<body>
	<jsp:include page="../Layout/header.jsp"/>
		<form name="search_frm" method="post" action="Board/board_search.do">
			<select name="searchOption">
				<option value="all"><c:out value="${map.searchOption == 'all'?'selected':''}"/>제목+이름+내용</option>
				<option value="b_name"><c:out value="${map.searchOption == 'b_name'?'selected':''}"/>이름</option>
				<option value="b_content"><c:out value="${map.searchOption == 'b_content'?'selected':''}"/>내용</option>
				<option value="b_title"><c:out value="${map.searchOption == 'b_title'?'selected':''}"/>제목</option>
			</select>
			<input name="keyword" value="${map.keyword}">
			<input type="submit" value="검색">
		</form>
		${map.count }개의 게시물이 있습니다.
		<table style="margin: auto;">
			<tr>
				<th width="40px">번호</th>
				<th width="400px">제목</th>
				<th width="150px">작성자</th>
				<th width="150px">작성일</th>
				<th width="70px">조회수</th>
			</tr>
			<c:forEach items="${map.list}" var="board">
			<tr>
				<td><a href="board_view.do?no=${board.no }">${board.no }</a></td>
				<td>${board.b_title }</td>
				<td>${board.b_name }</td>
				<td>${board.b_date }</td>
				<td>${board.b_check }</td>
			</tr>
			</c:forEach>
			<tr>
				<td colspan="5" align="center">
					<c:if test="${map.boardPager.curBlock > 1}">
						<a href="javascript:list('1')">처음</a>
					</c:if>
					
					<c:if test="${map.boardPager.curBlock > 1}">
						<a href="javascript:list('${map.boardPager.prevPage}')">[이전]</a>
					</c:if>
					
					<c:forEach var="num" varStatus="nums" begin="${map.boardPager.blockBegin}" end="${map.boardPager.blockEnd}">
						<c:choose>
							<c:when test="${num == map.boardPager.curPage}">
								<span style="color: red">${num}</span>&nbsp;
							</c:when>
							<c:otherwise>
								<a href="list.do?curPage=${nums.index}">${num}</a>&nbsp;
							</c:otherwise>
						</c:choose>
					</c:forEach>
					
					<c:if test="${map.boardPager.curBlock <= map.boardPager.totBlock}">
						<a href="javascript:list('${map.boardPager.nextPage}')">[다음]</a>
					</c:if>
					
					<c:if test="${map.boardPager.curPage <= map.boardPager.totPage}">
						<a href="javascript:list('${map.boardPager.totPage}')">[끝]</a>
					</c:if>
				</td>
			</tr>
		</table>
		<div align="center" style="margin: 20px;">
			<a href="board_write.do">글 작성</a>
		</div>
	</body>
</html>