<%@ page language="java" contentType="text/html; charset=utf-8"%>
 <%@ page import="mybatis.guest.model.Comment" %>   
 <%@ page import="mybatis.guest.service.CommentService" %>   

  <!-- 키에 해당하는 글번호를 넘겨받아 서비스의 메소드 호출  -->
  <% 
  long commentNo = Integer.parseInt( request.getParameter("cId"));
  Comment comment = CommentService.getInstance().selectCommentByPrimaryKey(commentNo);
  %>
     
<!DOCTYPE HTML>
<html>
<head>
	<meta charset="UTF-8">
<title> 메세지 보기 </title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script type="text/javascript">
$(document).ready(function () {
	let commentNo = <%=comment.getCommentNo()%>;
	let commentContent = '<%=comment.getCommentContent()%>';
	let regDate = '<%=comment.getRegDate()%>';

	// 1. 버튼에 이벤트 걸기
	$('#btnModify').click(function () {
	});

	$('#btnDelete').click(function () {
		$.ajax({
			type : 'get',
			url : 'deleteCommentForm.jsp?' +
					'commentNo=<%=comment.getCommentNo()%>&commentContent=<%=comment.getCommentContent()%>',
			dataType : 'html',
			success : function (data) {
				$(this).find('form').submit();
				console.log("ddddd");
				//window.location.replace("listComment.jsp");
			},
			error : function (err) {
				console.log(err);
			}
		});
	});

});
</script>
</head>
<body>
<table border="1">
		<tr><td>작성자</td><td><%=  comment.getUserId()%></td></tr>
		<tr><td>메세지</td><td><%=  comment.getCommentContent()%></td></tr>
		<tr><td>등록일</td><td><%=  comment.getRegDate()%></td></tr>
		<tr><td colspan="2">
				<input type="button" id="btnModify" value="수정" />
				<input type="button" id="btnDelete" value="삭제" />
				</td></tr>

</table>
</body>
</html>