<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="f" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<style> 
/* 마스크 뛰우기 */
#login_mask {  
    position:absolute;  
    z-index:9000;
    background-color:#000;  
    display:none;
    left:0;
    top:0;
} 
/* 팝업으로 뜨는 윈도우 css  */ 
.login_window{
    display: none;
    position:absolute;  
    left:50%;
    top:150px;
    margin-left: -250px;
    width:400px;
    height:250px;
    background-color:#FFF;
    z-index:10000;   
 }
 .login_close {
 		text-align: center;
    background: #ffffff;
    padding: 20px;
		position: absolute;
    top: 0;
    right: -53px;
    border: 0;
    outline: 0;
 }
 .login_window td {
 		padding: 5px;		
 }
 .login_window input[type=text] {
 		height: 25px;
 		outline: 0;
 }
 
 
</style>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript">
//<![CDATA[
    function Login(){
 
        //화면의 높이와 너비를 구한다.
        var maskHeight = $(document).height();
        var maskWidth = $(window).width();
 
        //마스크의 높이와 너비를 화면 것으로 만들어 전체 화면을 채운다.
        $('#login_mask').css({'width':maskWidth,'height':maskHeight});
 
        //애니메이션 효과 - 일단 0초동안 까맣게 됐다가 60% 불투명도로 간다.

        $("#mask").fadeIn(0);
        $('#login_mask').fadeTo('fast',0.33);
 
        //윈도우 같은 거 띄운다.
        $('.login_window').show();
    }
 
    $(document).ready(function(){
        //검은 막 띄우기
        $('.openLogin').click(function(e){
            e.preventDefault();
            Login();
        });
        
        //회원가입 클릭 시 로그인 팝업창 닫기
        $('td > .openjoin').click(function(){
        	$('.login_window').css("display","none");
        	$('#login_mask').css("display","none");
        });
 
        //닫기 버튼을 눌렀을 때
        $('.login_window .login_close').click(function (e) {
            //링크 기본동작은 작동하지 않도록 한다.
            e.preventDefault();  
            $('#login_mask, .login_window').hide();  
        });
 
        //검은 막을 눌렀을 때
        /* $('#login_mask').click(function () {
            $(this).hide();
            $('.login_window').hide();
 
        }); */
    });
    
    /* $('#join_ok').click(function(){
    	var frm = document.frm_in;    	
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
            <div id="login_mask"></div>
            <div class="login_window">
	            <div>
	            <h3 align="center">로그인</h3>
	            	<f:form modelAttribute="userVo" name="frm_in" action="login_check.do" method="POST">
	            		<table style="margin: auto; margin-top: 30px;">
	            			<tr>
	            				<td>아이디</td>
	            				<td><input type="text" name="u_id" /></td>
	            			</tr>
	            			<tr>
	            				<td>비밀번호</td>
	            				<td><input type="text" name="u_pw" /></td>
	            			</tr>
	            			<tr>
	            				<td colspan="2" align="center">
	            					<a href="#">아이디/비밀번호 찾기</a>
	            					<a href="#" class="openjoin">회원가입</a><br>
	            					<button type="submit" id="login_ok">로그인</button>
	            				</td>
	            			</tr>
	            		</table>
	            	</f:form>
	            	<button class="login_close"><span style="font-size: 30px;">X</span></button>
	            </div>
            </div>
	        <a href="#" class="openLogin">로그인</a>
        </div>
    </div>
</body>
</html>