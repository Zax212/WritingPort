<cfQuery datasource="DS_GVINTRAAD" name="qryComments">
    SELECT * 
    FROM WP_DRAFT_COMMENTS
    ORDER BY CREATEDDT ASC
</cfQuery>