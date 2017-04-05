<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*"%>
<%@page import="java.io.InputStream"%>
<%@page import="java.io.*" %>
<%@page import="java.net.*" %>
<%
    InputStream stream = this.getClass().getClassLoader().getResourceAsStream("/environment.properties");
    Properties p = new Properties();
    p.load(stream);
   
    /* Load Env Properties */
    String appURL = p.getProperty("core.source.directory");
    String webURL = p.getProperty("project.resource.directory");
    
    /* Login Script */
    String recv;
    String recvbuff = "";
    URL jsonpage = new URL( appURL + "evo-flightdeck-webapp/logon.do?username=cmartin&password=abc123");
    URLConnection urlcon = jsonpage.openConnection();
    BufferedReader buffread = new BufferedReader(new InputStreamReader(urlcon.getInputStream()));
    
      while ((recv = buffread.readLine()) != null) {
        recvbuff += recv;
      }
      buffread.close();
      System.out.println("response=" + recvbuff);
    
    /* Request Params */
    String businessUnitId = request.getParameter("businessUnitId");
    String countryCode = request.getParameter("countryCode");
    String promotionCode = request.getParameter("promotionCode");
    String flavour = request.getParameter("flavour");
    String pId = request.getParameter("productGroupId");
      if (pId == null){
        pId = "";
      } else {
        pId = request.getParameter("productGroupId");
      }
      
   
    /* Includes */
    String includeURL = "";
    if ( flavour != null && !flavour.isEmpty() ){
      includeURL = "/resources/" + businessUnitId + "/" + flavour;
    } else {
      includeURL = "/resources/" + businessUnitId;
    }

    String imports = includeURL + "/includes/imports.jsp";
    String header  = includeURL + "/includes/header.jsp";
    String footer  = includeURL + "/includes/footer.jsp";
    
%>
<!DOCTYPE HTML>
<!--[if lt IE 7]> <html class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]> <html class="no-js lt-ie9 lt-ie8 ie7"> <![endif]-->
<!--[if IE 8]> <html class="no-js lt-ie9 ie8"> <![endif]-->
<!--[if gt IE 8]><!-->
<html>
  <head>
    <% if(businessUnitId == null){ %>    
     <%@include file="/resources/error.jsp"%>
    <% } else { %>
    <!-- dovetail:CORE -->
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="stylesheet" href="<%= appURL %>evo-flightdeck-webapp/css/base.css" type="text/css">

    <script type="text/javascript" src='<%= appURL %>evo-flightdeck-webapp/js/dojo/dojo.js' data-dojo-config='parseOnLoad: true'></script>
    <script type="text/javascript" src='<%= appURL %>evo-flightdeck-webapp/js/evo/storefront.js'></script>
    <script type='text/javascript' src='<%= appURL %>evo-flightdeck-webapp/dwr/engine.js'></script>
    <script type='text/javascript' src='<%= appURL %>evo-flightdeck-webapp/dwr/interface/WebConnector.js'></script> 
    <script type='text/javascript' src='<%= appURL %>evo-flightdeck-webapp/dwr/util.js'></script>
    <script>
       require([
       "dojo/ready",
       "dijit/registry",
       "evo/storefront/controller/StoreFrontController",
       "dojo/on",
       "dojo/_base/window",
       "dojo/dom-attr",
       "dbootstrap/main"
       ],
       function (ready, registry, StoreFrontController, on, win, attr, dbootstrap) {
        ready(function () {

          var businessUnitId = '<%= businessUnitId %>';
          var countryCode = '<%= countryCode %>';

          if (businessUnitId === 'null'){
            console.log("No businessUnitId set");
          }

          if (countryCode === 'null'){
            console.log("No countryCode set");
            countryCode = 'GBR';
          }

          var productGroupId = "<%= pId %>";
           if (!productGroupId){
             productGroupId = null;
           }

          var credentials = JSON.parse('<%= recvbuff%>');
          var sessionId = credentials.sessionId;
          var params = {businessUnitId: businessUnitId};
          var countryList = {
                  'GBR':'United Kingdom'
                   };
          var subject = new StoreFrontController({
            standAlone: true,
            sessionId: sessionId,
            inboundTargetName:"newMessage",
            businessUnitId: businessUnitId,
            countryCode: countryCode,
            config: null,
            countryList: countryList,
            productGroupId: productGroupId,
            isRemote: true
            }, "store");

          subject.startup();

          on(win.doc, ".multiviewBtn:click", function(evt) {
              var actionData = attr.get(evt.target, "data-action-data");
              var actionId = attr.get(evt.target, "data-action-id");

              if (actionId === "goto") {
                var view = registry.byId("multiViewManagerPane");
                view.show(actionData);
                window.scrollTo(0, 0);
              }
          });
        });
       });

      function newMessage(msg) {
        var store = dijit.byId("store");
        if (typeof store !== 'undefined' && store !== null) {
           var datasource = store.get("datasource");
           if (typeof datasource !== 'undefined' && datasource !== null) {
             datasource.newMessage(msg);
           }
        }
      }
    </script>
    <!-- Client Includes -->
    <jsp:include page="<%= imports %>" flush="true"/>
  </head>

  <body class="dbootstrap">
    <jsp:include page="<%= header %>" flush="true"/>
    <div class="wrapper">
      <div class="main">
        <div id="store" class="container main"></div>
        <div id="loadingOverlay" class="container main hidden">
          <div class="loading">Loading&#8230;</div>
        </div>
      </div>
    </div>
    <jsp:include page="<%= footer %>" flush="true"/>
  </body>
  <% } %>
</html>
