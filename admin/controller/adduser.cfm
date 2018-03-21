<cfif session.user.admin eq true>
    <cfQuery datasource ="DS_GVINTRAAD" name="qryCheckUser">
        SELECT 1
        FROM WP_USERS
        WHERE ldap = '#usrname#'
    </cfQuery>
    
    <cfif #qryCheckUser.recordCount# eq 0>
        <cfQuery datasource="DS_GVINTRAAD" name="qryAddUser">

                INSERT INTO WP_USERS(USERID, LDAP, MODIFIEDBY)  VALUES ('<cfoutput>#createuuid()#</cfoutput>','#usrname#','<cfoutput>#session.user.id#</cfoutput>')
        </cfQuery>
    </cfif>


    <cflocation url="admin-index.htm">
        <cfelse>
            <cfSet sb.useRedirect="menu.htm" />
</cfif>
