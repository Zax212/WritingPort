<cfQuery datasource="DS_APPCFWRTPORTFOLIO" name="qryAddComment">
    INSERT INTO GVSUOWNER.WP_DRAFT_COMMENTS(
        COMMENTID,
        FILEID,
        COMMENTMSG,
        CREATEDBY,
        CREATEDDT) 
    VALUES(
        '<cfoutput>#createuuid()#</cfoutput>',
        '#form.fileid#',
        '#form.comment#',
        '#session.user.id#',
        <cfoutput>#Now()#</cfoutput>)
</cfQuery>
<cfoutput>
    <cflocation url="paperdraft-comments.htm?username=#username#&title=#title#&description=#description#&filename=#filename#&fileid=#fileid#"></cfoutput>