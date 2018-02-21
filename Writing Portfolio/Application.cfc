<cfComponent output="false">
	<cfSet this.name = hash(getCurrentTemplatePath()) />
	<cfSet this.sessionManagement = true />
	<cfSet this.sessionTimeout = createTimeSpan(0, 0, 30, 0) />
	<cfFunction name="onRequestStart" returnType="boolean" output="false">
		<cfArgument name="file" type="string" required="true" />
		<!--- Don't let anyone access any cfm page except index.cfm within directly --->
		<cfIf getFileFromPath( cgi.script_name ) EQ "index.cfm">
			<cfReturn true />
		</cfIf>
		<cfReturn false />
	</cfFunction>
	<cfFunction name="onApplicationStart" returnType="boolean" output="false">
		<cfIf NOT isDefined("application.functions")>
			<cfSet application.functions = createObject("component", "files.cfc.functions") />
		</cfIf>
		<cfIf NOT directoryExists(ExpandPath( "./" ) & ".cache")>
			<cfDirectory action="create" directory="#ExpandPath( "./" ) & ".cache"#" mode="775" />
		</cfIf>
		<cfSet cacheSetProperties({
			diskStore: "#ExpandPath( "./" ) & ".cache"#",
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