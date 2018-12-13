<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Board_View</title>
<style>
.border-cs {

}

.lay-cs .border-cs {
	padding: 5px;
}
</style>
</head>
<body>
	<jsp:include page="../Layout/header.jsp"/>

	<table id="tbl-cs" style="width: 700px; margin: auto;">
		<tr>
			<td>
				<div class="lay-cs" style="float:left; text-align: center;">
					<div class="border-cs" align="center" style="float:left;">TITLE:</div>
					<div class="border-cs" align="center" style="float:left;">
						<span>${board.b_title }</span>
					</div>
				</div>
				
				<div class="lay-cs" style="float:right; text-align: center;">
					<div class="border-cs" align="center" style="float:left;">WRITER:</div>
					<div class="border-cs" align="center" style="float:left;">
						<span>${board.b_name }</span>
					</div>
				</div>
				
			</td>
		</tr>
		<tr>
			<td colspan="2">
				<div class="border-cs" align="center">CONTENTS</div>
				<div class="border-cs" style="width: 700px; height: 400px;">${board.b_content }</div>
			</td>
		</tr>
		<tr>
			<td colspan="2">
				<input type="button" value="수정" onClick="location.href='board_update.do?no=${board.no}'"/>
				<input type="button" value="목록" onClick="location.href='board_list.do'"/>
			</td>
		</tr>
	</table>
</body>
</html>