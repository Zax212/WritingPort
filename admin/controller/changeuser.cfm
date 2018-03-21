<cfif session.user.admin eq true>
    <cfset #session.user.id#=usr>
        <cflocation url="admin-index.htm">
            <cfelse>
                <cfSet sb.useRedirect="menu.htm" />
</cfif>
