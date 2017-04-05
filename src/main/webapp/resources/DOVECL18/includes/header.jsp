<% 
  String businessUnitId = request.getParameter("businessUnitId");
  String countryCode = request.getParameter("countryCode");
  if (businessUnitId == null){
      businessUnitId = "DOVECL18";
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
					 <ul class="nav navbar-nav pull-left hidden-xs">
                        <li><a href="https://www.facebook.com/CraftersCompanion/" target="_blank" title="" data-toggle="tooltip" data-placement="bottom" data-original-title="Facebook"><i class="fa fa-facebook"></i></a></li>
                        <li><a href="https://twitter.com/CrafterscompUK" target="_blank" title="" data-toggle="tooltip" data-placement="bottom" data-original-title="Twitter"><i class="fa fa-twitter"></i></a></li>
                        <li><a href="https://plus.google.com/+crafterscompanion/posts" target="_blank" title="" data-toggle="tooltip" data-placement="bottom" data-original-title="Google+"><i class="fa fa-google-plus"></i></a></li>
                        <li><a href="https://uk.pinterest.com/crafterscompuk/" target="_blank" title="" data-toggle="tooltip" data-placement="bottom" data-original-title="Pinterest"><i class="fa fa-pinterest-p"></i></a></li>
                        <li><a href="http://www.youtube.com/user/crafterscompanion1#p/c/75157B22A327056E" target="_blank" title="" data-toggle="tooltip" data-placement="bottom" data-original-title="YouTube"><i class="fa fa-youtube-play"></i></a></li>
					</ul>
					<ul class="nav navbar-nav">
						<li><a href="mailto:sewinspired@servicehelpline.co.uk"><span class="glyphicon glyphicon-envelope visible-xs-inline-block hidden-lg hidden-md hidden-sm"></span><span class="hidden-xs">sewinspired@servicehelpline.co.uk</span></a></li> 
            <li><a href="tel:+441795418678"><span class="glyphicon glyphicon-earphone visible-xs-inline-block hidden-lg hidden-md hidden-sm"></span></a></li>
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
							<h3 class="line-height-custom">CUSTOMER SERVICE:</h3>
							<h1 class="no-line-height">+44 (0) 1795 418 678</h1>
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