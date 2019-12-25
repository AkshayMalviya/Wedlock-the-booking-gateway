<!DOCTYPE html>
<html lang="en">
    <%
        HttpSession session1 = request.getSession();
        String name = session.getAttribute("name").toString();
        String category = session.getAttribute("category").toString();
                
    %>
<head>
<title>Menu</title>
<meta charset="utf-8">
<link rel="stylesheet" type="text/css" media="screen" href="css/style.css">

</head>
<body>
<div class="sub-pages">
  <header>
    <h1><img src="images/logo.png" alt=""></h1>
    <nav>
      <ul class="menu">
    
          
     <li class="current"><a href='#'>Home</a></li>
     <li><a href='EnterContent.jsp'>Insert Data</a></li>
     <li><a href='SpecificRecord.jsp'>History</a></li>
     <li><a href='logout'>logout</a></li>
        
      </ul>
    </nav>
  </header>
</div>
<!--==============================content================================-->
<h1>Hello  <%= name %> ,</h1>
<br><br><br>
<h1>This is your Home Page..</h1>
<br><br><br>
<h1>YOu can insert your facilty from the next page....</h1>
</body>
</html>
