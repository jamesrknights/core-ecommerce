<% 
  String businessUnitId = request.getParameter("businessUnitId");
  if (businessUnitId == null){
           businessUnitId = "DOVECL23";
  }
%>
<!-- Web Page Title -->
<title>Scoop Magazine</title>

<!-- Meta Tags -->
<meta charset="utf-8">
<meta content="IE=9;IE=8;IE=7;IE=EDGE;chrome=1" http-equiv="X-UA-Compatible">
<meta content="width=device-width, initial-scale=1" name="viewport">
<meta name="format-detection" content="telephone=no">

<!-- Style Sheets -->
<link href="resources/<%= businessUnitId %>/img/favicon.ico" rel="shortcut icon">
<link rel="stylesheet" href="resources/<%= businessUnitId %>/css/<%= businessUnitId %>.css" type="text/css">