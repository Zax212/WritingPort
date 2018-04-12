<cfParam name="url.msg" default="" />

<cfSwitch expression="#sb.page#">
    <cfCase value="index">
        <cfParam name="url.error" default="" />
        <cfParam name="url.goto" default="" />
    </cfCase>
</cfSwitch>  

<cfset local.filesPath = GetDirectoryFromPath(GetBaseTemplatePath()) & "files/documents"> <cfset local.filesPath = #replacenocase("#local.filesPath#","\","/","ALL")#>