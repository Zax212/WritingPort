<ul class="nav nav-tabs">
    <li class="nav-item">
        <a href="paperdraft-index.htm?draft=-1">View Draft's</a>
    </li>
</ul>

<H3>Draft
    <cfoutput>#draft#</cfoutput>
</H3>
<hr>
<cfif #qrydraft.recordcount# eq 0>
    <h4>No Draft's have been submitted yet</h4>
    <cfelse>
        <cfoutput query="qryDraft">
            <cfif #qryDraft.DRAFTNUM# eq #draft#>


                <div class="panel panel-primary">
                    <div class="panel-heading">
                        <div class="row">
                            <div class="col-md-4 text-left panel-title">#qryDraft.TITLE#</div>
                            <div class="col-md-5">by:#qryDraft.CREATEDBY#</div>
                        </div>

                    </div>
                    <div class="panel-body">Description:<br> &nbsp#qryDraft.DESCRIPTION#<br><br>
                        <a href="paperdraft-comments.htm?username=#qryDraft.CREATEDBY#&title=#qryDraft.TITLE#&description=#qryDraft.Description#&filename=#qryDraft.FILENAME#&fileid=#qryDraft.PAPERID#"><button type="button" class="btn btn-primary"><span class="glyphicon glyphicon-comment"></span> Comment</button></a>

                        <a href="download.htm?FileName=#qryDraft.FILENAME#&username=#qryDraft.CREATEDBY#"><button type="button" class="btn btn-primary"><span class="glyphicon glyphicon-download-alt"></span> Download</button></a></div>
                </div>

            </cfif>
        </cfoutput>
</cfif>
