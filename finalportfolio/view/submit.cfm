<h2>Submit Final Portfolio</h2>
<hr>
<div class="form-group">
<form name="portfolio" action="finalportfolio-submitted.htm" method="post" enctype="multipart/form-data">
    <input type="hidden" name="user" value="<cfoutput>#session.user.id#</cfoutput>">
    <input type="hidden" name="final" value=1>
    
    <h4>Paper 1</h4>
    <label for="title1" >Title:</label><br>
    <input type="Text" class="form-control" name="title1" id="title1" value="Paper 1"><br><br>
    <label for="description1">Description:</label><br>
    <textarea class="form-control" name="description1" id="description1" cols="40" rows="5">this is a description of the paper I am submitting.</textarea><br>
    <input class="form-control" id="uploadFile" type="file" name="file1" />
    <br><hr>
    
    <h4>Paper 2</h4>
    <label for="title2" >Title:</label><br>
    <input type="Text" class="form-control" name="title2" id="title2" value="Paper 2"><br><br>
    <label for="description2">Description:</label><br>
    <textarea class="form-control" name="description2" id="description2" cols="40" rows="5">this is a description of the paper I am submitting.</textarea><br>
    <input class="form-control"id="uploadFile" type="file" name="file2"/>
    <br><hr>
    
    <h4>Paper 3</h4>
    <label for="title3" >Title:</label><br>
    <input type="Text" class="form-control" name="title3" id="title3" value="Paper 3"><br><br>
    <label for="description3">Description:</label><br>
    <textarea class="form-control" name="description3" id="description3" cols="40" rows="5">this is a description of the paper I am submitting.</textarea><br>
    <input class="form-control" id="uploadFile" type="file" name="file3"/>
    <br><br>
    
    <button type="submit" class="btn btn-primary">Submit Portfolio</button>
</form>
</div>