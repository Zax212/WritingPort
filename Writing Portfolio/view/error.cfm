<h2>An error has occurred</h2>
<cfSwitch expression="#sb.error#">
    <cfCase value="NOPAGE">
		<cfHeader statuscode="404" statustext="Not Found" />
        <p>The page you are trying to access was not found.</p>
    </cfCase>
    <cfCase value="NOCIRCUIT">
		<cfHeader statuscode="404" statustext="Not Found" />
        <p>The circuit you are trying to access was not found.</p>
    </cfCase>
    <cfCase value="CATCH">
		<cfHeader statuscode="500" statustext="Internal Server Error" />
		<p>An internal system error has occurred.</p>
        <cfIf sb.isDevelopment>
            <cfDump var="#sb.cfCatch#" />
        </cfIf>
    </cfCase>
    <cfCase value="CORE">
		<cfHeader statuscode="500" statustext="Internal Server Error" />
        <p>You're attempting to reference an internal switchboard instance as a circuit. Process aborted.</p>
    </cfCase>
	<cfCase value="PERMISSION">
		<cfHeader statuscode="403" statustext="Forbidden" />
		<p>You're attempting to reference an area of the system you do not have access to.</p>
	</cfCase>
    <cfDefaultCase>
		<cfHeader statuscode="500" statustext="Internal Server Error" />
		<p>An unknown error has occurred.</p>
    </cfDefaultCase>
</cfSwitch>