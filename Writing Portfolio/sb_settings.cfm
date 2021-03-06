<!--- IF YOUR SERVER SUPPORTS .htaccess FILES AND MOD REWRITE SET THIS TO "true". --->
<cfSet sb.useModRewrite = true />
<!--- DEVELOPMENT SERVER LIST. SB.ISDEVELOPMENT WILL BE SET IF CGI.HTTP_HOST IS WITHIN THE LIST. --->
<cfSet sb.developmentServers = isDefined("server.developmentServers") ? server.developmentServers : "intranet-test.server.gvsu.edu,148.61.10.66,intranet-test.gvsu.edu,localhost" />
<!--- THIS VARIABLE IS GLOBAL TO ALL, BUT ONLY REFERENCED ON sb_template.cfm --->
<cfSet sb.title = "Writing Portfolio" />
<!--- AUTHENTICATION --->
<cfSet sb.sessionCheck = "session.user" /> <!--- A VALUE SUCH AS "session.user" WOULD BE HERE --->
<cfSet sb.defaultSessionPath = "login_post.htm" /> <!--- WHERE SWITCHBOARD WILL REDIRECT TO IF SESSIONCHECK IS DEFINED AND THE USER ATTEMPTS TO ACCESS A PAGE THEY *DONT* HAVE TO BE LOGGED INTO --->
<cfSet sb.defaultNoSessionPath = "index.htm?error=session" /> <!--- WHERE SWITCHBOARD WILL REDIRECT TO IF SESSIONCHECK IS *NOT* DEFINED AND THE USER ATTEMPTS TO ACCESS A PAGE THEY HAVE TO BE LOGGED INTO --->
<cfSet sb.noSessionActions = "index" /> <!--- CITCUIT/PAGES SUCH AS "index,examplecircuit-index,login_post" THAT A USER CAN ACCESS WITHOUT BEING LOGGED IN --->
<cfSet sb.anySessionActions = "loggedout,loginerror" />
<cfSet sb.errorToEmail = "snyderb@gvsu.edu,nelsnich@gvsu.edu" />