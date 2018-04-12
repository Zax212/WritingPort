<cfif session.user.role eq 'ADMIN'>
    <cfset #session.user.id#=usr>
        <cflocation url="admin-index.htm">
            <cfelse>
                <cfSet sb.useRedirect="menu.htm" />
</cfif>
