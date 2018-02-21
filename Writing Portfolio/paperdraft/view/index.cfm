<ul class="nav nav-tabs">
    <li class="active"><a data-toggle="tab" href="#home">Home</a></li>
    <li><a data-toggle="tab" href="#menu1">Draft 1</a></li>
    <li><a data-toggle="tab" href="#menu2">Draft 2</a></li>
    <li><a data-toggle="tab" href="#menu3">Draft 3</a></li>
    <li><a data-toggle="tab" href="#menu4">Draft 4</a></li>
    <li><a data-toggle="tab" href="#menu5">Draft 5</a></li>
</ul>

<div class="tab-content">
    <div id="home" class="tab-pane fade in active">
        <h3>Select what draft version to view</h3>
        <p>If you want to submit a draft click the button below</p>

        <form action="paperdraft-submit.htm">
            <input type="submit" class="btn btn-primary btn-lg" value="Submit a Draft"/>
        </form>

    </div>
    <div id="menu1" class="tab-pane fade">
        <h3>Draft 1</h3>

        <table class="table table-hover">
            <thead>
                <tr>
                    <th>User</th>
                    <th>Title</th>
                    <th>Description</th>
                    <th>File Uploaded</th>
                </tr>
            </thead>
            <tbody>
                <cfoutput query="qryDraft">
                    <cfif #qryDraft.DRAFTNUM# eq 1>
                        <tr class='clickable-row' data-href="paperdraft-comments.htm?username=#qryDraft.username#&title=#qryDraft.TITLE#&description=#qryDraft.Description#&filename=#qryDraft.FILENAME#&fileid=#qryDraft.FILEID#">
                            <td>#qryDraft.USERNAME#</td>
                            <td>#qryDraft.TITLE#</td>
                            <td>#qryDraft.DESCRIPTION#</td>
                            <td><a href="download.htm?FileName=#qryDraft.FILENAME#&username=#qryDraft.USERNAME#">#qryDraft.FILENAME#</a></td>
                        </tr>
                    </cfif>
                </cfoutput>
            </tbody>
        </table>
    </div>
    <div id="menu2" class="tab-pane fade">
        <h3>Draft 2</h3>
        <table class="table table-hover">
            <thead>
                <tr>
                    <th>User</th>
                    <th>Title</th>
                    <th>Description</th>
                    <th>File Uploaded</th>
                </tr>
            </thead>
            <tbody>
                <cfoutput query="qryDraft">
                    <cfif #qryDraft.DRAFTNUM# eq 2>
                        <tr class='clickable-row' data-href="paperdraft-comments.htm?username=#qryDraft.username#&title=#qryDraft.TITLE#&description=#qryDraft.Description#&filename=#qryDraft.FILENAME#&fileid=#qryDraft.FILEID#">
                            <td>#qryDraft.USERNAME#</td>
                            <td>#qryDraft.TITLE#</td>
                            <td>#qryDraft.DESCRIPTION#</td>
                            <td><a href="download.htm?FileName=#qryDraft.FILENAME#&username=#qryDraft.USERNAME#">#qryDraft.FILENAME#</a></td>
                        </tr>
                    </cfif>
                </cfoutput>
            </tbody>
        </table>
    </div>
    <div id="menu3" class="tab-pane fade">
        <h3>Draft 3</h3>
        <table class="table table-hover">
            <thead>
                <tr>
                    <th>User</th>
                    <th>Title</th>
                    <th>Description</th>
                    <th>File Uploaded</th>
                </tr>
            </thead>
            <tbody>
                <cfoutput query="qryDraft">
                    <cfif #qryDraft.DRAFTNUM# eq 3>
                        <tr class='clickable-row' data-href="paperdraft-comments.htm?username=#qryDraft.username#&title=#qryDraft.TITLE#&description=#qryDraft.Description#&filename=#qryDraft.FILENAME#&fileid=#qryDraft.FILEID#">
                            <td>#qryDraft.USERNAME#</td>
                            <td>#qryDraft.TITLE#</td>
                            <td>#qryDraft.DESCRIPTION#</td>
                            <td><a href="download.htm?FileName=#qryDraft.FILENAME#&username=#qryDraft.USERNAME#">#qryDraft.FILENAME#</a></td>
                        </tr>
                    </cfif>
                </cfoutput>
            </tbody>
        </table>
    </div>
    <div id="menu4" class="tab-pane fade">
        <h3>Draft 4</h3>
        <table class="table table-hover">
            <thead>
                <tr>
                    <th>User</th>
                    <th>Title</th>
                    <th>Description</th>
                    <th>File Uploaded</th>
                </tr>
            </thead>
            <tbody>
                <cfoutput query="qryDraft">
                    <cfif #qryDraft.DRAFTNUM# eq 4>
                        <tr class='clickable-row' data-href="paperdraft-comments.htm?username=#qryDraft.username#&title=#qryDraft.TITLE#&description=#qryDraft.Description#&filename=#qryDraft.FILENAME#&fileid=#qryDraft.FILEID#">
                            <td>#qryDraft.USERNAME#</td>
                            <td>#qryDraft.TITLE#</td>
                            <td>#qryDraft.DESCRIPTION#</td>
                            <td><a href="download.htm?FileName=#qryDraft.FILENAME#&username=#qryDraft.USERNAME#">#qryDraft.FILENAME#</a></td>
                        </tr>
                    </cfif>
                </cfoutput>
            </tbody>
        </table>
    </div>
    <div id="menu5" class="tab-pane fade">
        <h3>Draft 5</h3>
        <table class="table table-hover">
            <thead>
                <tr>
                    <th>User</th>
                    <th>Title</th>
                    <th>Description</th>
                    <th>File Uploaded</th>
                </tr>
            </thead>
            <tbody>
                <cfoutput query="qryDraft">
                    <cfif #qryDraft.DRAFTNUM# eq 5>
                        <tr class='clickable-row' data-href="paperdraft-comments.htm?username=#qryDraft.username#&title=#qryDraft.TITLE#&description=#qryDraft.Description#&filename=#qryDraft.FILENAME#&fileid=#qryDraft.FILEID#">
                            <td>#qryDraft.USERNAME#</td>
                            <td>#qryDraft.TITLE#</td>
                            <td>#qryDraft.DESCRIPTION#</td>
                            <td><a href="download.htm?FileName=#qryDraft.FILENAME#&username=#qryDraft.USERNAME#">#qryDraft.FILENAME#</a></td>
                        </tr>
                    </cfif>
                </cfoutput>
            </tbody>
        </table>
    </div>
</div>

<script>
jQuery(document).ready(function($) {
    $(".clickable-row").click(function() {
        window.location = $(this).data("href");
    });
});
</script>