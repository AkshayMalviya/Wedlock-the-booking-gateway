/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.*;
/**
 *
 * @author Ashish Panjwani
 */
public class Registrat2 extends HttpServlet
{
	public void doPost(HttpServletRequest request,HttpServletResponse response)
	throws ServletException,IOException
	{
	response.setContentType("text/html");
	PrintWriter out=response.getWriter();

        String s1=request.getParameter("id");
        String s2=request.getParameter("category");
        String s3=request.getParameter("seller");
        String s4=request.getParameter("price");
	String s5=request.getParameter("qty");
        String s6=request.getParameter("date");
	
	try
	{
		Class.forName("com.mysql.jdbc.Driver");
		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/bookgate","root","root");
		PreparedStatement ps=con.prepareStatement(
		"insert into content values(?,?,?,?,?,?)");
		
		ps.setString(1,s1);
		ps.setString(2,s2);
		ps.setString(3,s3);
		ps.setString(4,s4);		
                ps.setString(5,s5);	
                ps.setString(6,s6);
                		
	int i=ps.executeUpdate();
    if(i>0){
   response.sendRedirect("ConfirmPage2.html");
       
            }
     }catch(Exception e2)
       {
         System.out.println(e2);
       }	
	   out.close();
	   }
	   }