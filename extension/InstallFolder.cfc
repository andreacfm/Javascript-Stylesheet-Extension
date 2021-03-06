<cfcomponent>
	
	<cfscript>
	variables.jar = "YuiCompGatewayExtension.jar"
	variables.jars = "#variables.jar#,yuicompressor.jar,README-yui-compressor.txt";
	variables.tags = "JavaScript,StyleSheet";
	</cfscript>


    <cffunction name="install" returntype="struct" output="no" hint="called from Railo to install application">
    	<cfargument name="error" type="struct">
        <cfargument name="path" type="string">
        <cfargument name="config" type="struct">
        
		<cfset var result = {status = true, message = ""} />
		<cfset var contextPath = getContextPath() />
				
		<cftry>			 

			<cfloop list="#variables.jars#" index="i">
				<cfadmin 
	            	action="updateJar"
	            	type="#request.adminType#"
	            	password="#session["password"&request.adminType]#"    
	            	jar="#path#lib/#i#">
			</cfloop>
            
			<cfloop list="#variables.tags#" index="i">
				<cffile action="copy" destination="#contextPath#/library/tag/" source="#path#/tags/#i#.cfc" />			
			</cfloop>
		        
			<cfsavecontent variable="temp">
				<cfoutput>
					<p>Tags correctly installed. Restart Railo.</p>
				</cfoutput>				
			</cfsavecontent>
				
			<cfset result.message = temp />
			
		<cfcatch type="any">            
			<cfset result.status = false />
			<cfset result.message = cfcatch.message />
		</cfcatch>			
        
	   </cftry>
	   
	   <cfreturn result />
	   
    </cffunction>
	
	<cffunction name="uninstall" returntype="struct" output="no" hint="called by Railo to uninstall the application">
        <cfargument name="path" type="string">
        <cfargument name="config" type="struct">
        
		<cfset var result = {status = true, message = ""} />
		<cfset var contextPath = getContextPath() />
			
		<cftry>


			<cfloop list="#variables.jars#" index="i">
				<cfadmin 
	            	action="removeJar"
	            	type="#request.adminType#"
	            	password="#session["password"&request.adminType]#"    
	            	jar="#path#lib/#i#">
			</cfloop>
            
			<cfloop list="#variables.tags#" index="i">
				<cffile action="delete" file="#path#/tags/#i#.cfc" />			
			</cfloop>
			
			<cfcatch type="any">
				<cfset result.status = false />
				<cfset result.message = cfcatch.message />				
			</cfcatch>
				
		</cftry>
		
		<cfreturn result />
	</cffunction>
	
	<cffunction name="getContextPath" access="private" returntype="string">    
		
		<cfswitch expression="#request.adminType#">
			<cfcase value="web">            
				<cfreturn expandPath('{railo-web}') />
			</cfcase>
			<cfcase value="server">            
				<cfreturn expandPath('{railo-server}') />
			</cfcase>			
		</cfswitch>
	
	</cffunction>

   
 </cfcomponent>