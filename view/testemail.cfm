<cfObject component="#session.cfc#.email" name="functions">

<cfSet variables.emailArray = arrayNew(1) />
<cfSet t = arrayAppend(variables.emailArray, "snyderb@gvsu.edu") />

<cfDump var="#variables.emailArray#" />

<cfOutput>#functions.emailForm("false", "false", "helpdesk@gvsu.edu", variables.emailArray)#</cfOutput>
