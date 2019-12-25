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
import javax.servlet.ServletContext;

/**
 *
 * @author Ashish Panjwani
 */
public class Registrat extends HttpServlet {

    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        

        try {
            
            String s1 = request.getParameter("fn");
            String s2 = request.getParameter("ln");
            String s3 = request.getParameter("un");
            String s4 = request.getParameter("pass");
            String s5 = request.getParameter("email");
            String s6 = request.getParameter("mob");
            ServletContext context=getServletContext();
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/bookgate", "root", "root");
            PreparedStatement ps = con.prepareStatement("insert into bg values(?,?,?,?,?,?)");

            ps.setString(1, s1);
            ps.setString(2, s2);
            ps.setString(3, s3);
            ps.setString(4, s4);
            ps.setString(5, s5);
            ps.setString(6, s6);

            int i = ps.executeUpdate();
            if (i > 0) {

                response.sendRedirect("ConfirmPage.html");

            }
        } catch (Exception e2) {
            out.println(e2);
        }
        out.close();
    }
}
