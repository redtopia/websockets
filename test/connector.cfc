component output="false" {

	variables.logFile = "websocket-messages";
	
	public void function onMessage (
		required string message) {

		writeLog(text="web socket message: [#message#]", file=variables.logFile);
	}

}