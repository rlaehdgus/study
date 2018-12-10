<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Board_View</title>
</head>
<body>
	<jsp:include page="../Layout/header.jsp"/>

	<table style="width: 710px; margin: auto;">
		<tr>
			<td>
				<span>제목<input type="text" name="b_title" value="${board.b_title }"/></span>
				<span style="float: right;">작성자<input type="text" name="b_name" value="${board.b_name }" readonly/></span>
			</td>
		</tr>
		<tr>
			<td colspan="2">
				<textarea name="b_content" id="editor" style="width: 700px; height: 400px;">${board.b_content }</textarea>
			</td>
		</tr>
		<tr>
			<td colspan="2">
				<input type="button" value="수정" onClick="location.href='board_update.do?no=${board.no}'"/>
			</td>
		</tr>
	</table>
</body>
</html>