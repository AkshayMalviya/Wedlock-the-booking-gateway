<%@page import="java.sql.*"%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Photographer List</title> 
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
                background-color: #1a1a00;
                color: white;

            }
            header
            {
                margin-top: 0;
                text-align:center;
                background:url('wood2.jpg');
                background-size: cover;
                color:white;
                border-radius:20px;

            }
            a{
                color:white;
                text-decoration:none;
            }
            h1{
                font-family: "harrington",monaco, fantasy;
                font-size:50px;
                text-align: center;
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
                background-color:   #b3b3ff;
                font-family: "lucida handwriting",monaco,fantasy;
            }

            input{
                display: inline-block;
                padding:10px;
                border:0px;
                margin: 0 auto;
                border: 1px solid #ccc;
                 border-radius: 4px;
                box-sizing: border-box;
            }
            input[type="submit"]
            {
                background-color: whitesmoke;
                color:navy;
                font-size: 15px;
                margin: 0 auto; 
                border: 1px solid #ccc;
                 border-radius: 4px;
                box-sizing: border-box;
            }           
            ash{
                font-family: "harrington",monaco, fantasy;
                font-size:40px;
                text-align: center;
            }




        </style>
    </head>
    <body>
        <div class="sub-pages">
            <header>
                <nav>
                    <img src="user.png" style="width:20px;height:20px;"/>
                    <h1>WedLock</h1>


                    <ul class="menu">
                        <li><a href=index.html>Home</a></li>
                        <li><a href=index.html>Log Out</a></li>

                    </ul>
                </nav>
            </header>
        </div>
        <h2 style="font-style: italic;font-size:40px;">Your Cart</h2>
       
        
        <form method="post" action="Final">

            <%
                Class.forName("com.mysql.jdbc.Driver");
                Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/bookgate", "root", "root");
                Statement statement = connection.createStatement();
                ResultSet resultset = statement.executeQuery("select * from cartitem");
                int total = 0;
                
            %>

            <div align='center'>
                <TABLE >
                    <TR>
                        <TH><font >ID</TH>
                        <TH><font >Name</TH>
                        <TH><font >Price</TH>

                        <TH><font > Mobile </TH>
                        <th>Description</th>
                        <th></th>
                    </TR>
                    <% while (resultset.next()) {%>
                    <TR>
                        <TD> <%= resultset.getInt(1)%></td>
                        <TD> <%= resultset.getString(2)%></TD>

                        <TD> <%= resultset.getInt(3)%></TD>
                            <% total += resultset.getInt(3);%>
                        <TD> <%= resultset.getString(4)%></TD>
                        <td> <%= resultset.getString(5)%></td>
                        <td><lable for='asd'><input type="checkbox" name="delete"  value=<%= resultset.getString(1)%> /></lable> </td>

                    </TR>
                    <% }%>
                </TABLE>
            </div>

            <br>
            <div style="text-align:right; margin-right: 130px" >
            <ash>Total=<%= total%></ash>
            </div>
            
            <div style="text-align:center">
                <input type="submit" name="Remove" value="Remove"><br/><br/>
                
            </div>
        </form>
            
        <form method="POST" action="Final">
            
            <div style="text-align: center">
            Name  <input type="text" name="name" placeholder="Username" required ></br>
            Email  <input type="email" name="email" placeholder="Email ID" required></br>
            Phone  <input type="tel" name="mobile" placeholder="01234-56789" required><br/><br/>
            <input type="submit" name="checkout" value="checkout"><br/>
            </div>
            
        </form>
        
    </body>
</html>
