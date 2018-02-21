<ul class="nav nav-tabs">
        <li class="nav-item">
            <a href="paperdraft-index.htm">View Draft's</a>
        </li>
    </ul>

    <h2>The Following Paper Was Submitted</h2>

    <table class="table">
        <thead>
            <tr>
                <th>User</th>
                <th>Draft #</th>
                <th>Title</th>
                <th>Description</th>
                <th>File Uploaded</th>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td>
                    <cfdump var="#form.user#">
                </td>
                <td>
                    <cfdump var="#form.draftnum#">
                </td>
                <td>
                    <cfdump var="#form.title#">
                </td>
                <td>
                    <cfdump var="#form.description#">
                </td>
                <td>
                    <cfdump var="#cffile.serverfile#">
                </td>
            </tr>
        </tbody>
    </table>