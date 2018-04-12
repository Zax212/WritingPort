<cfQuery datasource="DS_APPCFWRTPORTFOLIO" name="qryDraft">
    SELECT * FROM GVSUOWNER.wp_papers
</cfQuery>

<cfquery datasource="DS_APPCFWRTPORTFOLIO" name="qryterm">
    SELECT stvterm_code AS termcode, stvterm_desc as term
    FROM saturn.stvterm 
    WHERE TRUNC(stvterm_end_date) >= TRUNC(SYSDATE)
    ORDER BY termcode asc
    FETCH FIRST 1 rows only
</cfquery>

<cfset local.filesPath=GetDirectoryFromPath(GetBaseTemplatePath()) & "files/documents">
    <cfset local.filesPath=# replacenocase( "#local.filesPath#", "\", "/", "ALL")#>
