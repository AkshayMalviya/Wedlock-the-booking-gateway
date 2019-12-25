<%-- 
    Document   : venue
    Created on : Apr 25, 2017, 1:46:19 PM
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
        
        
        
        
        <h2 style="font-style: italic;font-size:40px;">Venue List</h2>
        
        
        
        
        <form method="post" action="Venue">

            <%
                Class.forName("com.mysql.jdbc.Driver");
                Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/bookgate", "root", "root");
                Statement statement = connection.createStatement();
                ResultSet resultset
                        = statement.executeQuery("select * from venue");
            %>

            <div align='center' font='lucida handwriting'>
               
                <TABLE>
                    <thead>
                    <TR>
                        <TH><font >ID</TH>
                        <TH><font >Name</TH>
                        <th> Area of Venue</th>
                        <th> Handling capacity</th>
                        <TH><font>Price(per day)</TH>
                        <TH><font > Mobile </TH>
                        <th>Description</th>
                        <th>  </th>

                    </TR>
                    </thead>
                    <% while (resultset.next()) {%>
                    <TR>
                        <TD> <%= resultset.getInt(1)%></td>
                        <TD> <%= resultset.getString(2)%></TD>
                        <TD> <%= resultset.getInt(3)%></TD>
                        <TD> <%= resultset.getInt(4)%></TD>
                        <TD> <%= resultset.getInt(5)%></TD>
                        <td> <%= resultset.getString(6)%> </td>
                        <td> <%= resultset.getString(7)%> </td>
                        <div class="radio">
                        <td><lable for='asd'><input type="radio" name="venue"  id="asd" value=<%= resultset.getString(1)%> /></lable> </td>
                    </div>


                    </TR>
                    <% }%>
                </TABLE>
            </div>
                
                <div style="text-align:center">
                <input type="submit" name="next" value="Add" style="margin:0 auto;"/>
                </div>
        </form>
        <br/><br/><br/>
        
    </body>
</html>
