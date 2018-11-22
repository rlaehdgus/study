<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="f" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<style> 
/* 마스크 뛰우기 */
#join_mask {  
    position:absolute;  
    z-index:9000;
    background-color:#000;  
    display:none;
    left:0;
    top:0;
} 
/* 팝업으로 뜨는 윈도우 css  */ 
.join_window{
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
 .join_close {
 		text-align: center;
    background: #ffffff;
    padding: 20px;
		position: absolute;
    top: 0;
    right: -53px;
    border: 0;
    outline: 0;
 }
 .join_window td {
 		padding: 5px;		
 }
 .join_window input[type=text] {
 		height: 25px;
 		outline: 0;
 }
 
 
</style>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript">
//<![CDATA[
    function Join(){
 
        //화면의 높이와 너비를 구한다.
        var maskHeight = $(document).height();
        var maskWidth = $(window).width();
 
        //마스크의 높이와 너비를 화면 것으로 만들어 전체 화면을 채운다.
        $('#join_mask').css({'width':maskWidth,'height':maskHeight});
 
        //애니메이션 효과 - 일단 0초동안 까맣게 됐다가 60% 불투명도로 간다.

        /* $("#mask").fadeIn(0); */
        $('#join_mask').fadeTo('fast',0.33);
 
        //윈도우 같은 거 띄운다.
        $('.join_window').show();
    }
 
    $(document).ready(function(){
        //검은 막 띄우기
        $('.openjoin').click(function(e){
            e.preventDefault();
            Join();
        });
 
        //닫기 버튼을 눌렀을 때
        $('.join_window .join_close').click(function (e) {
            //링크 기본동작은 작동하지 않도록 한다.
            e.preventDefault();  
            $('#join_mask, .join_window').hide();  
        });
 
        //검은 막을 눌렀을 때
        /* $('#join_mask').click(function () {
            $(this).hide();
            $('.join_window').hide();
 
        }); */
    });
    
    /* $('#join_ok').click(function(){
    	var frm = document.frm_up;    	
    	var u_id = 	$('input[name=u_id]').val();
    	var u_pw = 	$('input[name=u_pw]').val();
    	var u_name = 	$('input[name=u_name]').val();
    	var u_birth = 	$('input[name=u_birth]').val();
    	var u_gende = 	$('input[name=u_gende]:checked').val();
    	var u_email = 	$('input[name=u_email]').val();
    	var u_addr1 = 	$('input[name=u_addr1]').val();
    	var u_addr2 = 	$('input[name=u_addr2]').val();
	
 		$.ajax({
     		url : '/user_add.do',
     		type : 'post',
     		data : {u_id:u_id, u_pw:u_pw, u_name:u_name, u_birth:u_birth, u_gende:u_gende, u_email:u_email, u_addr1:u_addr1, u_addr2:u_addr2},
     		success : function(data){
     			if(data){
     				alert('회원가입 성공!');
     				location.href('main.do');
     			}else{
     				alert('값을 제대로 입력해주세요.');
     			}
     		}
     	});
    });*/
    
//]]>
</script>
</head>
<body>
    <div id ="wrap"> 
        <div id = "container">  
            <div id="join_mask"></div>
            <div class="join_window">
	            <div style="width:500px;height:500px;">
	            <h3 align="center">회원가입</h3>
	            	<f:form modelAttribute="userVo" name="frm_up" action="user_add.do" method="POST">
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
	            				<td><input type="text" name="u_email" /></td>
	            			</tr>
	            			<tr>
	            				<td>주소</td>
	            				<td>
	            					<input type="text" name="u_addr1" style="margin-bottom:10px;" /><br/>
	            					<input type="text" name="u_addr2" />
	            				</td>
	            			</tr>
	            			<tr>
	            				<td colspan="2" align="center">
	            					<button type="submit" id="join_ok">가입완료</button>
	            				</td>
	            			</tr>
	            		</table>
	            	</f:form>
	            	<button class="join_close"><span style="font-size: 30px;">X</span></button>
	            </div>
            </div>
            <table border="0" cellpadding="0" cellspacing="0" width="100%">
	            <tr>
	              <td>
	              	<a href="#" class="openjoin">회원가입</a>
	              </td>
	            </tr>
            </table>
        </div>
    </div>
</body>
</html>