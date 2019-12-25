<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Menu</title>
        <meta charset="utf-8">

        <style>
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
                font-family: "harrington",monaco, fantasy;

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


                        <li class="current"><a href='#'>Records</a></li>
                        <li><a href='Allusers.jsp'>Users</a></li>
                        <li><a href='AllContent.jsp'>Services</a></li>
                        <li><a href='AllRetailers.jsp'>Retailers</a></li>
                        <li><a href='allOrders.jsp'>Orders</a></li>
                        <li><a href="Login.html">Logout</a></li>

                    </ul>
                </nav>
            </header>
        </div>
        <br></br><br></br>
        <div style="font-style: italic;font-size: 40px";>  
            <b >This is the Home page for seeing all the records</b>
            <div>