<cfSilent>
	<!---
		Switchboard Framework 1.0.6
		June 8, 2015
		
		http://switchboard.riaforge.org/
		
		Daniel Slaughter
	--->
	<cfHeader name="X-Powered-By" value="Switchboard Framework 1.0.6 (http://switchboard.riaforge.org/)" />
	<!--- SET UP DEFAULT STRUCTURE. OVERRIDE IN INDEX.CFM --->
	<cfSet sb = structNew() />
	<!--- SET UP DEFAULT VARIABLES. OVERRIDE IN SB_SETTINGS.CFM --->
	<cfParam name="sb.defaultPage" default="index" />
	<cfParam name="sb.defaultCircuit" default="" />
	<cfParam name="sb.title" default="" />
	<cfParam name="sb.content" default="" />
	<cfParam name="sb.sessionCheck" default="" />
	<cfParam name="sb.defaultSessionPath" default="" />
	<cfParam name="sb.defaultNoSessionPath" default="" />
	<cfParam name="sb.noSessionActions" default="" />
	<cfParam name="sb.anySessionActions" default="" />
	<cfParam name="sb.useController" default="true" />
	<cfParam name="sb.useModel" default="true" />
	<cfParam name="sb.useView" default="true" />
	<cfParam name="sb.useRedirect" default="" />
	<cfParam name="sb.useTemplate"default="true" />
	<cfParam name="sb.useForm" default="" />
	<cfParam name="sb.errorToEmail" default="" />
	<cfParam name="sb.errorFromEmail" default="error@#cgi.http_host#" />
	<cfParam name="sb.errorPage" default="error" />
	<cfParam name="sb.error" default="" />
	<cfParam name="sb.isLoggedIn" default="false" />
	<cfParam name="sb.isHomepage" default="false" />
	<cfParam name="sb.isDevelopment" default="false" />
	<cfParam name="sb.developmentServers" default="" />
	<cfParam name="sb.compress" default="false" />
	<cfTry>
		<!--- INCLUDE ROOT'S SETTINGS FILE --->
		<cfIf fileExists(expandPath("sb_settings.cfm"))>
			<cfInclude template="sb_settings.cfm" />
		</cfIf>
		<!--- SET UP THE PATH'S ARRAY --->
		<cfParam name="url.sb_path" default="#sb.defaultPage#" />
		<cfParam name="sb.url" default="#url.sb_path#" />
		<cfParam name="url.action" default="#sb.defaultPage#" />
		<cfSet sb.url = lCase(sb.url) />
		<cfSet url.action = lCase(url.action) />
		<!--- MOD-REWRITE (.htaccess) --->
		<cfSet sb.routing = listToArray(sb.url, "-") />
		<cfSet sb.path = sb.url />
		<!--- SET THE NUMBER OF CURCUITS ( -1 FOR THE PAGE ) --->
		<cfSet sb.circuitCount = arrayLen(sb.routing)-1 />
		<cfIf sb.circuitCount EQ 0>
			<cfSet sb.circuit = sb.defaultCircuit />
			<cfSet sb.page = sb.routing[1] />
		<cfElse>
			<cfSet sb.path = listDeleteAt(sb.path, listLen(sb.path, "-"), "-") />
			<cfSet sb.circuit = sb.defaultCircuit />
			<cfLoop list="#sb.path#" delimiters="-" index="sb.loopIndex">
				<cfSet sb.circuit = sb.circuit & sb.loopIndex & "/" />
			</cfLoop>
			<cfSet sb.page = sb.routing[sb.circuitCount+1] />
		</cfIf>
		<!--- CHECK TO MAKE SURE URL IS NOT CALLING A CIRCUIT WHICH IS REALLY A NEW SWITCHBOARD INSTANCE --->
		<cfSet sb.remainingCircuit = "" />
		<cfLoop list="#sb.circuit#" delimiters="/" index="sb.loopIndex">
			<cfSet sb.remainingCircuit = listAppend(sb.remainingCircuit, sb.loopIndex, "/") & "/" />
			<cfIf fileExists(expandPath("#sb.remainingCircuit#sb_core.cfm"))>
				<cfSet sb.error = "CORE" />
			</cfIf>
		</cfLoop>
		<cfIf sb.error NEQ "CORE">
			<cfSet sb.includedFiles = 0 />
			<!--- INCLUDE SETTINGS, IF NOT ROOT --->
			<cfSet sb.remainingCircuit = "" />
			<cfLoop list="#sb.circuit#" delimiters="/" index="sb.loopIndex">
				<cfSet sb.remainingCircuit = listAppend(sb.remainingCircuit, sb.loopIndex, "/") & "/"  />
				<cfIf len(sb.remainingCircuit) AND fileExists(expandPath("#sb.remainingCircuit#sb_settings.cfm"))>				
					<cfInclude template="#sb.remainingCircuit#sb_settings.cfm" />
				</cfIf>
			</cfLoop>
			<!--- DETERMINE HOMEPAGE --->
			<cfIf sb.circuit EQ sb.defaultCircuit AND sb.page EQ sb.defaultPage>
				<cfSet sb.isHomepage = true />
			</cfIf>
			<!--- DETERMINE DEVELOPMENT --->
			<cfIf listFind(sb.developmentServers, cgi.http_host)>
				<cfSet sb.isDevelopment = true />
			</cfIf>
			<!--- DETERMINE LOGGEDIN --->
			<cfIf len(sb.sessionCheck)>
				<cfSet sb.isLoggedIn = isDefined(sb.sessionCheck) />
			</cfIf>
			<!--- AUTHENTICATION --->
			<cfIf len(sb.anySessionActions) AND listFind(sb.anySessionActions, sb.url)>
			<cfElseIf len(sb.sessionCheck) AND NOT listFind(sb.noSessionActions, sb.url) AND NOT isDefined(sb.sessionCheck)>
				<cfSet sb.urlList = "" />
				<cfSet sb.urlDontList = "cfid,cftoken,sb_path" />
				<cfSet sb.urlDontList = listAppend(sb.urlDontList, "action") />
				<cfLoop list="#lCase(structKeyList(url))#" index="sb.loopIndex">
					<cfIf NOT listFind(sb.urlDontList, sb.loopIndex)>
						<cfSet sb.urlList = listAppend(sb.urlList, "#encodeForUrl(sb.loopIndex)#=#encodeForUrl(url[sb.loopIndex])#", "&") />
					</cfIf>
				</cfLoop>
				<cfSet sb.urlList = replace(sb.urlList, "&", "%26", "all") />
				<cfIf cgi.request_method EQ "POST">
					<cfLocation url="#sb.defaultNoSessionPath#" addtoken="false" />
				<cfElseIf find("?", sb.defaultNoSessionPath)>
					<cfLocation url="#sb.defaultNoSessionPath#&goto=#sb.url#.htm%3F#sb.urlList#" addtoken="false" />
				<cfElse>
					<cfLocation url="#sb.defaultNoSessionPath#?goto=#sb.url#.htm%3F#sb.urlList#" addtoken="false" />
				</cfIf>
				<cfAbort />
			<cfElseIf len(sb.sessionCheck) AND listFind(sb.noSessionActions, sb.url) AND isDefined(sb.sessionCheck)>
				<cfLocation url="#sb.defaultSessionPath#" addtoken="false" />
	            <cfAbort />
			</cfIf>
			<!--- INCLUDE SWITCH --->
			<cfIf fileExists(expandPath("#sb.circuit#sb_switch.cfm"))>
				<cfInclude template="#sb.circuit#sb_switch.cfm" />
			</cfIf>
			<!--- USE FORM LOGIC --->
			<cfIf len(sb.useForm) AND cgi.request_method NEQ "POST">
				<cfLocation url="#sb.useForm#" addtoken="false" />
				<cfAbort />
			</cfIf>
	        <cfSaveContent variable="sb.content">
	            <!--- INCLUDE CONTROLLER FILE --->
	            <cfIf sb.useController AND fileExists(expandPath("#sb.circuit#controller/#sb.page#.cfm"))>
	                <cfInclude template="#sb.circuit#controller/#sb.page#.cfm" />
	                <cfSet sb.includedFiles = sb.includedFiles + 1 />
	            </cfIf>
	            <!--- INCLUDE MODEL FILE --->
	            <cfIf sb.useModel AND fileExists(expandPath("#sb.circuit#model/#sb.page#.cfm"))>
	                <cfInclude template="#sb.circuit#model/#sb.page#.cfm" />
	                <cfSet sb.includedFiles = sb.includedFiles + 1 />
	            </cfIf>
	        </cfSaveContent>
	        <cfSaveContent variable="sb.content">
	            <cfIf sb.isDevelopment AND len(trim(sb.content))>
	                <div class="sb_development">
	                    <strong>The following information is only displayed on the development server</strong>
	                    <hr />
	                    <cfOutput>#sb.content#</cfOutput>
	                    <hr />
	                </div>
	            </cfIf>
	            <!--- INCLUDE VIEW FILE --->
	            <cfIf sb.useView AND fileExists(expandPath("#sb.circuit#view/#sb.page#.cfm"))>
	                <cfInclude template="#sb.circuit#view/#sb.page#.cfm" />
	                <cfSet sb.includedFiles = sb.includedFiles + 1 />
	            </cfIf>
	        </cfSaveContent>
			<cfSet sb.remainingCircuit = sb.circuit />
			<cfIf sb.includedFiles EQ 0>
				<!--- NO CASE IN SWITCH FOR sb.PAGE AND NO FILES FOR PAGE --->
				<cfIf directoryExists(expandPath(sb.circuit))>
					<!--- CIRCUIT EXISTS, PAGE DOESN'T --->
					<cfSet sb.error = "NOPAGE" />
				<cfElse>
					<!--- CIRCUIT DOESN'T EXIST --->
					<cfSet sb.error = "NOCIRCUIT" />
				</cfIf>
			<cfElse>
				<cfSet sb.content = trim(sb.content) />
			</cfIf>
			<!--- REDIRECT LOGIC --->
			<cfIf len(sb.useRedirect)>
				<cfLocation url="#sb.useRedirect#" addtoken="false" />
				<cfAbort />
			</cfIf>
			<!--- LOOP THROUGH CIRCUITS BACKWARDS TO INCLUDE TEMPLATES --->
			<cfIf sb.useTemplate>
				<cfLoop from="#sb.circuitCount#" to="1" step="-1" index="sb.loopIndex">
					<cfIf fileExists(expandPath("#sb.remainingCircuit#sb_template.cfm"))>
						<cfSaveContent variable="sb.newContent">
							<cfInclude template="#sb.remainingCircuit#sb_template.cfm" />
						</cfSaveContent>
						<cfSet sb.content = trim(sb.newContent) />
					</cfIf>
					<cfSet sb.remainingCircuit = listDeleteAt(sb.remainingCircuit, sb.loopIndex, "/") & "/" />
				</cfLoop>
			</cfIf>
			<!--- INCLUDE HOME TEMPLATE --->	
			<cfIf sb.useTemplate>
				<cfIf fileExists(expandPath("sb_template.cfm"))>
					<cfSaveContent variable="sb.newContent">
						<cfInclude template="sb_template.cfm" />
					</cfSaveContent>
					<cfSet sb.content = trim(sb.newContent) />
				</cfIf>
			</cfIf>
		</cfIf>
		<cfCatch>
			<cfSet sb.error = "CATCH" />
			<cfSet sb.cfCatch = cfCatch />
		</cfCatch>
	</cfTry>
	<!--- HANDLE ERRRORS IF THEY OCCUR --->
	<cfIf len(sb.error)>
		<cfSet sb.includedErrorFiles = 0 />
		<cfTry>
			<cfIf fileExists(expandPath("#sb.circuit#controller/#sb.errorPage#.cfm"))>
				<cfSet sb.includedErrorFiles = sb.includedErrorFiles + 1 />
				<cfInclude template="#sb.circuit#controller/#sb.errorPage#.cfm" />
			<cfElseIf fileExists(expandPath("controller/#sb.errorPage#.cfm"))>
				<cfSet sb.includedErrorFiles = sb.includedErrorFiles + 1 />
				<cfInclude template="controller/#sb.errorPage#.cfm" />
			</cfIf>
			<cfIf fileExists(expandPath("#sb.circuit#model/error.cfm"))>
				<cfSet sb.includedErrorFiles = sb.includedErrorFiles + 1 />
				<cfInclude template="#sb.circuit#model/#sb.errorPage#.cfm" />
			<cfElseIf fileExists(expandPath("model/#sb.errorPage#.cfm"))>
				<cfSet sb.includedErrorFiles = sb.includedErrorFiles + 1 />
				<cfInclude template="model/#sb.errorPage#.cfm" />
			</cfIf>
			<cfSaveContent variable="sb.content">
				<cfIf fileExists(expandPath("#sb.circuit#view/error.cfm"))>
					<cfSet sb.includedErrorFiles = sb.includedErrorFiles + 1 />
					<cfInclude template="#sb.circuit#view/#sb.errorPage#.cfm" />
				<cfElseIf fileExists(expandPath("view/#sb.errorPage#.cfm"))>
					<cfSet sb.includedErrorFiles = sb.includedErrorFiles + 1 />
					<cfInclude template="view/#sb.errorPage#.cfm" />
				</cfIf>
			</cfSaveContent>
			<cfCatch>
				<!--- IGNORED --->
				<cfSet sb.includedErrorFiles = 0 />
			</cfCatch>
		</cfTry>
		<cfIf NOT sb.includedErrorFiles>
			<cfSaveContent variable="sb.content">
				<h2>An error occurred</h2>
				<cfIf isDefined("sb.cfCatch") AND listFind(sb.developmentServers, cgi.server_name)>
					<cfDump var="#sb.cfCatch#" />
				</cfIf>
			</cfSaveContent>
			<cfSet sb.content = trim(sb.content) />
		</cfIf>
		<cfTry>
			<!--- LOOP THROUGH CIRCUITS BACKWARDS TO INCLUDE TEMPLATES --->
			<cfIf sb.useTemplate>
				<cfSet sb.remainingCircuit = sb.circuit />
				<cfLoop from="#sb.circuitCount#" to="1" step="-1" index="sb.loopIndex">
					<cfIf fileExists(expandPath("#sb.remainingCircuit#sb_template.cfm"))>
						<cfSaveContent variable="sb.newContent">
							<cfInclude template="#sb.remainingCircuit#sb_template.cfm" />
						</cfSaveContent>
						<cfSet sb.content = trim(sb.newContent) />
					</cfIf>
					<cfSet sb.remainingCircuit = listDeleteAt(sb.remainingCircuit, sb.loopIndex, "/") & "/" />
				</cfLoop>
			</cfIf>
			<!--- INCLUDE HOME TEMPLATE --->
			<cfIf sb.useTemplate AND fileExists(expandPath("sb_template.cfm"))>
				<cfSaveContent variable="sb.newContent">
					<cfInclude template="sb_template.cfm" />
				</cfSaveContent>
				<cfSet sb.content = trim(sb.newContent) />
			</cfIf>
			<cfCatch>
				<!--- IGNORED --->
			</cfCatch>
		</cfTry>
	</cfIf>
	<cfIf sb.compress>
		<cfSet sb.content = reReplace(sb.content, "[\t\s\n]{1,}", " ", "all") />
	</cfIf>
	<cfSet sb.content = trim(sb.content) />
</cfSilent><cfOutput>#sb.content#</cfOutput>