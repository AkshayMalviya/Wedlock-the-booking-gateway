<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Menu</title>
        <meta charset="utf-8">


        <style>
            form{
                font-family: helvetica;
                font-size: 16px;
                margin:100px 50px 50px 50px;

            }
            option{
                padding:10px;
                border:0px;

            }

            input{
                padding:10px;
                border:0px;
            }
            input[type="submit"]
            {
                background:red;
                color:white;
                font-size: 15px;
            }
            a{
                color:red;
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
                font-size:70px;
                font-family: "harrington",monaco, fantasy;
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
                text-align: center;
            }







        </style>
    </head>
    <body>
        <div class="sub-pages">
            <header>
                <img src="user.png" style="width:20px;height:20px;">
                <h1>WedLock</h1>

                <nav>
                    <ul class="menu">


                        <li><a href='index.html'>Home</a></li>
                        <li class="current"><a href='Regisretailer.jsp'>Register Retailer</a></li>
                        <li><a href='AllRecords.jsp'>Records</a></li>
                        <li><a href='index.html'>logout</a></li>

                    </ul>
                </nav>  
            </header>
        </div>
        <!--==============================content================================-->
        <% 
            String a = "ashwins"; 
            
           
            if(request.getParameter("usertype") == null){
        %>
        <form method="post" action="Regisretailer.jsp">
            <b>Select User type</b> <select id="country" name="usertype">
                <option value="venue">venue</option>
                <option value="caterers">caterer</option>
                <option value="flower">flowerist</option>
                <option value="planner">planner</option>
                <option value="photo">photographer</option>
               
            </select>
            <br></br>
            <input type="submit" value="SELECT"/>

        </form>
        <%
            
            
            }
            else if(request.getParameter("usertype").equals("venue"))
            {
        %>
        <form method="post" action="Registrat1">
            <b>Venue's Name</b> <input type="text" id="" name="name" placeholder=" Venue's name" required><br></br>
            <b>Venue's Area</b> <input type="number" id="" name="area" placeholder="Venue's Area" required><br></br>
            <b>Venue's Capacity</b> <input type="number" id="" name="capacity" placeholder="capacity" required><br></br>
            <b>Price(per day)</b> <input type="number" id="" name="price" placeholder="Price" required ><br/><br/>
            <b>Mobile Number</b> <input type="tel" id="" name="mobile" placeholder="Contact Number" required ><br/><br/>
            <b>Extra Information</b> <input type="text" id="" name="decription" placeholder="Description" required >
            <br></br>
            
            <input type="submit" value="Enter data"/>
        </form><br> <br>
        <%
            session.setAttribute("usertype", "venue");
            }
            else if(request.getParameter("usertype").equals("caterers"))
            {
        %>
        <form method="post" action="Registrat1">
            <b>Caterer Name</b> <input type="text" id="" name="name" placeholder="Caterer name" required><br></br>
            <b>Price</b> <input type="number" id="" name="price" placeholder="Price" required ><br/><br/>
            <b>Mobile Number</b> <input type="tel" id="" name="mobile" placeholder="Contact Number" required ><br/><br/>
            <b>Extra Information</b> <input type="text" id="" name="decription" placeholder="Description" required >
            <br></br>
            
            <input type="submit" value="Enter data"/>
        </form><br> <br>
        <%
            session.setAttribute("usertype", "caterer");
            }
            else if(request.getParameter("usertype").equals("flower"))
            {
        %>
        <form method="post" action="Registrat1">
            <b>Florist Name</b> <input type="text" id="" name="name" placeholder="Florist name" required><br></br>
            <b>Price</b> <input type="number" id="" name="price" placeholder="Price" required ><br/><br/>
            <b>Mobile Number</b> <input type="tel" id="" name="mobile" placeholder="Contact Number" required ><br/><br/>
            <b>Extra Information</b> <input type="text" id="" name="decription" placeholder="Description" required >
            <br></br>
            
            <input type="submit" value="Enter data"/>
        </form><br> <br>
        <%
            session.setAttribute("usertype", "flowerist");
            }
            else if(request.getParameter("usertype").equals("planner"))
            {
        %>
        <form method="post" action="Registrat1">
            <b>Planner Name</b> <input type="text" id="" name="name" placeholder="Caterer name" required><br></br>
            <b>Price</b> <input type="number" id="" name="price" placeholder="Price" required ><br/><br/>
            <b>Mobile Number</b> <input type="tel" id="" name="mobile" placeholder="Contact Number" required ><br/><br/>
            <b>Address</b> <input type="text" id="" name="address" placeholder="Address" required ><br/><br/>
            <b>Extra Information</b> <input type="text" id="" name="decription" placeholder="Description" required >
            <br></br>
            
            <input type="submit" value="Enter data"/>
        </form><br> <br>
        <%
            session.setAttribute("usertype", "planner");
            }
            else if(request.getParameter("usertype").equals("photo"))
            {
        %>
        <form method="post" action="Registrat1">
            <b>Photographer Name</b> <input type="text" id="" name="name" placeholder="Caterer name" required><br></br>
            <b>Studio Name</b> <input type="text" id="" name="studioname" placeholder="Studio Name" required ><br/><br/>
            <b>Price</b> <input type="number" id="" name="price" placeholder="Price" required ><br/><br/>
            <b>Mobile Number</b> <input type="tel" id="" name="mobile" placeholder="Contact Number" required ><br/><br/>
            
            <b>Extra Information</b> <input type="text" id="" name="decription" placeholder="Description" required >
            <br></br>
            
            <input type="submit" value="Enter data"/>
        </form><br> <br>
        <%
            session.setAttribute("usertype", "photo");
            }
        %>
        <br>
        <p align="center"><font size="5px">Go to <a href="Login.html">Login Page</font></a></p>

    </body>
</html>
