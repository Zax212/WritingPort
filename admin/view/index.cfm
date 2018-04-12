<cfif session.user.role eq 'ADMIN'>
    <h2>System Settings</h2>
    <hr>
    <h3>Change User</h3>
    <h5>Current User:
        <cfoutput>#session.user.id#</cfoutput>
    </h5>
    <form action="admin-changeuser.htm">
        <div class="form-group row">
            <div class="col-xs-3">
                <select class="form-control" name="usr">
                    <cfoutput query="qryUsers">
                        <option>#qryUsers.createdby#</option>
                    </cfoutput> 
                </select><br>
                <button type="submit " class="btn btn-primary ">Change User</button>
            </div>
        </div>
    </form>
    <hr>
    <h3>Current Admin's</h3>
    <div class=" col-sm-12 table-responsive">
        <table class="table">
            <thead>
                <tr>
                    <th>User</th>
                    <th>Modified By</th>
                    <th>Modified Date</th>
                </tr>
            </thead>
            <tbody>
                <cfoutput query="qryAdmins">
                    <tr>
                        <td>#qryAdmins.LDAP#</td>
                        <td>#qryAdmins.MODIFIEDBY#</td>
                        <td>#qryAdmins.MODIFIEDDT#</td>
                    </tr>
                </cfoutput>
            </tbody>
        </table>
    </div>
    <h3>Add Admin User </h3>
    <form action="admin-adduser.htm">
        <div class="form-group row">
            <div class="col-xs-3">
                <label for="usrname">Username</label>
                <input type="text" class="form-control" name="usrname" placeholder="smithj"><br>
                <button type="submit " class="btn btn-primary ">Add User</button>
            </div>
        </div>
    </form><br>

    <cfelse>
        <cfSet sb.useRedirect="menu.htm " />
</cfif>
