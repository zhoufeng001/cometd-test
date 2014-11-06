$(function(){
	
	var sendBug = $("#sendBut");
	var chatDiv = $("#chatDiv");
	var chatUL = $("#chatUL");
	var messageInput = $("#messageInput");
	var $cometd = $.cometd ;
	var getmessageTask ;
	
    var cometURL = location.protocol + "//" + location.host + config.contextPath + "/cometd";
    
	$cometd.configure({
        url: cometURL,
        logLevel: 'debug'
    });
	
	$cometd.addListener('/meta/handshake', _metaHandshake);
	$cometd.addListener('/meta/connect', _metaConnect);
	
	$cometd.handshake() ;  
	
	function _metaHandshake(handshake){
		 if (handshake.successful === true){
			 appendMessage("handshake success!");
		 }
	}
	
	var _connected = false ;
	function _metaConnect(message){
		 if ($cometd.isDisconnected())
	     {
	         _connected = false;
	         appendMessage("connect closed");
	         return;
	     }
	    var wasConnected = _connected;
	     _connected = message.successful === true;
	    if (!wasConnected && _connected)
	    {
	    	appendMessage("connect success!");
	    	getmessageTask = $cometd.subscribe("/getmessage" , receiveMessage );
	    }     
	    else if (wasConnected && !_connected)
	    {
	    	appendMessage("connect broken");
	    }
	}
	
	function receiveMessage(msgData){
		appendMessage(msgData.data.message);
	}
	
	function appendMessage(msg){
		chatUL.append("<li>" + msg  + "</li>");     
		chatDiv.prop("scrollTop " , chatUL.prop("scrollHeight")); 
	}
	
	sendBug.click(function(){  
		$cometd.publish("/getmessage" , {"message" : messageInput.val()});
	});
	
	
});