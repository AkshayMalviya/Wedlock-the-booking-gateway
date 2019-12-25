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
    
          
     <li><a href='#'>Home</a></li>
     <li class="current"><a href='EnterContent.jsp'>Insert Data</a></li>
     <li><a href='SpecificRecord.jsp'>History</a></li>
     <li><a href='logout.html'>logout</a></li>
        
      </ul>
    </nav>
  </header>
</div>
<!--==============================content================================-->
<form method="post" action="Registrat2">
 
<table cellspacing="10" border="1" align="center" width="400" bgcolor="#CCCCCC" >
 
<h2 align ='center'><font face="verdana" color="black">Insert Content</font></h2>
 
<tr>
 
<th><font color="black">Enter ID for Product</font></th>
 
<td><input type="text" name="id" id="fn1" maxlength="10" title="enter your first name" placeholder="ex. 20001" required/></td>
 
</tr>
 
<tr>
 
<th><font color="black">Category's Name</font></th>
 
<td><input type="text" name="category" value="<%= category %>"/></td>
 
</tr>
 
<tr>
 
<th><font color="black">Retailer's Name</font></th>
 
<td><input type="text" name="seller" value="<%= name %>"/></td>
 
</tr>

<tr>
 
<th><font color="black">Enter Price</font></th>
 
<td><input type="text" name="price"/></td>
 
</tr>
 
<tr>
 
<th><font color="black">Enter Qty</font></th>
 
<td><input type="number" name="qty"/></td>
 
</tr>
<tr>
 
<th><font color="black">Select your Date</font></th>
 
<td><input type="date" name="date"/></td>
 
</tr>
 
<tr>
 
<td colspan="2" align="center"><input type="submit" value="Save My Data"/>
 
<input type="reset" value="Reset Data"/>
 
</td>
 
</tr>
 
</table>
 
</form>


</body>
</html>
