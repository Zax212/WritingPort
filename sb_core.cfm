<cfSilent>
	<!---
		Switchboard Framework 1.2.1
		May 23, 2017
		
		http://switchboard.riaforge.org/
		
		Daniel Slaughter
	--->
	<cfHeader name="X-Powered-By" value="Switchboard Framework 1.2.1 (http://switchboard.riaforge.org/)" />
	<!--- SET UP DEFAULT STRUCTURE. OVERRIDE IN INDEX.CFM --->
	<cfParam name="sb" default="#structNew()#" />
	<cfScript>
		sb.func = {
			"cacheClear": function (id=cacheGetAllIds()) {
				if (!isArray(id)) {
					id = listToArray(id);
				}
				cacheRemove(id);
				return true;
			},
			"cacheId": function () {
				return hash(cgi.script_name & "?" & cgi.query_string);
			},
			"cacheMetaData": function (id=cacheGetAllIds()) {
				var local = structNew();
				local.cacheMetaDataArray = arrayNew(1);
				if (!isArray(id)) {
					id = listToArray(id);
				}
				local.length = arrayLen(id);
				for (local.loopIndex=1; local.loopIndex<=local.length; local.loopIndex++) {
					arrayAppend(local.cacheMetaDataArray, cacheGetMetadata(id[local.loopIndex]));
					local.cacheMetaDataArray[local.loopIndex]["cacheId"] = id[local.loopIndex];
				}
				return local.cacheMetaDataArray;
			}
		};
	</cfScript>
	<cfCache action="get" id="#sb.func.cacheId()#" name="sb.content">
	<cfIf isDefined("sb.content")>
		<!--- CACHE CONTROL --->
		<cfSet variables.metaData = sb.func.cacheMetaData(sb.func.cacheId())[1] />
		<cfHeader name="Expires" value="#getHTTPTimeString(variables.metaData.lastUpdated+variables.metaData.timespan)#" />
		<cfHeader name="Cache-Control" value="max-age=#variables.metaData.timespan#,public" />
	<cfElse>
	<!--- SET UP DEFAULT VARIABLES. OVERRIDE IN SB_SETTINGS.CFM --->
	<cfParam name="sb.defaultPage" default="index" />
	<cfParam name="sb.defaultCircuit" default="" />
	<cfParam name="sb.title" default="" />
	<cfParam name="sb.content" default="" />
		<cfParam name="sb.circuit" default="" />
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
		<cfParam name="sb.useCompress" default="false" />
		<cfParam name="sb.useCache" default="false" />
		<cfParam name="sb.useSkeleton" default="false" />
		<cfParam name="sb.cacheTimeout" default="600" type="integer" />
	<cfParam name="sb.errorToEmail" default="" />
	<cfParam name="sb.errorFromEmail" default="error@#cgi.http_host#" />
	<cfParam name="sb.errorPage" default="error" />
	<cfParam name="sb.error" default="" />
	<cfParam name="sb.isLoggedIn" default="false" />
	<cfParam name="sb.isHomepage" default="false" />
	<cfParam name="sb.isDevelopment" default="false" />
	<cfParam name="sb.developmentServers" default="" />
		<cfParam name="sb.robots" default="index,follow" />
		<cfParam name="sb.directoryOffset" default="" />
		<cfParam name="sb.directorySkeleton" default="" />
	<cfTry>
		<!--- INCLUDE ROOT'S SETTINGS FILE --->
			<cfIf fileExists(expandPath("#sb.directorySkeleton#sb_settings.cfm"))>
				<cfInclude template="#sb.directorySkeleton#sb_settings.cfm" />
			</cfIf>
			<cfIf sb.directorySkeleton NEQ sb.directoryOffset AND fileExists(expandPath("#sb.directoryOffset#sb_settings.cfm"))>
				<cfInclude template="#sb.directoryOffset#sb_settings.cfm" />
		</cfIf>
		<!--- SET UP THE PATH'S ARRAY --->
		<cfParam name="url.sb_path" default="#sb.defaultPage#" />
		<cfParam name="sb.url" default="#url.sb_path#" />
			<cfSet sb.url = reReplace(lCase(sb.url), "[^a-z0-9\-_]*", "", "all") />
		<!--- MOD-REWRITE (.htaccess) --->
		<cfSet sb.routing = listToArray(sb.url, "-") />
		<cfSet sb.path = sb.url />
		<!--- SET THE NUMBER OF CURCUITS ( -1 FOR THE PAGE ) --->
		<cfSet sb.circuitCount = arrayLen(sb.routing)-1 />
			<cfIf sb.circuitCount LT 0>
				<!--- THIS CASE CAN HAPPEN IF THE URL IS "/-.htm" --->
				<cfSet sb.error = "NOPAGE" />
			<cfElseIf sb.circuitCount EQ 0>
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
				<cfIf fileExists(expandPath("#sb.directoryOffset##sb.remainingCircuit#sb_core.cfm"))>
				<cfSet sb.error = "CORE" />
			</cfIf>
		</cfLoop>
			<cfIf NOT len(sb.error)>
			<cfSet sb.includedFiles = 0 />
			<!--- INCLUDE SETTINGS, IF NOT ROOT --->
			<cfSet sb.remainingCircuit = "" />
			<cfLoop list="#sb.circuit#" delimiters="/" index="sb.loopIndex">
				<cfSet sb.remainingCircuit = listAppend(sb.remainingCircuit, sb.loopIndex, "/") & "/"  />
					<cfIf len(sb.remainingCircuit)>
						<cfIf fileExists(expandPath("#sb.directorySkeleton##sb.remainingCircuit#sb_settings.cfm"))>
							<cfInclude template="#sb.directorySkeleton##sb.remainingCircuit#sb_settings.cfm" />
						</cfIf>
						<cfIf sb.directorySkeleton NEQ sb.directoryOffset AND fileExists(expandPath("#sb.directoryOffset##sb.remainingCircuit#sb_settings.cfm"))>				
							<cfInclude template="#sb.directoryOffset##sb.remainingCircuit#sb_settings.cfm" />
						</cfIf>
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
				<cfIf fileExists(expandPath("#sb.directoryOffset##sb.circuit#sb_switch.cfm"))>
					<cfInclude template="#sb.directoryOffset##sb.circuit#sb_switch.cfm" />
				<cfElseIf sb.useSkeleton AND sb.directoryOffset NEQ sb.directorySkeleton AND fileExists(expandPath("#sb.directorySkeleton##sb.circuit#sb_switch.cfm"))>
					<cfInclude template="#sb.directorySkeleton##sb.circuit#sb_switch.cfm" />
			</cfIf>
				<cfIf NOT len(sb.error)>
			<!--- USE FORM LOGIC --->
			<cfIf len(sb.useForm) AND cgi.request_method NEQ "POST">
				<cfLocation url="#sb.useForm#" addtoken="false" />
				<cfAbort />
			</cfIf>
	        <cfSaveContent variable="sb.content">
	            <!--- INCLUDE CONTROLLER FILE --->
						<cfIf sb.useController>
							<cfIf fileExists(expandPath("#sb.directoryOffset##sb.circuit#controller/#sb.page#.cfm"))>
								<cfInclude template="#sb.directoryOffset##sb.circuit#controller/#sb.page#.cfm" />
								<cfSet sb.includedFiles = sb.includedFiles + 1 />
							<cfElseIf sb.useSkeleton AND sb.directoryOffset NEQ sb.directorySkeleton AND fileExists(expandPath("#sb.directorySkeleton##sb.circuit#controller/#sb.page#.cfm"))>
								<cfInclude template="#sb.directorySkeleton##sb.circuit#controller/#sb.page#.cfm" />
	                <cfSet sb.includedFiles = sb.includedFiles + 1 />
	            </cfIf>
						</cfIf>
	            <!--- INCLUDE MODEL FILE --->
						<cfIf sb.useModel>
							<cfIf fileExists(expandPath("#sb.directoryOffset##sb.circuit#model/#sb.page#.cfm"))>
								<cfInclude template="#sb.directoryOffset##sb.circuit#model/#sb.page#.cfm" />
								<cfSet sb.includedFiles = sb.includedFiles + 1 />
							<cfElseIf sb.useSkeleton AND sb.directoryOffset NEQ sb.directorySkeleton AND fileExists(expandPath("#sb.directorySkeleton##sb.circuit#model/#sb.page#.cfm"))>
								<cfInclude template="#sb.directorySkeleton##sb.circuit#model/#sb.page#.cfm" />
	                <cfSet sb.includedFiles = sb.includedFiles + 1 />
	            </cfIf>
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
						<cfIf sb.useView>
							<cfIf fileExists(expandPath("#sb.directoryOffset##sb.circuit#view/#sb.page#.cfm"))>
								<cfInclude template="#sb.directoryOffset##sb.circuit#view/#sb.page#.cfm" />
	                <cfSet sb.includedFiles = sb.includedFiles + 1 />
							<cfElseIf sb.useSkeleton AND sb.directoryOffset NEQ sb.directorySkeleton AND fileExists(expandPath("#sb.directorySkeleton##sb.circuit#view/#sb.page#.cfm"))>
								<cfInclude template="#sb.directorySkeleton##sb.circuit#view/#sb.page#.cfm" />
								<cfSet sb.includedFiles = sb.includedFiles + 1 />
							</cfIf>
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
				<cfLoop from="#sb.circuitCount#" to="1" step="-1" index="sb.loopIndex">
						<cfIf sb.useTemplate>
							<cfIf fileExists(expandPath("#sb.directoryOffset##sb.remainingCircuit#sb_template.cfm"))>
								<cfSaveContent variable="sb.content">
									<cfInclude template="#sb.directoryOffset##sb.remainingCircuit#sb_template.cfm" />
								</cfSaveContent>
								<cfSet sb.content = trim(sb.content) />
							<cfElseIf sb.useSkeleton AND sb.directoryOffset NEQ sb.directorySkeleton AND fileExists(expandPath("#sb.directorySkeleton##sb.remainingCircuit#sb_template.cfm"))>
								<cfSaveContent variable="sb.content">
									<cfInclude template="#sb.directorySkeleton##sb.remainingCircuit#sb_template.cfm" />
						</cfSaveContent>
								<cfSet sb.content = trim(sb.content) />
							</cfIf>
					</cfIf>
					<cfSet sb.remainingCircuit = listDeleteAt(sb.remainingCircuit, sb.loopIndex, "/") & "/" />
				</cfLoop>
					<!--- INCLUDE ROOT TEMPLATE --->
			<cfIf sb.useTemplate>
						<cfIf fileExists(expandPath("#sb.directoryOffset#sb_template.cfm"))>
							<cfSaveContent variable="sb.content">
								<cfInclude template="#sb.directoryOffset#sb_template.cfm" />
							</cfSaveContent>
							<cfSet sb.content = trim(sb.content) />
						<cfElseIf sb.directoryOffset NEQ sb.directorySkeleton AND fileExists(expandPath("#sb.directorySkeleton#sb_template.cfm"))>
							<cfSaveContent variable="sb.content">
								<cfInclude template="#sb.directorySkeleton#sb_template.cfm" />
					</cfSaveContent>
							<cfSet sb.content = trim(sb.content) />
						</cfIf>
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
			<cfSet sb.robots = "noindex,nofollow" />
		<cfSet sb.includedErrorFiles = 0 />
		<cfTry>
				<cfIf fileExists(expandPath("#sb.directoryOffset#controller/#sb.errorPage#.cfm"))>
				<cfSet sb.includedErrorFiles = sb.includedErrorFiles + 1 />
					<cfInclude template="#sb.directoryOffset#controller/#sb.errorPage#.cfm" />
				<cfElseIf sb.directoryOffset NEQ sb.directorySkeleton AND fileExists(expandPath("#sb.directorySkeleton#controller/#sb.errorPage#.cfm"))>
				<cfSet sb.includedErrorFiles = sb.includedErrorFiles + 1 />
					<cfInclude template="#sb.directorySkeleton#controller/#sb.errorPage#.cfm" />
			</cfIf>
				<cfIf fileExists(expandPath("#sb.directoryOffset#model/#sb.errorPage#.cfm"))>
				<cfSet sb.includedErrorFiles = sb.includedErrorFiles + 1 />
					<cfInclude template="#sb.directoryOffset#model/#sb.errorPage#.cfm" />
				<cfElseIf sb.directoryOffset NEQ sb.directorySkeleton AND fileExists(expandPath("#sb.directorySkeleton#model/#sb.errorPage#.cfm"))>
				<cfSet sb.includedErrorFiles = sb.includedErrorFiles + 1 />
					<cfInclude template="#sb.directorySkeleton#model/#sb.errorPage#.cfm" />
			</cfIf>
			<cfSaveContent variable="sb.content">
					<cfIf fileExists(expandPath("#sb.directoryOffset#view/#sb.errorPage#.cfm"))>
					<cfSet sb.includedErrorFiles = sb.includedErrorFiles + 1 />
						<cfInclude template="#sb.directoryOffset#view/#sb.errorPage#.cfm" />
					<cfElseIf sb.directoryOffset NEQ sb.directorySkeleton AND fileExists(expandPath("#sb.directorySkeleton#view/#sb.errorPage#.cfm"))>
					<cfSet sb.includedErrorFiles = sb.includedErrorFiles + 1 />
						<cfInclude template="#sb.directorySkeleton#view/#sb.errorPage#.cfm" />
				</cfIf>
			</cfSaveContent>
			<cfCatch>
				<!--- IGNORED --->
				<cfSet sb.includedErrorFiles = 0 />
					<cfSet sb.error = "CATCH" />
					<cfSet sb.cfCatch = cfCatch />
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
				<cfSet sb.remainingCircuit = sb.circuit />
				<!--- LOOP THROUGH CIRCUITS BACKWARDS TO INCLUDE TEMPLATES --->
				<cfLoop from="#sb.circuitCount#" to="1" step="-1" index="sb.loopIndex">
					<cfIf sb.useTemplate>
						<cfIf fileExists(expandPath("#sb.directoryOffset##sb.remainingCircuit#sb_template.cfm"))>
							<cfSaveContent variable="sb.content">
								<cfInclude template="#sb.directoryOffset##sb.remainingCircuit#sb_template.cfm" />
							</cfSaveContent>
							<cfSet sb.content = trim(sb.content) />
						<cfElseIf sb.useSkeleton AND sb.directoryOffset NEQ sb.directorySkeleton AND fileExists(expandPath("#sb.directorySkeleton##sb.remainingCircuit#sb_template.cfm"))>
							<cfSaveContent variable="sb.content">
								<cfInclude template="#sb.directorySkeleton##sb.remainingCircuit#sb_template.cfm" />
						</cfSaveContent>
							<cfSet sb.content = trim(sb.content) />
						</cfIf>
					</cfIf>
					<cfSet sb.remainingCircuit = listDeleteAt(sb.remainingCircuit, sb.loopIndex, "/") & "/" />
				</cfLoop>
				<!--- INCLUDE ROOT TEMPLATE --->
				<cfIf sb.useTemplate>
					<cfIf fileExists(expandPath("#sb.directoryOffset#sb_template.cfm"))>
						<cfSaveContent variable="sb.content">
							<cfInclude template="#sb.directoryOffset#sb_template.cfm" />
						</cfSaveContent>
						<cfSet sb.content = trim(sb.content) />
					<cfElseIf sb.directoryOffset NEQ sb.directorySkeleton AND fileExists(expandPath("#sb.directorySkeleton#sb_template.cfm"))>
						<cfSaveContent variable="sb.content">
							<cfInclude template="#sb.directorySkeleton#sb_template.cfm" />
				</cfSaveContent>
						<cfSet sb.content = trim(sb.content) />
					</cfIf>
			</cfIf>
			<cfCatch>
				<!--- IGNORED --->
			</cfCatch>
		</cfTry>
	</cfIf>
		<cfIf sb.useCompress>
		<cfSet sb.content = reReplace(sb.content, "[\t\s\n]{1,}", " ", "all") />
	</cfIf>
	<cfSet sb.content = trim(sb.content) />
		<cfIf NOT len(sb.error) AND sb.useCache>
			<!--- THERE WERE NOT ANY ERRORS, SO CACHE --->
			<cfCache action="put" id="#sb.func.cacheId()#" value="#sb.content#" timespan="#createTimeSpan(0, 0, 0, sb.cacheTimeout)#" idletime="#createTimeSpan(0, 0, 0, sb.cacheTimeout)#">
			<cfHeader name="Expires" value="#getHTTPTimeString(now()+sb.cacheTimeout/86400)#" />
			<cfHeader name="Cache-Control" value="max-age=#sb.cacheTimeout#,public" />
		</cfIf>
	</cfIf>
</cfSilent><cfOutput>#sb.content#</cfOutput>