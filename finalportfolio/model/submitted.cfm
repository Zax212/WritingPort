<cfQuery datasource="DS_GVINTRAAD" name="FinalPortfolio">
    SELECT * 
    FROM writingdummy
    WHERE USERNAME='#session.user.ldap#' AND FINAL= 1
</cfQuery>