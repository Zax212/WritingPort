<cfIf url.error EQ "logout">
    <p class="message standout">You have been logged out.</p>
<cfElseIf url.error EQ "user">
    <p class="message standout">Invalid username/password combination.</p>
<cfElseIf url.error EQ "session">
    <p class="message standout">Your session has expired. Please login again.</p>
<cfElseIf url.error EQ "noaccess">
    <p class="message standout">You do not have access to this application.</p>

    <cfObject component="#session.cfc#.logging" name="logging">
    <cfSet t = logging.write( "#url.ds#", "#session.user.id#", "Unauthorized Access Violation", "login" ) />
</cfIf>