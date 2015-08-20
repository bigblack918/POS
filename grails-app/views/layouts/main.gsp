<!DOCTYPE html>
<!--[if lt IE 7 ]> <html lang="en" class="no-js ie6"> <![endif]-->
<!--[if IE 7 ]>    <html lang="en" class="no-js ie7"> <![endif]-->
<!--[if IE 8 ]>    <html lang="en" class="no-js ie8"> <![endif]-->
<!--[if IE 9 ]>    <html lang="en" class="no-js ie9"> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--> <html lang="en" class="no-js"><!--<![endif]-->
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<title><g:layoutTitle default="Grails"/></title>
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<link rel="shortcut icon" href="${assetPath(src: 'favicon.ico')}" type="image/x-icon">
		<link rel="apple-touch-icon" href="${assetPath(src: 'apple-touch-icon.png')}">
		<link rel="apple-touch-icon" sizes="114x114" href="${assetPath(src: 'apple-touch-icon-retina.png')}">
                
                <link rel="stylesheet" type="text/css" href="${resource(dir:'css',file:'jquery-ui-1.8.11.custom.css')}" />
                <link rel="stylesheet" type="text/css" href="${resource(dir:'themes/default',file:'easyui.css')}" />
                <link rel="stylesheet" type="text/css" href="${resource(dir:'themes',file:'icon.css')}" />
                <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">       
                <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap-theme.min.css">
                <link  rel="stylesheet" href="${resource(dir:'css',file:'docs.css')}" type="text/css" />
                <link  rel="stylesheet" href="${resource(dir:'css',file:'redmond.datepick.css')}" type="text/css" />
  		<asset:stylesheet src="application.css"/>
		<asset:javascript src="application.js"/>
		<g:layoutHead/>
                
                <script type="text/javascript" src="${resource(dir:'js',file:'jquery-1.7.2.min.js')}"></script>
                <script type="text/javascript" src="${resource(dir:'js',file:'jquery-ui.js')}"></script>
                <script language="javascript" src="${resource(dir:'js',file:'jquery.datepick.js')}" type="text/javascript"></script>
                <script language="javascript" src="${resource(dir:'js',file:'jquery.datepick.tw.js')}" type="text/javascript"></script>
                <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
                <script type="text/javascript" src="${resource(dir:'js',file:'jquery.easyui.min.js')}"></script>
                <script type="text/javascript" src="${resource(dir:'js',file:'tool.js')}"></script>
        

                <style type="text/css" media="screen">
			#status {
				background-color: #eee;
				border: .2em solid #fff;
				margin: 2em 2em 1em;
				padding: 1em;
				width: 12em;
				float: left;
				-moz-box-shadow: 0px 0px 1.25em #ccc;
				-webkit-box-shadow: 0px 0px 1.25em #ccc;
				box-shadow: 0px 0px 1.25em #ccc;
				-moz-border-radius: 0.6em;
				-webkit-border-radius: 0.6em;
				border-radius: 0.6em;
			}

			.ie6 #status {
				display: inline; /* float double margin fix http://www.positioniseverything.net/explorer/doubled-margin.html */
			}

			#status ul {
				font-size: 0.9em;
				list-style-type: none;
				margin-bottom: 0.6em;
				padding: 0;
			}

			#status li {
				line-height: 1.3;
			}

			#status h1 {
				text-transform: uppercase;
				font-size: 1.1em;
				margin: 0 0 0.3em;
			}

			#page-body {
				margin: 2em 1em 1.25em 18em;
			}
                        
                        #page {
				margin: 2em 1em 1.25em 1.25em;
			}
                        
			h2 {
				margin-top: 1em;
				margin-bottom: 0.3em;
				font-size: 1em;
			}

			p {
				line-height: 1.5;
				margin: 0.25em 0;
			}

			#controller-list ul {
				list-style-position: inside;
			}

			#controller-list li {
				line-height: 1.3;
				list-style-position: inside;
				margin: 0.25em 0;
			}

			@media screen and (max-width: 480px) {
				#status {
					display: none;
				}

				#page-body {
					margin: 0 1em 1em;
				}

				#page-body h1 {
					margin-top: 0;
				}
			}
                        
                        
		</style>
                <script>  
                $(function() {     
                  $("#tabs").tabs();
                });
                </script>
	</head>
	<body>
		<div id="grailsLogo" role="banner">
                    <a href="http://grails.org"><asset:image src="grails_logo.png" alt="Grails"/></a>
                    
                    <div class="btn-group" role="group" aria-label="..." style="width:960px;">
                        <button type="button" class="btn btn-default" onclick="location.href='${createLink(action:'index',controller:'go100')}'">Left</button>
                        <button type="button" class="btn btn-default">Middle</button>
                        <button type="button" class="btn btn-default">Right</button>
                        <sapn style="float:right;">
                            <g:form name="login" controller="auth" action="signIn">
                                <g:message code="login.username.label" default="帳號: " /><g:textField name="username" />
                                <input type="submit" value="登入" /><br>
                                <g:message code="login.password.label" default="密碼: " /><g:passwordField name="password" />
                                <input class="reset" type="reset" value="清除" />
                            </g:form>
                        </span>
                    </div>
                </div>
                <div class="easyui-tabs" style="width:960px;">
                    <div title="公佈欄" style="padding:10px">
                        <a href="#page-body" class="skip"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
                        <div id="status" role="complementary">
                                <h1>Application Status</h1>
                                <ul>
                                        <li>App version: <g:meta name="app.version"/></li>
                                        <li>Grails version: <g:meta name="app.grails.version"/></li>
                                        <li>Groovy version: ${GroovySystem.getVersion()}</li>
                                        <li>JVM version: ${System.getProperty('java.version')}</li>
                                        <li>Reloading active: ${grails.util.Environment.reloadingAgentEnabled}</li>
                                        <li>Controllers: ${grailsApplication.controllerClasses.size()}</li>
                                        <li>Domains: ${grailsApplication.domainClasses.size()}</li>
                                        <li>Services: ${grailsApplication.serviceClasses.size()}</li>
                                        <li>Tag Libraries: ${grailsApplication.tagLibClasses.size()}</li>
                                </ul>
                                <h1>Installed Plugins</h1>
                                <ul>
                                        <g:each var="plugin" in="${applicationContext.getBean('pluginManager').allPlugins}">
                                                <li>${plugin.name} - ${plugin.version}</li>
                                        </g:each>
                                </ul>
                        </div>
                        <div id="page-body" role="main">
                                <h1>Welcome to Grails</h1>
                                <p>Congratulations, you have successfully started your first Grails application! At the moment
                                   this is the default page, feel free to modify it to either redirect to a controller or display whatever
                                   content you may choose. Below is a list of controllers that are currently deployed in this application,
                                   click on each to execute its default action:</p>

                                <div id="controller-list" role="navigation">
                                        <h2>Available Controllers:</h2>
                                        <ul>
                                                <g:each var="c" in="${grailsApplication.controllerClasses.sort { it.fullName } }">
                                                        <li class="controller"><g:link controller="${c.logicalPropertyName}">${c.fullName}</g:link></li>
                                                </g:each>
                                        </ul>
                                </div>
                        </div>
                    </div>
<!--                    <div title="Help" data-options="iconCls:'icon-help',closable:true" style="padding:10px">
                            This is the help content.
                    </div>-->
                </div>
                
		<g:layoutBody/>
		<div class="footer" role="contentinfo"></div>
		<div id="spinner" class="spinner" style="display:none;"><g:message code="spinner.alt" default="Loading&hellip;"/></div>
	</body>
</html>
