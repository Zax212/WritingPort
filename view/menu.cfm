<h2>
    Welcome to GVSU's Writing Portfolio System!
</h2>
<div class="panel panel-primary menu">
    <div class="panel-heading">
        GVSU - <strong>Writing Portfolio System</strong>
    </div>
    <div class="panel-body">
        <div class="col-sm-4">
            <div class="list-group">
                <div class="list-group-item list-group-item-success">
                    User Information
                </div>

                <a href="info-index.htm" class="list-group-item">
                    <span class="glyphicon glyphicon-user"></span> User Information
                </a>
                <cfif session.user.role eq "ADMIN" or session.role eq "FACULTY">
                <a href="info-grade.htm" class="list-group-item">
                    <span class="glyphicon glyphicon-book"></span> Grade Portfolios
                </a>
                </cfif>
            </div>
        </div>

        <div class="col-sm-4">
            <div class="list-group">
                <div class="list-group-item list-group-item-success">
                    Papers
                </div>
                <a href="paperdraft-index.htm?draft=-1" class="list-group-item">
                    <span class="glyphicon glyphicon-pencil"></span> View Drafts
                </a>
                <a href="paperdraft-submit.htm" class="list-group-item">
                    <span class="glyphicon glyphicon-pencil"></span> Submit a Draft
                </a>
                <a href="finalportfolio-index.htm" class="list-group-item">
                    <span class="glyphicon glyphicon-book"></span> Submit a Final Portfolio
                </a>
            </div>
        </div>

        <cfIf session.user.role EQ "ADMIN">
            <div class="col-sm-4">
                <div class="list-group">
                    <div class="list-group-item list-group-item-success">
                        Admin Controls
                    </div>
                    <a href="admin-search.htm?search=none" class="list-group-item">
                        <span class="glyphicon glyphicon-tower"></span> Admin Search
                    </a>
                    <a href="admin-index.htm" class="list-group-item">
                        <span class="glyphicon glyphicon-tower"></span> System Settings
                    </a>
                    <a href="admin-gradingGroup.htm" class="list-group-item">
                        <span class="glyphicon glyphicon-tower"></span> View/Modify Grading Groups
                    </a>
                </div>
            </div>
        </cfIf>
    </div>
</div>
