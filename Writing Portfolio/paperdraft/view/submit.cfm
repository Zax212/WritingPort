<ul class="nav nav-tabs">
    <li class="nav-item">
        <a href="paperdraft-index.htm">View Draft's</a>
    </li>
</ul>

<form name="draftpaper" action="paperdraft-submitted.htm" method="post" enctype="multipart/form-data">
    <br>
    <label for="draftnum">Draft #:</label><br>
    <select name="draftnum">
      <option value=1>Draft 1</option>
      <option value=2>Draft 2</option>
      <option value=3>Draft 3</option>
      <option value=4>Draft 4</option>
      <option value=5>Draft 5</option>
    </select><br>

    <input type="hidden" name="user" value="<cfoutput>#session.user.ldap#</cfoutput>">
    <input type="hidden" name="final" value=0>

    <label for="title">Title:</label><br>
    <input type="Text" name="title" id="title" value="This is a Title"><br><br>
    <label for="description">Description:</label><br>
    <textarea name="description" id="description" cols="40" rows="5">this is a description of the paper I am submitting.</textarea><br><br>

    <table>
        <tr>
            <td><input id="uploadFile" type="file" name="uploadfile" /></td>
            <td><button type="submit" class="btn btn-primary">Submit Draft</button></td>
        </tr>
    </table>
</form>
