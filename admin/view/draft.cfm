<cfif session.user.admin eq true>
    <h2>Admin Page</h2>
    <ul class="nav nav-tabs">
    <li class="nav-item">
        <a href="admin-index.htm">Admin Control's</a>
    </li>
</ul>
    <h4>*Draft #0 indicates a final portfolio</h4>
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
                <tr>
                    <td>#qryDraft.USERNAME#</td>
                    <td>#qryDraft.TITLE#</td>
                    <td>#qryDraft.DESCRIPTION#</td>
                    <td><a href="download.htm?FileName=#qryDraft.FILENAME#&username=#qryDraft.USERNAME#">#qryDraft.FILENAME#</a></td>
                    <td>#qryDraft.DRAFTNUM#</td>
                    <td><a href="admin-deleteDraft.htm?filename=#qryDraft.FILENAME#&fileid=#qryDraft.FILEID#" name="del"><img src="files/img/delete.png" alt="User Information" /></a></td>
                </tr>
        </cfoutput>
    </tbody>
</table>
    
<cfelse>
    <cfSet sb.useRedirect = "menu.htm" />
</cfif> 