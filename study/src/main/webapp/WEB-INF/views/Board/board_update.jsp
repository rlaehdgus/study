<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="f" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Board_Update</title>
		<script src="https://code.jquery.com/jquery-latest.js"></script>
		<script type="text/javascript" src="./resources/editor/js/HuskyEZCreator.js" charset="utf-8"></script>
	</head>
	<script type="text/javascript">
	    $(function(){
	        //전역변수
	        var obj = [];              
	        //스마트에디터 프레임생성
	        nhn.husky.EZCreator.createInIFrame({
	            oAppRef: obj,
	            elPlaceHolder: "editor",
	            sSkinURI: "resources/editor/SmartEditor2Skin.html",
	            htParams : {
	                // 툴바 사용 여부
	                bUseToolbar : true,            
	                // 입력창 크기 조절바 사용 여부
	                bUseVerticalResizer : true,    
	                // 모드 탭(Editor | HTML | TEXT) 사용 여부
	                bUseModeChanger : true,
	            }
	        });
	        //전송버튼
	        $("#update").click(function(){
	            //id가 editor인 textarea에 에디터에서 대입
	            obj.getById["editor"].exec("UPDATE_CONTENTS_FIELD", []);
	            //폼 submit
	            $("#updateBoardFrm").submit();
	        });
	    });
		</script>
	<body>
		<jsp:include page="../Layout/header.jsp"/>
		
		<f:form modelAttribute="boardVo" id="updateBoardFrm" action="write_update.do" method="POST" enctype="multipart/form-data">
		<input type="hidden" name="no" value="${board.no }"/>
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
						<input type="button" id="update" value="수정"/>
						<input type="button" value="취소" onClick="location.href='board_list.do'"/>
					</td>
				</tr>
			</table>
		</f:form>
	</body>
</html>