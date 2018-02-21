<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="en">
<head>
    <meta http-equiv="content-type" content="text/html; charset=utf-8" />
    <title><cfOutput>#sb.title#</cfOutput></title>

    <link href="files/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <link href="files/css/style.css" rel="stylesheet" type="text/css" />

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
    <script src="files/js/bootstrap.min.js"></script>
    <script src="files/js/common.js"></script>
</head>
<body>
    <cf_header>

    <div id="container">
        <div id="site-title">
            <cfIf isDefined("session.user.id")>
                <div id="navbuttons">
                    <ul class="nav nav-pills navbar-right">
                        <li<cfIf sb.page EQ "menu"> class="active"</cfIf>><a href="menu.htm">Menu</a></li>
                        <li><a href="logoff.htm">Logout</a></li>
                    </ul>
                </div>
            </cfIf>

            <h1>
                <cfOutput>#sb.title#</cfOutput>
            </h1>
        </div>
        <div id="content">
            <cfIf isDefined("url.msg")>
                <div class="alert alert-success alert-dismissible" role="alert">
                    <button type="button" class="close" data-dismiss="alert"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                    <cfOutput>#url.msg#</cfOutput>
                </div>
            <cfElseIf isDefined("url.err")>
                <div class="alert alert-danger alert-dismissible" role="alert">
                    <button type="button" class="close" data-dismiss="alert"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                    <cfOutput>#url.err#</cfOutput>
                </div>
            </cfIf>
            <cfOutput>#sb.content#</cfOutput>
            <div class="clearfix"></div>
        </div>
        <div id="footer">
            <p>
                <cfOutput>
                    &copy; #year(now())# <a href="/Writing Portfolio">#sb.title#</a>
                </cfOutput>
            </p>
        </div>
    </div>
</body>
</html>
