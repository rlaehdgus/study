<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="f" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>mypage</title>
	</head>
	<body>
		<jsp:include page="../Layout/header.jsp"/>
		
		<h2 align="center">mypage</h2>
		
		<f:form modelAttribute="userVo" action="user_update.do" method="POST">
			<table style="margin: auto">
				<tr>
					<td>아이디</td>
					<td><input type="text" name="u_id" value="${member.u_id}" readonly/></td>
				</tr>
				<tr>
					<td>비밀번호</td>
					<td><input type="password" name="u_pw" value="${member.u_pw}" /></td>
				</tr>
				<tr>
					<td>이름</td>
					<td><input type="text" name="u_name" value="${member.u_name}" /></td>
				</tr>
				<tr>
					<td>생년월일</td>
					<td>
						<input type="text" name="u_birth" value="${member.u_birth}" />&nbsp;
	 					<c:if test="${member.u_gende eq 'M'}">
	 						남자<input type="radio" name="u_gende" value="M" checked/>&nbsp;&nbsp;
	 						여자<input type="radio" name="u_gende" value="G" />
	 					</c:if>
	 					
	 					<c:if test="${member.u_gende eq 'G'}">
	 						남자<input type="radio" name="u_gende" value="M" />&nbsp;&nbsp;
	 						여자<input type="radio" name="u_gende" value="G" checked/>
	 					</c:if>
					</td>
				</tr>
				<tr>
					<td>이메일</td>
					<td><input type="text" name="u_email" value="${member.u_email}" /></td>
				</tr>
				<tr>
					<td>주소</td>
					<td>
						<input type="text" name="u_addr1" value="${member.u_addr1}" style="margin-bottom:3px;"/><br>
						<input type="text" name="u_addr2" value="${member.u_addr2}" />
					</td>
				</tr>
				<tr>
					<td colspan="2" align="center">
						<button type="submit" id="update_info">정보 변경</button>
					</td>
				</tr>
			</table>
		</f:form>
	</body>
</html>