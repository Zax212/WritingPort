<cfQuery datasource="DS_GVINTRAAD" name="qryDraft">
    SELECT * FROM wp_papers
</cfQuery>

<cfset local.filesPath=GetDirectoryFromPath(GetBaseTemplatePath()) & "files/documents">
    <cfset local.filesPath=# replacenocase( "#local.filesPath#", "\", "/", "ALL")#>
