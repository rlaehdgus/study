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
		#search_frm {
			text-align: center;
		}
		</style>
	</head>
	<body>
	<jsp:include page="../Layout/header.jsp"/>
		<form name="search_frm" id="search_frm" method="get" action="board_list.do">
			<select name="searchOption">
				<option value="n"><c:out value="${map.searchOption == null ?'':''}"/>--------- 선택 ---------</option>
				<option value="t"><c:out value="${map.searchOption eq 't'?'':''}"/>제목</option>
				<option value="c"><c:out value="${map.searchOption eq 'c'?'':''}"/>내용</option>
				<option value="w"><c:out value="${map.searchOption eq 'w'?'':''}"/>작성자</option>
				<option value="tc"><c:out value="${map.searchOption eq 'tc'?'':''}"/>제목+내용</option>
				<option value="cw"><c:out value="${map.searchOption eq 'cw'?'':''}"/>내용+작성자</option>
				<option value="tcw"><c:out value="${map.searchOption eq 'tcw'?'':''}"/>제목+내용+작성자</option>
			</select>
			<input type="text" name="keyword" value="${map.keyword}">
			<input type="submit" value="검색"><br>
			<c:if test="${map.searchOption eq 'null' }">
				${map.count }개의 게시물이 있습니다.
			</c:if>
			<c:if test="${map.searchOption ne 'null' }">
				${map.keyword }에 관한 ${map.count }개의 게시물이 검색되었습니다.
			</c:if>
		</form>
		<table id="" style="margin: auto;">
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
				<td>${board.b_joindate }</td>
				<td>${board.b_check }</td>
			</tr>
			</c:forEach>
			<tr>
				<td colspan="5" align="center">
					<c:if test="${map.boardPager.curBlock > 1}">
						<a href="board_list.do?prevPage=${map.boardPager.prevPage}">[이전]</a>
					</c:if>
					
					<c:forEach var="num" varStatus="nums" begin="${map.boardPager.blockBegin}" end="${map.boardPager.blockEnd}">
						<c:choose>
							<c:when test="${num == map.boardPager.curPage}">
								<span style="color: red">${num}</span>&nbsp;
							</c:when>
							<c:otherwise>
								<a href="board_list.do?curPage=${nums.index}">${num}</a>&nbsp;
							</c:otherwise>
						</c:choose>
					</c:forEach>
					
					<c:if test="${map.boardPager.curBlock <= map.boardPager.totBlock}">
						<a href="board_list.do?nextPage=${map.boardPager.nextPage}">[다음]</a>
					</c:if>
				</td>
			</tr>
		</table>
		<div align="center" style="margin: 20px;">
			<a href="board_write.do">글 작성</a>
		</div>
	</body>
</html>