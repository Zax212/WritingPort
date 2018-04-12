<!--<cfset local.filesPath=GetDirectoryFromPath(GetBaseTemplatePath()) & "files/documents">
    <cfset local.filesPath=# replacenocase( "#local.filesPath#", "\", "/", "ALL")#> -->

        <cfquery datasource="DS_APPCFWRTPORTFOLIO" name="deleteDraft">
            UPDATE GVSUOWNER.WP_PAPERS
            SET ISDELETED = 1
            WHERE PAPERID = '#url.fileid#'
        </cfquery>

            <cflocation url="info-index.htm">
