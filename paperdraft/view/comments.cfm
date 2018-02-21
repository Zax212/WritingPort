<ul class="nav nav-tabs">
    <li class="nav-item">
        <a href="paperdraft-index.htm">View Draft's</a>
    </li>
</ul>
<h3>Draft</h3>
<!--Table with paper information-->
<table class="table">
    <thead>
        <tr>
            <th>Title</th>
            <th>Description</th>
            <th>File Uploaded</th>
        </tr>
    </thead>
    <tbody>
        <cfoutput>
        <tr>
            <td>#title#</td>
            <td>#description#</td>
            <td><a href="download.htm?FileName=#filename#&username=#username#">#filename#</a></td>
        </tr>
        </cfoutput>
    </tbody>
</table>
<!--table of comments-->
<h3>Comments</h3>
<table class="table">
    <thead>
        <tr>
            <th>Commenter</th>
            <th>Comment</th>
        </tr>
    </thead>
    <tbody>
        <cfset ID=#fileid#>
        <cfoutput query="qryComments">
            <cfif #qryComments.FILEID# eq #ID#>
                <tr>
                    <td>#qryComments.createdby#</td>
                    <td>#qryComments.commentmsg#</td>
                </tr>
            </cfif>
        </cfoutput>
    </tbody>
</table>

<!--form for submitting new comment-->
    <form name="draftpaper" <cfoutput>action="paperdraft-submittedComment.htm?username=#username#&title=#title#&description=#description#&filename=#filename#&fileid=#fileid#"</cfoutput> method="post">
    <label for="comment">Comment:</label>
    <textarea class="form-control" rows="5" id="comment" name="comment"> </textarea>
    <br>
    <button type="submit" class="btn btn-primary">Submit</button>
    
    <cfoutput>
    <input type="hidden" name="fileid" value="#fileid#">
    <input type="hidden" name="createdby" value="#session.user.ldap#">
        
    
    </cfoutput>
</div>