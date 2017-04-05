<% 
  String businessUnitId = request.getParameter("businessUnitId");
  String countryCode = request.getParameter("countryCode");
  if (businessUnitId == null){
      businessUnitId = "DOVECL23";
  }
  String parameterPath = "";
  if (countryCode != null){
    parameterPath = "?countryCode=" + countryCode;
  }
  
  String url = request.getRequestURL().toString();
  String baseURL = url.substring(0, url.length() - request.getRequestURI().length()) + request.getContextPath() + "/" + parameterPath;
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<header>
			<nav class="top-nav">
				<div class="container">	  
					<ul class="nav navbar-nav">
						<li><a onclick='window.location.href="mailto:scoop@servicehelpline.co.uk"'><span class="glyphicon glyphicon-envelope visible-xs-inline-block hidden-lg hidden-md hidden-sm"></span><span class="hidden-xs">scoop@servicehelpline.co.uk</span></a></li>
            <li><a onclick='window.location.href="tel:+441795412895"'><span class="glyphicon glyphicon-earphone visible-xs-inline-block hidden-lg hidden-md hidden-sm"></span></a></li>
					</ul>
				</div>
			</nav>
			<div class="container main-header">
			<div class="row">
					<div class="col-xs-12 col-sm-4">
            <a href="/<%= parameterPath %>" class="logo navbar-brand"></a>
					</div>
				<div class="col-sm-8 hidden-xs">
					<div class="col-sm-5 col-lg-7">
							<div class="secure-logo-header">
								<img alt="Secure" src="resources/<%= businessUnitId %>/img/secure-logo.png">
							</div>
					</div>
					<div class="col-sm-7 col-lg-5">
						<div class="header-phone">
							<h3>CUSTOMER SERVICE:</h3>
							<h1 class="cs-phone">+44 (0)1795 412 895</h1>
              <p class="cs-opening"><small>(GMT 8.00am - 8.00pm, Mon - Fri &amp; 9am - 1pm Sat)</small></p>
						</div>
					</div>
				</div>
			</div>
		</div>
    <nav class="navbar-default navbar navbar-static-top hidden-xs" role="navigation">
      <div class="container">
        <div class="collapse navbar-collapse auto-nav" id="auto-nav-collapse">
          <ul class="nav navbar-nav">
            <li class="subscriptions-nav active"><a href="/"><span>Subscriptions</span></a></li>
            <li class="subscriptions-nav pull-right" id="miniBasketHolder"><div id="miniBasket"></div></li>
          </ul>
        </div>
      </div>
    </nav>
	</header>