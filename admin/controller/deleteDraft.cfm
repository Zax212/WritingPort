<cfif session.user.role eq 'ADMIN'>
    <cfset local.filesPath=G etDirectoryFromPath(GetBaseTemplatePath()) & "files/documents">
        <cfset local.filesPath=# replacenocase( "#local.filesPath#", "\", "/", "ALL")#>


            <cfquery datasource="DS_APPCFWRTPORTFOLIO" name="deleteDraft">
                UPDATE GVSUOWNER.WP_PAPERS SET ISDELETED = 1 WHERE PAPERID = '#url.paperid#'
            </cfquery>

            <cflocation url="admin-draft.htm">
</cfif>
