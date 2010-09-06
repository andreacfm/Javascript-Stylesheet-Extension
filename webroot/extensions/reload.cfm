<!--- Parameters --->
<cfset exp="this extension is experimental and will no longer work with the final release of railo 3.1, it is not allowed to use this extension in a productve enviroment.">
<cfset rootURL="http://#CGI.server_name#:#CGI.server_port#/extensions/">
<cfset root="/extensions">
<cfset zipFileLocation = 'ext/CfJavascript-CFStyleSheet.zip'>

<!--- Read Config --->
<cffile action="read" file="zip://#expandPath(zipFileLocation)#!/config.xml" variable="config">
<cfset info = XMLParse(config)>

<!--- Read unames --->
<cffile action="read" file="#expandPath(root)#/unames.xml" variable="unames">
<cfset unames = XMLParse(unames)>

<cfadmin 
		action="updateExtension" 
		type="server" 
		password="#unames.config.server.password.XMLtext#"
		provider="#rootURL#ExtensionProvider.cfc"
		id="#info.config.info.id.XMLtext#"
		version="#info.config.info.version.XMLtext#" 
		name="#info.config.info.version.XMLtext#" 
		label="#info.config.info.label.XMLtext#"
		description="#info.config.info.version.XMLtext#" 
		category="#info.config.info.category.XMLtext#"
		author="#info.config.info.author.XMLtext#"
		codename="#info.config.info.version.XMLtext#"
		image=""
		video=""
		support=""
		documentation=""
		forum=""
		mailinglist=""
		network=""
	    _type="#info.config.info.type.XMLtext#"
/>		

<!--- 
<cfadmin action="restart" type="server" password="universe" />
 --->