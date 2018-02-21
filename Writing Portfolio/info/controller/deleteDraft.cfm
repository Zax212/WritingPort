<cfset filesPath="C:\workspace\www\gvsu\Writing Portfolio\files\documents\"/>

<cfquery datasource="DS_GVINTRAAD" name="deleteComments">
       DELETE 
       FROM wp_draft_comments
       WHERE FILEID = '#url.fileid#'
</cfquery>

<cfquery datasource="DS_GVINTRAAD" name="deleteDraft">
       DELETE 
       FROM writingdummy
       WHERE FILEID = '#url.fileid#'
</cfquery>

<cffile
action = "delete"
file = "#filesPath#/#session.user.ldap#/#filename#">

<cflocation url="info-index.htm">