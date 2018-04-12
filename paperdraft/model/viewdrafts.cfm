<cfQuery datasource="DS_APPCFWRTPORTFOLIO" name="qryDraft">
    SELECT * FROM GVSUOWNER.wp_papers
     WHERE ISDELETED = 0 and draftnum = #draft#
</cfQuery>

<cfset local.filesPath=GetDirectoryFromPath(GetBaseTemplatePath()) & "files/documents">
    <cfset local.filesPath=# replacenocase( "#local.filesPath#", "\", "/", "ALL")#>
