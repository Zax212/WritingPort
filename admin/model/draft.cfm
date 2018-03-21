<cfQuery datasource="DS_GVINTRAAD" name="qryDraft">
    SELECT * FROM wp_papers
    WHERE ISDELETED = 0
</cfQuery>

<cfset local.filesPath=GetDirectoryFromPath(GetBaseTemplatePath()) & "files/documents">
    <cfset local.filesPath=# replacenocase( "#local.filesPath#", "\", "/", "ALL")#>
