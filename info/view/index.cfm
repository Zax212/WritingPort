<h2>
    User Information
</h2><br>    
<div class="col-sm-9">
        <div class="panel panel-primary menu">
            <div class="panel-heading">Portfolio</div>
            <div class="panel-body">
                <div class="row pad-bottom">
                    <table class="table">
                        <thead>
                            <tr>
                                <th>User</th>
                                <th>Title</th>
                                <th>Description</th>
                                <th>File Uploaded</th>
                                <th>Delete?</th>
                            </tr>
                        </thead>
                        <tbody>
                            <cfoutput query="qryDraft">
                                <cfif #qryDraft.USERNAME# eq #session.user.id# AND #qryDraft.FINAL# eq 1 AND #qryDraft.ISDELETED# eq 0>
                                    <tr>
                                        <td>#qryDraft.USERNAME#</td>
                                        <td>#qryDraft.TITLE#</td>
                                        <td>#qryDraft.DESCRIPTION#</td>
                                        <td><a href="download.htm?FileName=#qryDraft.FILENAME#&username=#qryDraft.USERNAME#">#qryDraft.FILENAME#</a></td>
                                        <td><a href="info-deleteDraft.htm?filename=#qryDraft.FILENAME#&fileid=#qryDraft.FILEID#&user=#qryDraft.USERNAME#" name="del"><span class="glyphicon glyphicon-trash"></span></a></td>
                                    </tr>
                                </cfif>
                            </cfoutput>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
<div class="col-sm-3">
        <div class="panel panel-primary menu">
            <div class="panel-heading">Account Info</div>
            <div class="panel-body">
                <div class="row pad-bottom">
                    <div class="col-xs-4 text-muted">User</div>
                    <div class="col-xs-8 text-primary"> <cfoutput>#session.user.id#</cfoutput></div>
                </div>
                <div class="row pad-bottom">
                    <div class="col-xs-4 text-muted nowrap">
                        Professor
                    </div>
                    <div class="col-xs-8 text-primary">
                        Paul Smith
                    </div>
                </div>
                <div class="row pad-bottom">
                    <div class="col-xs-4 text-muted nowrap">
                        Term
                    </div>
                    <div class="col-xs-8 text-primary">
                        Fall 2019
                    </div>
                </div>
            </div>
    </div>
</div>
<div class="col-sm-12">
        <div class="panel panel-primary menu">
            <div class="panel-heading">Submitted Draft's</div>
            <div class="panel-body">
                <div class="row pad-bottom">
                    <table class="table">
                        <thead>
                            <tr>
                                <th>User</th>
                                <th>Title</th>
                                <th>Description</th>
                                <th>File Uploaded</th>
                                <th>Draft #</th>
                                <th>Delete?</th>
                            </tr>
                        </thead>
                        <tbody>
                            <cfoutput query="qryDraft">
                                <cfif #qryDraft.USERNAME# eq #session.user.id# AND #qryDraft.FINAL# eq 0 AND #qryDraft.ISDELETED# eq 0>
                                    <tr>
                                        <td>#qryDraft.USERNAME#</td>
                                        <td>#qryDraft.TITLE#</td>
                                        <td>#qryDraft.DESCRIPTION#</td>
                                        <td><a href="download.htm?FileName=#qryDraft.FILENAME#&username=#qryDraft.USERNAME#">#qryDraft.FILENAME#</a></td>
                                        <td>#qryDraft.DRAFTNUM#</td>
                                        <td><a href="info-deleteDraft.htm?filename=#qryDraft.FILENAME#&fileid=#qryDraft.FILEID#&user=#qryDraft.USERNAME#" name="del"><span class="glyphicon glyphicon-trash"></span></a></td>
                                    </tr>
                                </cfif>
                            </cfoutput>
                        </tbody>
                    </table>
                </div>
            </div>
    </div>
</div>