<ul class="nav nav-tabs">
    <li class="nav-item">
        <a href="paperdraft-index.htm">View Draft's</a>
    </li>
</ul>
<h3>Draft</h3>
<!--Paper information-->


<div class="panel panel-primary">
    <div class="panel-heading">
        <cfoutput>
            <div class="row">
                <div class="col-md-4 text-left panel-title">#title#</div>
                <div class="col-md-5">by: #USERNAME#</div>
            </div>

    </div>
    <div class="panel-body">Description:<br> &nbsp#DESCRIPTION#<br>
        <a href="download.htm?FileName=#filename#&username=#username#"><button type="button" class="btn btn-primary"><span class="glyphicon glyphicon-download-alt"></span> Download</button></a></div>
    </cfoutput>
</div>


<!--Comments-->
<h3>Comments</h3>
<cfset ID=#fileid#>
    <cfoutput query="qryComments">
        <cfif #qryComments.FILEID# eq #ID#>
            <div class="panel panel-info">
                <div class="panel-heading">
                    <div class="row">
                        <div class="col-md-4 text-left panel-title">#qryComments.createdby#</div>
                        <div class="col-md-5">at: #qryComments.createddt#</div>
                    </div>

                </div>
                <div class="panel-body">Comment:<br> &nbsp#qryComments.commentmsg#</div>
            </div>
        </cfif>
    </cfoutput>

    <!--form for submitting new comment-->
    <form name="draftpaper" <cfoutput>action="paperdraft-submittedComment.htm?username=#username#&title=#title#&description=#description#&filename=#filename#&fileid=#fileid#"</cfoutput> method="post">
        <label for="comment">Comment:</label>
        <textarea class="form-control" rows="5" id="comment" name="comment"> </textarea>
        <br>
        <button type="submit" class="btn btn-primary">Submit</button>

        <cfoutput>
            <input type="hidden" name="fileid" value="#fileid#">
            <input type="hidden" name="createdby" value="#session.user.id#">


        </cfoutput>
        </div>
