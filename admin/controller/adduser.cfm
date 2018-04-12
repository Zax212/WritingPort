<cfif session.user.role eq 'ADMIN'>
    <cfQuery datasource ="DS_APPCFWRTPORTFOLIO" name="qryCheckUser">
        SELECT 1
        FROM GVSUOWNER.WP_USERS
        WHERE ldap = '#usrname#'
    </cfQuery>
    
    <cfif #qryCheckUser.recordCount# eq 0>
        <cfQuery datasource="DS_APPCFWRTPORTFOLIO" name="qryAddUser">

                INSERT INTO GVSUOWNER.WP_USERS(USERID, LDAP, MODIFIEDBY)  VALUES ('<cfoutput>#createuuid()#</cfoutput>','#usrname#','<cfoutput>#session.user.id#</cfoutput>')
        </cfQuery>
    </cfif>


    <cflocation url="admin-index.htm">
        <cfelse>
            <cfSet sb.useRedirect="menu.htm" />
</cfif>
