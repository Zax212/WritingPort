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
    <div id="menu1" class="tab-pane">
        <H3>Draft 1</H3>
            <cfoutput query="qryDraft">
                <cfif #qryDraft.DRAFTNUM# eq 1>
                    
                    
                    <div class="panel panel-primary">
                    <div class="panel-heading">
                        <div class="row">
                            <div class="col-md-4 text-left panel-title">#qryDraft.TITLE#</div>
                            <div class="col-md-5">by:#qryDraft.USERNAME#</div>
                        </div> 
                        
                    </div>
                    <div class="panel-body">Description:<br> &nbsp#qryDraft.DESCRIPTION#<br><br>
                        <a href="paperdraft-comments.htm?username=#qryDraft.username#&title=#qryDraft.TITLE#&description=#qryDraft.Description#&filename=#qryDraft.FILENAME#&fileid=#qryDraft.FILEID#"><button type="button" class="btn btn-primary"><span class="glyphicon glyphicon-comment"></span> Comment</button></a>
                        
                        <a href="download.htm?FileName=#qryDraft.FILENAME#&username=#qryDraft.USERNAME#"><button type="button" class="btn btn-primary"><span class="glyphicon glyphicon-download-alt"></span> Download</button></a></div>
                    </div>
                
                </cfif>
            </cfoutput>
   
    </div>
    <div id="menu2" class="tab-pane">
        <H3>Draft 2</H3>
            <cfoutput query="qryDraft">
                <cfif #qryDraft.DRAFTNUM# eq 2>
                    
                    
                    <div class="panel panel-primary">
                    <div class="panel-heading">
                        <div class="row">
                            <div class="col-md-4 text-left panel-title">#qryDraft.TITLE#</div>
                            <div class="col-md-5">by:#qryDraft.USERNAME#</div>
                        </div> 
                        
                    </div>
                    <div class="panel-body">Description:<br> &nbsp#qryDraft.DESCRIPTION#<br><br>
                        <a href="paperdraft-comments.htm?username=#qryDraft.username#&title=#qryDraft.TITLE#&description=#qryDraft.Description#&filename=#qryDraft.FILENAME#&fileid=#qryDraft.FILEID#"><button type="button" class="btn btn-primary"><span class="glyphicon glyphicon-comment"></span> Comment</button></a>
                        
                        <a href="download.htm?FileName=#qryDraft.FILENAME#&username=#qryDraft.USERNAME#"><button type="button" class="btn btn-primary"><span class="glyphicon glyphicon-download-alt"></span> Download</button></a></div>
                    </div>
                
                </cfif>
            </cfoutput>
    </div>
    <div id="menu3" class="tab-pane">
        <H3>Draft 3</H3>
            <cfoutput query="qryDraft">
                <cfif #qryDraft.DRAFTNUM# eq 3>
                    
                    
                    <div class="panel panel-primary">
                    <div class="panel-heading">
                        <div class="row">
                            <div class="col-md-4 text-left panel-title">#qryDraft.TITLE#</div>
                            <div class="col-md-5">by:#qryDraft.USERNAME#</div>
                        </div> 
                        
                    </div>
                    <div class="panel-body">Description:<br> &nbsp#qryDraft.DESCRIPTION#<br><br>
                        <a href="paperdraft-comments.htm?username=#qryDraft.username#&title=#qryDraft.TITLE#&description=#qryDraft.Description#&filename=#qryDraft.FILENAME#&fileid=#qryDraft.FILEID#"><button type="button" class="btn btn-primary"><span class="glyphicon glyphicon-comment"></span> Comment</button></a>
                        
                        <a href="download.htm?FileName=#qryDraft.FILENAME#&username=#qryDraft.USERNAME#"><button type="button" class="btn btn-primary"><span class="glyphicon glyphicon-download-alt"></span> Download</button></a></div>
                    </div>
                
                </cfif>
            </cfoutput>
    </div>
    <div id="menu4" class="tab-pane">
        <H3>Draft 4</H3>
            <cfoutput query="qryDraft">
                <cfif #qryDraft.DRAFTNUM# eq 4>
                    
                    
                    <div class="panel panel-primary">
                    <div class="panel-heading">
                        <div class="row">
                            <div class="col-md-4 text-left panel-title">#qryDraft.TITLE#</div>
                            <div class="col-md-5">by:#qryDraft.USERNAME#</div>
                        </div> 
                        
                    </div>
                    <div class="panel-body">Description:<br> &nbsp#qryDraft.DESCRIPTION#<br><br>
                        <a href="paperdraft-comments.htm?username=#qryDraft.username#&title=#qryDraft.TITLE#&description=#qryDraft.Description#&filename=#qryDraft.FILENAME#&fileid=#qryDraft.FILEID#"><button type="button" class="btn btn-primary"><span class="glyphicon glyphicon-comment"></span> Comment</button></a>
                        
                        <a href="download.htm?FileName=#qryDraft.FILENAME#&username=#qryDraft.USERNAME#"><button type="button" class="btn btn-primary"><span class="glyphicon glyphicon-download-alt"></span> Download</button></a></div>
                    </div>
                
                </cfif>
            </cfoutput>
    </div>
    <div id="menu5" class="tab-pane">
        <H3>Draft 5</H3>
            <cfoutput query="qryDraft">
                <cfif #qryDraft.DRAFTNUM# eq 5>
                    
                    
                    <div class="panel panel-primary">
                    <div class="panel-heading">
                        <div class="row">
                            <div class="col-md-4 text-left panel-title">#qryDraft.TITLE#</div>
                            <div class="col-md-5">by:#qryDraft.USERNAME#</div>
                        </div> 
                        
                    </div>
                    <div class="panel-body">Description:<br> &nbsp#qryDraft.DESCRIPTION#<br><br>
                        <a href="paperdraft-comments.htm?username=#qryDraft.username#&title=#qryDraft.TITLE#&description=#qryDraft.Description#&filename=#qryDraft.FILENAME#&fileid=#qryDraft.FILEID#"><button type="button" class="btn btn-primary"><span class="glyphicon glyphicon-comment"></span> Comment</button></a>
                        
                        <a href="download.htm?FileName=#qryDraft.FILENAME#&username=#qryDraft.USERNAME#"><button type="button" class="btn btn-primary"><span class="glyphicon glyphicon-download-alt"></span> Download</button></a></div>
                    </div>
                
                </cfif>
            </cfoutput>
    </div>
</div>

<script>
jQuery(document).ready(function($) {
    $(".clickable-row").click(function() {
        window.location = $(this).data("href");
    });
});
</script>