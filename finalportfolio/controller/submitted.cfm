<cfQuery datasource="DS_GVINTRAAD" name="FinalPortfolio">
    SELECT * FROM wp_papers WHERE USERNAME='#session.user.id#' AND FINAL= 1 AND ISDELETED = 0
</cfQuery>

<cfset local.filesPath=GetDirectoryFromPath(GetBaseTemplatePath()) & "files/documents">
    <cfset local.filesPath=# replacenocase( "#local.filesPath#", "\", "/", "ALL")#>
