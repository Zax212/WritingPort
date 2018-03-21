<!--<cfquery datasource="DS_GVINTRAAD" name="deleteComments">
    DELETE FROM wp_draft_comments WHERE FILEID = '#url.fileid#'
</cfquery>-->

        <cfquery datasource="DS_GVINTRAAD" name="deleteDraft">
            UPDATE WP_PAPERS
            SET ISDELETED = 1
            WHERE FILEID = '#url.fileid#'
        </cfquery>

<!--<cffile action="delete" file="#local.filesPath#/#user#/#filename#">-->

    <cflocation url="paperdraft-index.htm">
