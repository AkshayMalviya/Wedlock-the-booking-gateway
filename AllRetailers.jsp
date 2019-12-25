<%@ page import="java.sql.*" %>

<% Class.forName("com.mysql.jdbc.Driver"); %>


<!DOCTYPE html>
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
                padding: 10px;
            }

            tr:nth-child(even){background-color: #f2f2f2}

            th {
                background-color: #663300; 
                color: white;
                border-radius:20px;
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
                font-family: "harrington",monaco,fantasy;
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
                color:white;
            }
            h2{
                margin-left:150px;
            }
            body{
                background-color:  


                    #ffd9b3;
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


                        <li><a href='AllRetailers.jsp'>Records</a></li>
                        <li><a href='Allusers.jsp'>Users</a></li>
                        <li ><a href='AllContent.jsp'>Services</a></li>
                        <li class="current"><a href='AllRetailers.jsp'>Retailers</a></li>
                        <li><a href='allOrders.jsp'>Orders</a></li>
                        <li><a href="Login.html">Logout</a></li>

                    </ul>
                </nav>
            </header>
        </div>

        <h2 style="font-style: italic;font-size:40px;">Retailers information</h2>

        <%
            Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/bookgate", "root", "root");

            Statement statement1 = connection.createStatement();
            ResultSet resultset1
                    = statement1.executeQuery("select id,name,price,mobile,description from venue");
            Statement statement2 = connection.createStatement();
            ResultSet resultset2
                    = statement2.executeQuery("select id,name,price,mobile,description from planner");
            Statement statement3 = connection.createStatement();
            ResultSet resultset3
                    = statement3.executeQuery("select id,name,price,mobile,description from caterer");
            Statement statement4 = connection.createStatement();
            ResultSet resultset4
                    = statement4.executeQuery("select id,name,price,mobile,description from photographer");
            Statement statement5 = connection.createStatement();
            ResultSet resultset5
                    = statement5.executeQuery("select id,name,price,mobile,description from flowerist");
        %>

        <div align='center'>
            <table>
                <TR>
                    <TH><font color="white">Retailer's ID</TH>
                    <TH><font color="white">Retailer's Name</TH>
                    <TH><font color="white">Price</TH>
                    <TH><font color="white">Mobile</TH>
                    <TH><font color="white">Description</TH>

                </TR>
                <% while (resultset1.next()) {%>
                <TR>
                    <TD><font color="black"> <%= resultset1.getInt(1)%></td>
                    <TD><font color="black"> <%= resultset1.getString(2)%></TD>
                    <TD><font color="black"> <%= resultset1.getInt(3)%></TD>
                    <TD><font color="black"> <%= resultset1.getString(4)%></TD>
                    <TD><font color="black"> <%= resultset1.getString(5)%></TD>

                </TR>
                <% }%>
                 <% while (resultset2.next()) {%>
                <TR>
                    <TD><font color="black"> <%= resultset2.getInt(1)%></td>
                    <TD><font color="black"> <%= resultset2.getString(2)%></TD>
                    <TD><font color="black"> <%= resultset2.getInt(3)%></TD>
                    <TD><font color="black"> <%= resultset2.getString(4)%></TD>
                    <TD><font color="black"> <%= resultset2.getString(5)%></TD>

                </TR>
                <% }%>
                 <% while (resultset3.next()) {%>
                <TR>
                    <TD><font color="black"> <%= resultset3.getInt(1)%></td>
                    <TD><font color="black"> <%= resultset3.getString(2)%></TD>
                    <TD><font color="black"> <%= resultset3.getInt(3)%></TD>
                    <TD><font color="black"> <%= resultset3.getString(4)%></TD>
                    <TD><font color="black"> <%= resultset3.getString(5)%></TD>

                </TR>
                <% }%>
                 <% while (resultset4.next()) {%>
                <TR>
                    <TD><font color="black"> <%= resultset4.getInt(1)%></td>
                    <TD><font color="black"> <%= resultset4.getString(2)%></TD>
                    <TD><font color="black"> <%= resultset4.getInt(3)%></TD>
                    <TD><font color="black"> <%= resultset4.getString(4)%></TD>
                    <TD><font color="black"> <%= resultset4.getString(5)%></TD>

                </TR>
                <% }%>
                 <% while (resultset5.next()) {%>
                <TR>
                    <TD><font color="black"> <%= resultset5.getInt(1)%></td>
                    <TD><font color="black"> <%= resultset5.getString(2)%></TD>
                    <TD><font color="black"> <%= resultset5.getInt(3)%></TD>
                    <TD><font color="black"> <%= resultset5.getString(4)%></TD>
                    <TD><font color="black"> <%= resultset5.getString(5)%></TD>

                </TR>
                <% }%>
            </TABLE>
        </div>
    </BODY>
</HTML>