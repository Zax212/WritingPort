<cfComponent output="false">
    <cfSet this.name = replace(replace(cgi.script_name,"/","","all"),".","","all")>
    <cfSet this.sessionManagement = true>
    <cfSet this.sessionTimeout = createTimeSpan(0,0,30,0)>
    <cfFunction name="onRequestStart" returnType="boolean" output="false">
        <cfArgument name="file" type="string" required="true">
        <!--- Don't let anyone access any cfm page except index.cfm within directly --->
        <cfIf right(arguments.file,10) EQ "/index.cfm">
            <cfReturn true>
        </cfIf>
        <cfReturn false>
    </cfFunction>
</cfComponent>