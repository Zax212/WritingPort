<cfset local.filesPath = GetDirectoryFromPath(GetBaseTemplatePath()) & "files/documents"> <cfset local.filesPath = #replacenocase("#local.filesPath#","\","/","ALL")#>


    <cfquery datasource="DS_GVINTRAAD" name="deleteDraft">
        UPDATE WP_PAPERS
        SET ISDELETED = 1
        WHERE FILEID = '#url.fileid#'
    </cfquery>

<cflocation url="admin-draft.htm">