
<script>
    // Require the Dialog class
    require(["dijit/registry", "dojo/parser", "dijit/Dialog", "dijit/form/Button", "dojo/domReady!"], function(registry, parser){
        // Show the dialog
        showDialog = function(id) {
            registry.byId(id).show();
        };
        // Hide the dialog
        hideDialog = function(id) {
            registry.byId(id).hide();
        };

        parser.parse();
    });
</script>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<footer class="page-footer">
				<div class="container hidden-xs">
					<div class="header">
						<div class="row">
						  <div class="col-sm-4">
							<h3>Customer Service</h3>
						  </div>
						  <div class="col-sm-4">
							<h3>About Us</h3>
						  </div>
							<div class="col-sm-4 hidden-xs footer-logo">
								<span class="copyright" style="padding: 15px 15px 5px 0; font-size:12px;">&copy; Crafter's Companion <script>document.write(new Date().getFullYear())</script> | All Rights Reserved</span>
							</div>
						</div>
					</div>
					<div class="row footer">
						<div class="col-sm-4">
						  <ul class="list-inline">
							<li><a onclick="showDialog('contact');">Contact Us</a> </li>
							<li><a onclick="showDialog('terms');">Terms and Conditions</a></li>
						  </ul>
						</div>
						<div class="col-sm-4">
						  <ul class="list-inline">
							<li><a onclick="showDialog('faqs');">FAQs</a></li>
							<li><a onclick="showDialog('delivery');">Delivery Policy</a></li>
							<li><a onclick="showDialog('privacy');">Privacy Policy</a></li>
						  </ul>
            </div>
					</div>
				</div>
  	<div class="footer hidden-lg hidden-md hidden-sm mobile-footer">
      <div class="col-xs-12">
        <h3>Customer Service</h3>
        <ul class="list-inline">
        <li><a onclick="showDialog('contact');">Contact Us</a> </li>
        <li><a onclick="showDialog('terms');">Terms and Conditions</a></li>
        </ul>
      </div>
      <div class="col-xs-12">
        <h3>About Us</h3>
        <ul class="list-inline">
        <li><a onclick="showDialog('faqs');">FAQs</a></li>
        <li><a onclick="showDialog('delivery');">Delivery Policy</a></li>
        <li><a onclick="showDialog('privacy');">Privacy Policy</a></li>
        </ul>
      </div>
		</div>
</footer>

<jsp:include page="pages/contact.jsp" flush="true"/>
<jsp:include page="pages/terms.jsp" flush="true"/>
<jsp:include page="pages/privacy.jsp" flush="true"/>
<jsp:include page="pages/delivery.jsp" flush="true"/>
<jsp:include page="pages/faqs.jsp" flush="true"/>