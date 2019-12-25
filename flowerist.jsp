<%-- 
    Document   : flowerist
    Created on : Apr 25, 2017, 1:31:29 PM
    Author     : Aakash
--%>

<%@page import="java.sql.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
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
                    <ul>
                        <li><a href=index.html>Home</a></li>
                        
                        <li> <a href="Login.html">Logout</a></li>
                        

                    </ul>
                </nav>
            </header>
            
        </div>
        
        
        
        
        <h2 style="font-style: italic;font-size:40px;">Flowerist List</h2><br>
        
        <form method="post" action="flowerist">

        <% 
            Class.forName("com.mysql.jdbc.Driver");
            Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/bookgate", "root", "root");
            Statement statement = connection.createStatement() ;
            ResultSet resultset = 
                statement.executeQuery("select * from flowerist") ; 
        %>

        <div align='center'>
             
        <TABLE >
            <thead>
            <TR>
                 <TH><font >ID</TH>
                 <TH><font >Name</TH>                 
                 <TH><font>Price</TH>
                 <TH><font > Mobile </TH>
                 <th>Description</th>
                 <th>  </th>

            </TR>
            </thead>
            <% while(resultset.next()){ %>
            <TR>
                <TD> <%= resultset.getInt(1) %></td>
                <TD> <%= resultset.getString(2) %></TD>
                <TD> <%= resultset.getInt(3) %></TD>
                <TD> <%= resultset.getString(4) %></TD>
                <TD> <%= resultset.getString(5) %></TD>
                <td><lable for='asd'><input type="radio" name="flower"  id="asd" value=<%= resultset.getString(1)%> /></lable> </td>
            
            </TR>
            <% } %>
        </TABLE>
        </div>
         
           <div style="text-align:center">
        <input type="submit" name="next" value="Add">
        </div>
        </form>
        <br/><br/><br/>
        
    </body>
</html>
