component output="false" {

	variables.fsRoot = reReplaceNoCase(getBaseTemplatePath(), "\\test\\.*$", "");

	this.name = "websockets-test";
	this.applicationTimeout = createTimeSpan(0, 1, 0, 0);
	this.sessionManagement = true;
	this.sessionTimeout = createTimeSpan(0, 0, 20, 0);
	this.clientManagement = false;
	this.timeout = 50;
	this.mappings = {
		"/app": variables.fsRoot,
		"/lib": variables.fsRoot & "/lib"
	};
	/*
	this.javaSettings = {
		LoadPaths: ["C:\Program Files\Java\jdk1.8.0_101\lib\"],
		loadCFMLClassPath: true, 
		reloadOnChange: true,
		watchInterval: 2, 
		watchExtensions: "jar,class,xml"
	};
	*/
	this.tag = {
		dump: {
			format: "classic"
		}
	};

	public boolean function onApplicationStart () {
		
		return(true);
	}
	
	public void function onApplicationEnd (
		struct applicationScope={}) {
		
		return;
	}

	public void function onSessionStart () {
		
		return;
	}

	public void function onSessionEnd (
		required struct sessionScope, 
		struct applicationScope={}) {
		
		return;
	}

	public boolean function onRequestStart (
		required string targetPage) {

		request.fsRoot = variables.fsRoot;
		request.urlRoot = "http://#CGI.server_name#";
		if (CGI.server_port != 80) {
			request.urlRoot &= ":#CGI.server_port#";
		}

		return(true);
	}

	public void function onRequest (
		required string targetPage) {

		include Arguments.targetPage;

	} // onRequest()

	public void function onRequestEnd () {

		return;
	} // onRequestEnd()

	public void function onCFCRequest (
		required string cfcname, 
		required string method, 
		required struct args) {

		return;
	} // onCFCRequest()
	
	public void function onError (
		required any exception, 
		required string eventName) {

		writeDump(arguments.exception);

		abort;
	} // onError()

}