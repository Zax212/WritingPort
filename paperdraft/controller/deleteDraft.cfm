<!--<cfquery datasource="DS_APPCFWRTPORTFOLIO" name="deleteComments">
    DELETE FROM GVSUOWNER.wp_draft_comments WHERE PAPERID = '#url.fileid#'
</cfquery>-->

        <cfquery datasource="DS_APPCFWRTPORTFOLIO" name="deleteDraft">
            UPDATE GVSUOWNER.WP_PAPERS
            SET ISDELETED = 1
            WHERE PAPERID = '#url.fileid#'
        </cfquery>

<!--<cffile action="delete" file="#local.filesPath#/#user#/#filename#">-->

    <cflocation url="paperdraft-index.htm">
