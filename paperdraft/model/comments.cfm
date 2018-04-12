<cfQuery datasource="DS_APPCFWRTPORTFOLIO" name="qryComments">
    SELECT * 
    FROM GVSUOWNER.WP_DRAFT_COMMENTS
    ORDER BY CREATEDDT ASC
</cfQuery>