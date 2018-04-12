<cfif session.user.role eq 'ADMIN'>
    <h2>Admin Page</h2>
    <ul class="nav nav-tabs">
        <li class="nav-item">
            <a href="admin-index.htm">Admin Control's</a>
        </li>
    </ul>
    <h3>Select a Professor to view their submitted grades</h3>
    <form action="admin-searchresult.htm" method="post">
        <input name="type" type="hidden" value="professorsearch">
        <div class="form-group">
            <label>Select Professor</label>
        </div>
        <div class="col-xs-6">
            <select class="form-control" name="Term" id="Term">
                <cfoutput query="qryterm">
                    <option id="#qryterm.termcode#" value="#qryterm.termcode#">#qryterm.term#</option>
                </cfoutput>
            </select>
        </div>
        <div class="col-xs-6">
            <select class="form-control" name="Prof" id="Prof">
                <cfoutput query="qryFaculty">
                    <option id="#qryFaculty.termcode#" value="#qryFaculty.gnumber#">#qryFaculty.firstname# #qryfaculty.lastname#</option>
                </cfoutput>
            </select>
        </div><br><br>
        <button type="submit" class="btn btn-primary">Download</button>
    </form>
    <hr>
    <h3>Select a term below to view portfolio grades</h3>
    <form action="admin-searchresult.htm" method="post">
        <input name="type" type="hidden" value="termsearch">
        <div class="form-group">
            <label>Select Semester</label>
            <select class="form-control" name="term" id="term">
                <cfoutput query="qryterm">
                          <option value="#qryterm.termcode#">#qryterm.term#</option>
                    </cfoutput>
    </select>
        </div>
        <button type="submit" class="btn btn-primary">Download</button>
    </form>
    <hr>
    <h3>Select a Grading group to view their grades</h3>
    <form action="admin-searchresult.htm" method="post">
        <input name="type" type="hidden" value="gradegroupsearch">
        <div class="form-group">
            <label>Grading Group</label><br>

            <div class="col-xs-6">
                <select class="form-control" name="term" id="term">
                <cfoutput query="qryterm">
                    <option id="#qryterm.termcode#" value="#qryterm.termcode#">#qryterm.term#</option>
                </cfoutput>
            </select>
            </div>
            <div class="col-xs-6">
                <select class="form-control" name="GradingGroup" id="GradingGroup">
                <cfoutput query="qrygradinggroup">
                    <option value="#qrygradinggroup.groupnum#">#qrygradinggroup.groupnum#</option>
                </cfoutput>
            </select>
            </div><br><br>
        </div>
        <button type="submit" class="btn btn-primary">Download</button>
    </form>
    <cfelse>
        <cfSet sb.useRedirect="menu.htm " />
</cfif>

<script>
    //used for dropdowns
    var $select1 = $('#Term'),
        $select2 = $('#Prof'),
        $options = $select2.find('option');

    $select1.on('change', function() {
        $select2.html($options.filter('[id="' + this.value + '"]'));
    }).trigger('change');

</script>
