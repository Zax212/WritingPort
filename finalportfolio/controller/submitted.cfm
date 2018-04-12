<cfQuery datasource="DS_APPCFWRTPORTFOLIO" name="FinalPortfolio">
    SELECT * FROM GVSUOWNER.wp_papers WHERE CREATEDBY='#session.user.id#' AND draftnum= 0 AND ISDELETED = 0
</cfQuery>

<cfset local.filesPath=GetDirectoryFromPath(GetBaseTemplatePath()) & "files/documents">
    <cfset local.filesPath=# replacenocase( "#local.filesPath#", "\", "/", "ALL")#>