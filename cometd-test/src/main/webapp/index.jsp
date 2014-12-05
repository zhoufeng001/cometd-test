<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html;charset=utf-8" />
<script type="text/javascript"
	src="${pageContext.request.contextPath}/jquery/jquery-1.11.0.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/org/cometd.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/jquery/jquery.cometd.js"></script>
<%--
    The reason to use a JSP is that it is very easy to obtain server-side configuration
    information (such as the contextPath) and pass it to the JavaScript environment on the client.
    --%>
<script type="text/javascript">
    
        var $cometd = $.cometd ;
    	$cometd.configure({
            url: "http://chat02.51rexiu.com:80/cometd?_tt_s_=1415756488150kZet_Nw2B",
            logLevel: 'debug'
        });

    	$cometd.handshake() ; 
    	 
    	$(function(){
	    	$("#publish").click(function(){
	    		$cometd.publish('/chat/notice' , {
	    			"time":"1415758358932",
	    			"chatType":"3",
	    			"msg": $("#text").val()    
	    		});
	    	});
    	});
    	
  /*   	
    	$cometd.addListener('/meta/handshake', function(handshake){
    		 if (handshake.successful === true){
    			 appendMessage("handshake success!");
    		 }
    	});
    	
    	var _connected = false ;
    	$cometd.addListener('/meta/connect', function(message){
    		 if ($cometd.isDisconnected())
    	     {
    	         _connected = false;
    	         alert("connect closed");
    	         return;
    	     }
	   		 var wasConnected = _connected;
	   		     _connected = message.successful === true;
	   		 if (!wasConnected && _connected)
	   		    {
	   		    	alert("connect success!");
	   		    	
	   		    	getmessageTask = $cometd.subscribe("/chat/giveGift/10028647" , function(message){ 
	   		    		alert(message.data);
	   		    	} ); 
	   		    } 
	   		    else if (wasConnected && !_connected)
	   		    {
	   		    	alert("connect broken");
	   		 	}
    	}); */
    </script> 
</head>
<body>

	<div id="body">
		<input type="text" id="text" />
		<input type="button" value="publish" id="publish" />
	</div>

</body>
</html>
