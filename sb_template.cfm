<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="content-type" content="text/html; charset=utf-8" />
        <title>
            <cfOutput>#sb.title#</cfOutput>
        </title>
        <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
        <script type="text/javascript" src="http://code.jquery.com/ui/1.10.2/jquery-ui.js"></script>
        <script type="text/javascript" src="files/js/bootstrap.min.js"></script>
        <script type="text/javascript" src="files/js/common.js"></script>
    
        <link href="files/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
        <link href="files/css/style.css" rel="stylesheet" type="text/css" />
    </head>

    <body>
        <cf_header>

        <div id="container">
            
                <div id="site-title">
                    <div id="navbuttons">
                        <ul class="nav nav-pills">
                            <cfIf isDefined( "session.user.role")>
                            <cfIf session.user.role EQ "ADMIN">
                                <li><a class="text-white" href="admin-index.htm">Admin</a></li>
                            </cfIf>
                            <li><a class=tab-pane fade in active href="menu.htm">Menu</a></li>
                            <li><a class="text-white" href="info-index.htm">User Information</a></li>
                            <li><a class="text-white" href="paperdraft-index.htm?draft=-1">Drafts</a></li>
                            <li><a class="text-white" href="finalportfolio-index.htm">Final Portfolio</a></li>
                                </cfIf>
                            <li><a class="text-white" href="logoff.htm">Logout</a></li>
                            
                        </ul>
                    </div>
                    <h1><cfOutput>#sb.title#</cfOutput></h1>
                </div>
            
            <div id="content">
                <cfOutput>#sb.content#</cfOutput>
                <div class="clearfix"></div>
            </div>
            <div id="footer">
                <p>
                    <cfOutput>
                        &copy;#year(now())# <a href="/writingportfolio">#sb.title#</a>
                    </cfOutput>
                </p>
            </div>
        </div>
    </body>
</html>
