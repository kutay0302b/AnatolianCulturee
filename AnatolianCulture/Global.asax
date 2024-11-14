<%@ Application Language="C#" %>
<%@ Import Namespace="System.Web.Routing" %>

<script runat="server">


    void Application_Start(object sender, EventArgs e)
    {
       ScriptResourceDefinition myScriptResDef = new ScriptResourceDefinition();
    myScriptResDef.Path = "~/Scripts/WebForms/MSAjax/MicrosoftAjax.js";
    myScriptResDef.DebugPath = "~/Scripts/WebForms/MSAjax/MicrosoftAjax.debug.js";
    myScriptResDef.CdnPath = "http://ajax.microsoft.com/ajax/4.5/1/MicrosoftAjax.js";
    myScriptResDef.CdnDebugPath = "http://ajax.microsoft.com/ajax/4.5/1/MicrosoftAjax.debug.js";
    ScriptManager.ScriptResourceMapping.AddDefinition("microsoftajax", null, myScriptResDef);

        RouteConfig.RegisterRoutes(RouteTable.Routes);
    }
    
    void Application_End(object sender, EventArgs e) 
    {
        //  Code that runs on application shutdown

    }
        
    void Application_Error(object sender, EventArgs e) 
    { 
        // Code that runs when an unhandled error occurs

    }

    void Session_Start(object sender, EventArgs e) 
    {
        // Code that runs when a new session is started

    }

    void Session_End(object sender, EventArgs e) 
    {
        // Code that runs when a session ends. 
        // Note: The Session_End event is raised only when the sessionstate mode
        // is set to InProc in the Web.config file. If session mode is set to StateServer 
        // or SQLServer, the event is not raised.

    }
       
</script>
