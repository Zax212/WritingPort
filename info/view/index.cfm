<h2>
    User Information
</h2><br>
<div class="col-sm-9">
    <div class="panel panel-primary menu">
        <div class="panel-heading">Portfolio</div>
        <div class="panel-body">
            <div class="row pad-bottom">
                <div class=" col-sm-12 table-responsive">
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
                                <cfif #qryDraft.CREATEDBY# eq #session.user.id# AND #qryDraft.draftnum# eq 0 AND #qryDraft.ISDELETED# eq 0>
                                    <tr>
                                        <td>#qryDraft.CREATEDBY#</td>
                                        <td>#qryDraft.TITLE#</td>
                                        <td>#qryDraft.DESCRIPTION#</td>
                                        <td><a href="download.htm?FileName=#qryDraft.FILENAME#&username=#qryDraft.CREATEDBY#">#qryDraft.FILENAME#</a></td>
                                        <td><a href="info-deleteDraft.htm?filename=#qryDraft.FILENAME#&fileid=#qryDraft.paperID#&user=#qryDraft.CREATEDBY#" name="del"><span class="glyphicon glyphicon-trash"></span></a></td>
                                    </tr>
                                </cfif>
                            </cfoutput>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="col-sm-3">
    <div class="panel panel-primary menu">
        <div class="panel-heading">Account Info</div>
        <div class="panel-body">
            <div class="row pad-bottom">
                <div class="col-xs-4 text-muted">Username</div>
                <div class="col-xs-8 text-primary">
                    <cfoutput>#session.user.id#</cfoutput>
                </div>
            </div>
            <div class="row pad-bottom">
                <div class="col-xs-4 text-muted nowrap">
                    Name
                </div>
                <div class="col-xs-8 text-primary">
                    <cfoutput>#session.user.firstname# #session.user.lastname#</cfoutput>
                </div>
            </div>
            <div class="row pad-bottom">
                <div class="col-xs-4 text-muted nowrap">
                    User Type
                </div>
                <div class="col-xs-8 text-primary">
                    <cfoutput>#session.user.role#</cfoutput>
                </div>
            </div>
            <div class="row pad-bottom">
                <div class="col-xs-4 text-muted nowrap">
                    G-Number
                </div>
                <div class="col-xs-8 text-primary">
                    <cfoutput>#session.user.gnumber#</cfoutput>
                </div>
            </div>
            <div class="row pad-bottom">
                <div class="col-xs-4 text-muted nowrap">
                    Professor
                </div>
                <div class="col-xs-8 text-primary">
                    Paul Smith (static)
                </div>
            </div>
            <div class="row pad-bottom">
                <div class="col-xs-4 text-muted nowrap">
                    Term
                </div>
                <div class="col-xs-8 text-primary">
                    <cfoutput>#qryTerm.term#</cfoutput>
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
                <div class=" col-sm-12 table-responsive">
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
                                <cfif #qryDraft.CREATEDBY# eq #session.user.id# AND #qryDraft.draftnum# neq 0 AND #qryDraft.ISDELETED# eq 0>
                                    <tr>
                                        <td>#qryDraft.CREATEDBY#</td>
                                        <td>#qryDraft.TITLE#</td>
                                        <td>#qryDraft.DESCRIPTION#</td>
                                        <td><a href="download.htm?FileName=#qryDraft.FILENAME#&username=#qryDraft.CREATEDBY#">#qryDraft.FILENAME#</a></td>
                                        <td>#qryDraft.DRAFTNUM#</td>
                                        <td><a href="info-deleteDraft.htm?filename=#qryDraft.FILENAME#&fileid=#qryDraft.PAPERID#&user=#qryDraft.CREATEDBY#" name="del"><span class="glyphicon glyphicon-trash"></span></a></td>
                                    </tr>
                                </cfif>
                            </cfoutput>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>
