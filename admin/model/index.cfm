<cfQuery datasource="DS_GVINTRAAD" name="qryUsers">
    SELECT DISTINCT username FROM wp_papers ORDER BY username
</cfQuery>

<cfQuery datasource="DS_GVINTRAAD" name="qryAdmins">
    SELECT * FROM wp_users
</cfQuery>