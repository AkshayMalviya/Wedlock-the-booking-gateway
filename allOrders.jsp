<%@ page import="java.sql.*" %>

<% Class.forName("com.mysql.jdbc.Driver"); %>


<html lang="en">
    <head>
        <title>Menu</title>
        <meta charset="utf-8">
        

        <style>
            table {
                border-collapse: collapse;
                width: 80%;
            }

            th, td {
                text-align: left;
                padding: 8px;
            }

            tr:nth-child(even){background-color: #f2f2f2}

            th {
                background-color: #663300;  

                color: white;
               border-radius:20px;
               text-align: left;
            }
            header
{
    margin-top: 0;
    text-align:center;
    background:url('header.png');
    background-size: cover;
    color:white;
    border-radius:20px;
   
}
a{
    color:white;
    text-decoration:none;
}
h1{
    font-size:70px;
}

ul{
    padding:10px;
    background:rgba(0,0,0,0.5)
}
li{
    display:inline;
    padding:0px 10px 0px 10px;
}
img{
    
    margin:40px 0px 0px 0px;
    border:7px solid white;
    border-radius:20px;
}
a:hover{
    color:red;
}
h2{
    margin-left:150px;
}
body{
    background-color: #ffd9b3;
}



            
            
            
            
            
            
            
            
        </style>

    </head>
    <body>
        <div class="sub-pages">
            <header>
                
                <nav>
                    <img src="user.png" style="width:20px;height:20px;">
        <h1>WedLock</h1>
                    
                    
                    <ul class="menu">


                        <li><a href='#'>Records</a></li>
                        <li><a href='Allusers.jsp'>Users</a></li>
                        <li ><a href='AllContent.jsp'>Services</a></li>
                        <li><a href='AllRetailers.jsp'>Retailers</a></li>
                        <li class="current"><a href='allOrders.jsp'>Orders</a></li>

                    </ul>
                </nav>
            </header>
        </div>
          <br><br>
        <%
            Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/bookgate", "root", "root");

            Statement statement = connection.createStatement();
            ResultSet resultset
                    = statement.executeQuery("select * from orderrecord");
        %>

        <div align='center'>
            <TABLE >
                <TR>
                    <TH><font color="black">ID</TH>
                    <TH><font color="black">Quantity</TH>
                    <TH><font color="black">Customer Name</TH>
                    <TH><font color="black">Customer Email</TH>
                    <TH><font color="black">Customer Phone</TH>

                </TR>
                
                <% while (resultset.next()) {%>
                <TR>
                    
                    <TD><font color="black"> <%= resultset.getString(1)%></td>
                    <TD><font color="black"> <%= resultset.getString(2)%></TD>
                    <TD><font color="black"> <%= resultset.getString(3)%></TD>
                    <TD><font color="black"> <%= resultset.getString(4)%></TD>
                    <TD><font color="black"> <%= resultset.getString(5)%></TD>

                </TR>
                <% }%>
            </TABLE>
        </div>
    </BODY>
</HTML>