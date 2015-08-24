<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main"/>
		<title>Welcome to Grails</title>
		
	</head>
	<body>
		<div id="grailsLogo" role="banner">
                    <a href="http://grails.org"><asset:image src="grails_logo.png" alt="Grails"/></a>
                    
                    <div class="btn-group" role="group" aria-label="..." style="width:960px;">
                        
                        <button type="button" class="btn btn-default btn-bottom" onclick="addPanel('Left', '${createLink(controller:"go100",action:"index")}')">Left</button>
                        <button type="button" class="btn btn-default btn-bottom">Middle</button>
                        <button type="button" class="btn btn-default btn-bottom">Right</button>
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
                
                <div id="appTab" class="easyui-tabs" style="width:960px;">
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
                
                <script type="text/javascript">
		var title = '';
                var tab_counter = 0;
                var counter = 0;
		function addPanel(t, url){
                        if ($('#appTab').tabs('exists', t)) {
                            $('#appTab').tabs('select', t);
                        } else {
                            var content = '<iframe scrolling="auto" frameborder="0"  src="'+url+'" style="width:100%;height:100%;"></iframe>';
                            $('#appTab').tabs('add',{
                                    title: t,
                                    content: content,
                                    closable: true
                            });                   
                        }
                        
		}
		function removePanel(){
			var tab = $('#appTab').tabs('getSelected');
			if (tab){
				var index = $('#appTab').tabs('getTabIndex', tab);
				$('#appTab').tabs('close', index);
			}
		}
                </script>
                
                <div class="footer" role="contentinfo"></div>
		<div id="spinner" class="spinner" style="display:none;"><g:message code="spinner.alt" default="Loading&hellip;"/></div>
	</body>
</html>
