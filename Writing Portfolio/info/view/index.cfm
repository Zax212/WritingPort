<h2>Your Submitted Drafts</h2>
<!-- <cfDump var="#session.user#" /> -->

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
            <cfif #qryDraft.USERNAME# eq #session.user.ldap# AND #qryDraft.FINAL# eq 0>
                <tr>
                    <td>#qryDraft.USERNAME#</td>
                    <td>#qryDraft.TITLE#</td>
                    <td>#qryDraft.DESCRIPTION#</td>
                    <td><a href="download.htm?FileName=#qryDraft.FILENAME#&username=#qryDraft.USERNAME#">#qryDraft.FILENAME#</a></td>
                    <td>#qryDraft.DRAFTNUM#</td>
                    <td><a href="info-deleteDraft.htm?filename=#qryDraft.FILENAME#&fileid=#qryDraft.FILEID#" name="del">Delete</a></td>
                </tr>
            </cfif>
        </cfoutput>
    </tbody>
</table>

<h2>Your Portfolio</h2>
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
            <cfif #qryDraft.USERNAME# eq #session.user.ldap# AND #qryDraft.FINAL# eq 1>
                <tr>
                    <td>#qryDraft.USERNAME#</td>
                    <td>#qryDraft.TITLE#</td>
                    <td>#qryDraft.DESCRIPTION#</td>
                    <td><a href="download.htm?FileName=#qryDraft.FILENAME#&username=#qryDraft.USERNAME#">#qryDraft.FILENAME#</a></td>
                    <td><a href="info-deleteDraft.htm?id=#qryDraft.FILENAME#" name="del">Delete</a></td>
                </tr>
            </cfif>
        </cfoutput>
    </tbody>
</table>