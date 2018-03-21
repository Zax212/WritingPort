<cfParam name="url.msg" default="" />

<cfIf   listFindNoCase( sb.noSessionActions, sb.page ) EQ 0
        AND listFindNoCase( sb.anySessionActions, sb.page ) EQ 0
        AND listContainsNoCase( sb.defaultSessionPath, sb.page ) EQ 0
        AND NOT isDefined("session.user.gnumber")>
</cfIf>

<cfSwitch expression="#sb.page#">
    <cfCase value="index">
        <cfParam name="url.error" default="" />
        <cfParam name="url.goto" default="" />
    </cfCase>
</cfSwitch>  

<cfset local.filesPath = GetDirectoryFromPath(GetBaseTemplatePath()) & "files/documents"> <cfset local.filesPath = #replacenocase("#local.filesPath#","\","/","ALL")#>