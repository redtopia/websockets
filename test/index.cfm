<cfsetting enablecfoutputonly="true">

<cfscript>
protocol = "ws";
if (CGI.server_port_secure)
	protocol = "wss";

uriPath = "#protocol#://#CGI.server_name#:#CGI.server_port#";

uriObject = createObject("java", "java.net.URI").init(uriPath);

ws = createObject("java", "com.bonnydoonmedia.io.WSClient", "#request.fsRoot#/com.bonnydoonmedia.io.jar").init(uriObject);

ws.setConnector("connector");
</cfscript>

<cfoutput><!doctype html>
<html>
<head>
	<title>Lucee WebSockets Test</title>
</head>
<body>
	<h1>Lucee WebSockets Test</h1>
	<cfdump var="#ws#">
</body>
</html>
</cfoutput>
