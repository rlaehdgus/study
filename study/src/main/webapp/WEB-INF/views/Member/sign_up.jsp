<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="f" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<style> 
/* 마스크 뛰우기 */
#mask {  
    position:absolute;  
    z-index:9000;
    background-color:#000;  
    display:none;
    left:0;
    top:0;
} 
/* 팝업으로 뜨는 윈도우 css  */ 
.window{
    display: none;
    position:absolute;  
    left:50%;
    top:50px;
    margin-left: -250px;
    width:500px;
    height:500px;
    background-color:#FFF;
    z-index:10000;   
 }
 .close {
 		text-align: center;
    background: #ffffff;
    padding: 20px;
		position: absolute;
    top: 0;
    right: -53px;
    border: 0;
    outline: 0;
 }
 .window td {
 		padding: 5px;		
 }
 .window input[type=text] {
 		height: 25px;
 		outline: 0;
 }
 
 
</style>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript">
//<![CDATA[
    function wrapWindowByMask(){
 
        //화면의 높이와 너비를 구한다.
        var maskHeight = $(document).height();
        var maskWidth = $(window).width();
 
        //마스크의 높이와 너비를 화면 것으로 만들어 전체 화면을 채운다.
        $("#mask").css({"width":maskWidth,"height":maskHeight});
 
        //애니메이션 효과 - 일단 0초동안 까맣게 됐다가 60% 불투명도로 간다.

        /* $("#mask").fadeIn(0); */
        $("#mask").fadeTo("fast",0.33);
 
        //윈도우 같은 거 띄운다.
        $(".window").show();
    }
 
    $(document).ready(function(){
        //검은 막 띄우기
        $(".openMask").click(function(e){
            e.preventDefault();
            wrapWindowByMask();
        });
 
        //닫기 버튼을 눌렀을 때
        $(".window .close").click(function (e) {
            //링크 기본동작은 작동하지 않도록 한다.
            e.preventDefault();  
            $("#mask, .window").hide();  
        });
 
        //검은 막을 눌렀을 때
        /* $("#mask").click(function () {
            $(this).hide();
            $(".window").hide();
 
        }); */
    });
    
    
//]]>
</script>
</head>
<body>
    <div id ="wrap"> 
        <div id = "container">  
            <div id="mask"></div>
            <div class="window">
	            <div style="width:500px;height:500px;">
	            <h3 align="center">회원가입</h3>
	            	<f:form modelAttribute="userVo" action="user_add" method="POST">
	            		<table style="margin: auto;">
	            			<tr>
	            				<td>아이디</td>
	            				<td><input type="text" name="u_id" /></td>
	            			</tr>
	            			<tr>
	            				<td>비밀번호</td>
	            				<td><input type="text" name="u_pw" /></td>
	            			</tr>
	            			<tr>
	            				<td>이름</td>
	            				<td><input type="text" name="u_name" /></td>
	            			</tr>
	            			<tr>
	            				<td>생년월일</td>
	            				<td>
	            					<input type="text" name="u_birth" />&nbsp;
	            					남자<input type="radio" name="u_gende" value="M" />&nbsp;&nbsp;
	            					여자<input type="radio" name="u_gende" value="G" />
	            				</td>
	            			</tr>
	            			<tr>
	            				<td>이메일</td>
	            				<td><input type="text" name="" /></td>
	            			</tr>
	            			<tr>
	            				<td>주소</td>
	            				<td>
	            					<input type="text" name="u_addr1" />
	            					<input type="text" name="u_addr2" />
	            				</td>
	            			</tr>
	            			<tr>
	            				<td colspan="2">
	            					<button type="button" id="join_ok">가입완료</button>
	            				</td>
	            			</tr>
	            		</table>
	            	</f:form>
	            	<button class="close"><span style="font-size: 30px; position: relative; bottom: 5px;">X</span></button>
	            </div>
            </div>
            <table border="0" cellpadding="0" cellspacing="0" width="100%">       
	            <tr>
	              <td align="center">
	              	<a href="#" class="openMask">회원가입</a>
	              </td>
	            </tr>       
            </table>
        </div>
    </div>
</body>
</html>