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
        
                <script>  
                $(function() {     
                  $("#tabs").tabs();
                });
                </script>
	</head>
	<body>
		
                
		<g:layoutBody/>
		
	</body>
</html>
