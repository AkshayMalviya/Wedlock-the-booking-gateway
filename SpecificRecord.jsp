<%@ page import="java.sql.*" %>
 <%
        HttpSession session1 = request.getSession();
        String name = session.getAttribute("name").toString();
        String category = session.getAttribute("category").toString();
                
    %>

<% Class.forName("com.mysql.jdbc.Driver"); %>

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
    
          
     <li><a href='index.html'>Home</a></li>
     <li ><a href='EnterContent.jsp'>Insert Data</a></li>
     <li class="current"><a href='SpecificRecord.jsp'>History</a></li>
     <li><a href='logout.html'>logout</a></li>
        
      </ul>
    </nav>
  </header>
</div>
<% 
            Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/bookgate", "root", "root");

            Statement statement = connection.createStatement() ;
            ResultSet resultset = 
                statement.executeQuery("select * from content where seller = '" + name +"' ;") ; 
        %>

        <TABLE BORDER="1">
            <TR>
                <TH>ID</TH>
               <TH>CATEGORY</TH>
                <TH>SELLER</TH>
                 <TH>PRICE</TH>
                <TH>QTY</TH>
                <TH>DATE</TH>

            </TR>
            <% while(resultset.next()){ %>
            <TR>
                <TD> <%= resultset.getString(1) %></td>
                <TD> <%= resultset.getString(2) %></TD>
                <TD> <%= resultset.getString(3) %></TD>
                <TD> <%= resultset.getString(4) %></TD>
                <TD> <%= resultset.getString(5) %></TD>
                <TD> <%= resultset.getString(5) %></TD>
            
            </TR>
            <% } %>
        </TABLE>
    </BODY>
</HTML>