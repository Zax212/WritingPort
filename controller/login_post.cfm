
<cfIf not isDefined("session.user.admin")>

        
    <cfQuery datasource="DS_GVINTRAAD" name="qryAdmins">
        SELECT * FROM wp_users
    </cfQuery>
    
    <cfQuery datasource ="DS_GVINTRAAD" name="qryCheckUser">
        SELECT 1
        FROM WP_USERS
        WHERE ldap = '#session.user.id#'
    </cfQuery>
    
        <!-- Check if user is an Admin -->
        <cfif #qryCheckUser.recordCount#  eq 1>
            <cfset session.user.admin = "True" />
            <cfSet sb.useRedirect = "menu.htm" />

        <!-- Check if user is Faculty -->
        <cfelseif session.user.type eq "facstaff">
            <cfset session.user.admin = "False" />
            <cfSet sb.useRedirect = "menu.htm" />
            
        <!-- Check if user is a Student -->
        <cfelseif session.user.type eq "student">
            <cfset session.user.admin = "False" />
            <cfSet sb.useRedirect = "menu.htm" />
            
        <!-- Redirect user to noaccess if not allowed in -->
        <cfelse>
            <cfset session.user.admin = "False" />
            <cfSet sb.useRedirect = "noaccess.htm" />
        </cfif>
<!--Already Logged on -->            
<cfelse>
    <cfSet sb.useRedirect = "menu.htm" /> 
</cfif>