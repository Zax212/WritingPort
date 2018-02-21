
<cfQuery datasource="DS_GVINTRAAD" name="qryAddComment">
    INSERT INTO WP_DRAFT_COMMENTS(
        COMMENTID,
        FILEID,
        COMMENTMSG,
        CREATEDBY,
        CREATEDDT) 
    VALUES(
        '<cfoutput>#createuuid()#</cfoutput>',
        '#form.fileid#',
        '#form.comment#',
        '#session.user.ldap#',
        <cfoutput>#Now()#</cfoutput>)
</cfQuery>
<cfoutput>
    <cflocation url="paperdraft-comments.htm?username=#username#&title=#title#&description=#description#&filename=#filename#&fileid=#fileid#"></cfoutput>