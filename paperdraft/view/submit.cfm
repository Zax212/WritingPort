<ul class="nav nav-tabs">
    <li class="nav-item">
        <a href="paperdraft-index.htm?draft=-1">View Draft's</a>
    </li>
</ul>
<div class="form-group">
    <form name="draftpaper" action="paperdraft-submitted.htm" method="post" enctype="multipart/form-data">
        <br>
        <label for="draftnum">Draft #:</label><br>
        <select name="draftnum" class="form-control">
      <option value=1>Draft 1</option>
      <option value=2>Draft 2</option>
      <option value=3>Draft 3</option>
      <option value=4>Draft 4</option>
      <option value=5>Draft 5</option>
    </select><br>

        <input type="hidden" name="user" value="<cfoutput>#session.user.id#</cfoutput>">
        <input type="hidden" name="final" value=0>

        <label for="title">Title:</label><br>
        <input type="Text" name="title" id="title" value="This is a Title" class="form-control"><br><br>
        <label for="description">Description:</label><br>
        <textarea name="description" id="description" cols="40" rows="5" class="form-control">this is a description of the paper I am submitting.</textarea><br><br>

        <table>
            <tr>
                <td><input id="uploadFile" type="file" name="uploadfile"class="form-control" /></td>
                <td><button type="submit" class="btn btn-primary" class="form-control">Submit Draft</button></td>
            </tr>
        </table>
    </form>
</div>
