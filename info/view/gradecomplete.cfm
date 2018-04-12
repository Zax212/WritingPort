<ul class="nav nav-tabs">
    <li class="nav-item">
        <a href="info-grade.htm">Grade Portfolio's</a>
    </li>
</ul><br>
<cfoutput query="qrygradecomplete">
<div class="col-md-12">
        <div class="panel panel-primary menu">
            <div class="panel-heading">
                Portfolio by #qrygradecomplete.createdby#
            </div>
            <div class="panel-body">

                <div class="col-sm-6">
                    <cfif len(firstreadgrade)>
                        <div class="panel panel-info">
                            <div class="panel-heading">
                                <div class="row">
                                    <div class="col-md-8 text-left panel-title"></div>
                                    <div class="col-md-5">First Grade: #qrygradecomplete.firstreadgrade#</div>
                                </div>
                            </div>
                            <div class="panel-body">
                                <strong>Comment:</strong><br>#qrygradecomplete.firstreadcomments#<br><br>
                            </div>
                        </div>
                    </cfif>
                    <cfif len(thirdreadgrade)>
                        <div class="panel panel-info">
                            <div class="panel-heading">
                                <div class="row">
                                    <div class="col-md-8 text-left panel-title"></div>
                                    <div class="col-md-5">Third Grade: #qrygradecomplete.thirdreadgrade#</div>
                                </div>
                            </div>
                            <div class="panel-body">
                                <strong>Comment:</strong><br>#qrygradecomplete.thirdreadcomments#<br><br>
                            </div>
                        </div>
                    </cfif>
                </div>



                <div class="col-sm-6">
                    <cfif len(secondreadgrade)>
                        <div class="panel panel-info">
                            <div class="panel-heading">
                                <div class="row">
                                    <div class="col-md-8 text-left panel-title"></div>
                                    <div class="col-md-5">Second Grade: #qrygradecomplete.secondreadgrade#</div>
                                </div>
                            </div>
                            <div class="panel-body">
                                <strong>Comment:</strong><br>#qrygradecomplete.secondreadcomments#<br><br>
                            </div>
                        </div>
                    </cfif>
                    <cfif len(finalgradecomments)>
                        <div class="panel panel-info">
                            <div class="panel-heading">
                                <div class="row">
                                    <div class="col-md-8 text-left panel-title"></div>
                                    <div class="col-md-5">Final Grade: #qrygradecomplete.finalgrade#</div>
                                </div>
                            </div>
                            <div class="panel-body">
                                <strong>Comment:</strong><br>#qrygradecomplete.finalgradecomments#<br><br>
                            </div>
                        </div>
                    </cfif>

                </div>

    
    </div>
    </div>
</div>
</cfoutput>