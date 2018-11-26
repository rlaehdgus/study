<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="f" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>글 작성</title>
		<script src="https://code.jquery.com/jquery-latest.js"></script>
		<script type="text/javascript" src="./resources/editor/js/HuskyEZCreator.js" charset="utf-8"></script>
	</head>
	<body>
		<f:form modelAttribute="boardVo" id="insertBoardFrm" action="write_add.do" method="POST" enctype="multipart/form-data">
			<div>
				<span>제목</span><input type="text" name="b_title" />
			</div>
			<div>
				<span>작성자</span><input type="text" name="b_name" />
			</div>
			<div>
				<textarea name="b_content" id="editor" style="width: 700px; height: 400px;"></textarea>
			</div>
			<div>
				 <input type="button" id="insertBoard" value="등록" />
			</div>
		</f:form>
	</body>
</html>
<script type="text/javascript">
    $(function(){
        //전역변수
        var obj = [];              
        //스마트에디터 프레임생성
        nhn.husky.EZCreator.createInIFrame({
            oAppRef: obj,
            elPlaceHolder: "editor",
            sSkinURI: "./resources/editor/SmartEditor2Skin.html",
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
        $("#insertBoard").click(function(){
            //id가 smarteditor인 textarea에 에디터에서 대입
            obj.getById["editor"].exec("UPDATE_CONTENTS_FIELD", []);
            //폼 submit
            $("#insertBoardFrm").submit();
        });
    });
</script>