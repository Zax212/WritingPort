<cfComponent output="false">
	<cfSet this.name = reReplace(listChangeDelims(listDeleteAt(cgi.script_name, listLen(cgi.script_name, "/"), "/"), "$", "/"), "[^a-zA-Z0-9_$]", "_", "all") />
	<cfSet this.sessionManagement = true />
	<cfSet this.sessionTimeout = createTimeSpan(0, 0, 30, 0) />
    <cfFunction name="onRequestStart" returnType="boolean" output="false">
		<cfArgument name="file" type="string" required="true" />
        <!--- Don't let anyone access any cfm page except index.cfm within directly --->
		<cfIf expandPath(application.path & "/index.cfm") EQ getBaseTemplatePath() OR listLast(file, ".") EQ "cfc" OR listLast(file, "/") EQ "index.cfm">
			<cfReturn true />
        </cfIf>
		<cfReturn false />
	</cfFunction>
	<cfFunction name="onApplicationStart" returnType="boolean" output="false">
		<!--- Save a reusable variable to keep track of the root folder that contains Application.cfc --->
		<cfSet application.path = replace(listDeleteAt(replace(getCurrentTemplatePath(),"\","/","ALL"), listLen(replace(getCurrentTemplatePath(),"\","/","ALL"), "/"), "/"), replace(replace(cgi.path_translated,"\","/","ALL"), replace(cgi.script_name,"\","/","ALL"), ""), "") />

		<!--- Setup caching's default settings --->
		<cfIf NOT directoryExists(expandPath(application.path & "/.cache/"))>
			<cfDirectory action="create" directory="#expandPath(application.path & "/.cache/")#" mode="775" />
		</cfIf>
		<cfSet cacheSetProperties({
			diskStore: "#expandPath(application.path & "/.cache/")#",
			diskPersistent: false,
			maxElementsInMemory: 10,
			maxElementsOnDisk: 10,
			overflowToDisk: true,
			timeToLiveSeconds: 600,
			timeToIdleSeconds: 600,
			memoryEvictionPolicy: "LFU"
		}) />
		<cfReturn true />
    </cfFunction>

</cfComponent>