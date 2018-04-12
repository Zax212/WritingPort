<cfif session.user.role eq 'ADMIN'>
<h3>Here you will be able to view and modify grading groups</h3><br><br>
    <cfelse>
        <cfSet sb.useRedirect="menu.htm " />
</cfif>
