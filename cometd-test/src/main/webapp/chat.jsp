<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script type="text/javascript" src="${pageContext.request.contextPath}/jquery/jquery-1.11.0.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/org/cometd.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/jquery/jquery.cometd.js"></script>
<script type="text/javascript" src="chat.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Chat</title>
  <script type="text/javascript">
        var config = {
            contextPath: '${pageContext.request.contextPath}'
        };
   </script>
</head>
<body>
<div id="chatDiv" style="width: 500px; height: 350px ;border: 1px solid; overflow-y:auto ; overflow-x:hidden; word-break:break-all; ">
<ul id="chatUL" style="list-style: none; margin: 5px 5px ; padding: 0px 0px ;">
</ul>
</div>
<br/>
<hr/>
<input type="text" id="messageInput" style="width: 500px;" />  
<input type="button"  value="发送"  id="sendBut"/>
</body>
</html>   