<cfif session.user.role eq 'ADMIN'>
    <cfQuery datasource="DS_APPCFWRTPORTFOLIO" name="qryUsers">
        SELECT DISTINCT createdby FROM GVSUOWNER.wp_papers ORDER BY createdby
    </cfQuery>

    <cfQuery datasource="DS_APPCFWRTPORTFOLIO" name="qryAdmins">
        SELECT * FROM GVSUOWNER.wp_users
    </cfQuery>
</cfif>
