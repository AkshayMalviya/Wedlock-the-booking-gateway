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
import javax.servlet.http.HttpSession;

/**
 *
 * @author Ashish Panjwani
 */
public class Registrat1 extends HttpServlet {

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        HttpSession session = request.getSession();

        try {
            int i=0;
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/bookgate", "root", "root");
            if (session.getAttribute("usertype").equals("venue")) {

                String name = request.getParameter("name");
                int area = Integer.parseInt(request.getParameter("area"));
                int capacity = Integer.parseInt(request.getParameter("capacity"));
                int price = Integer.parseInt(request.getParameter("price"));
                String mobile = request.getParameter("mobile");
                String description = request.getParameter("description");

                PreparedStatement ps = con.prepareStatement("insert into retail values(?,?,?,?,?)");

                ps.setString(1, name);
                ps.setInt(2, area);
                ps.setInt(3, capacity);
                ps.setInt(4, price);
                ps.setString(5, mobile);
                ps.setString(5, description);
                 i = ps.executeUpdate();

            } else if (session.getAttribute("usertype").equals("caterer")) {

                String name = request.getParameter("name");
                int price = Integer.parseInt(request.getParameter("price"));
                String mobile = request.getParameter("mobile");
                String description = request.getParameter("description");
                PreparedStatement ps = con.prepareStatement("insert into retail values(?,?,?,?,?)");

                ps.setString(1, name);
                ps.setInt(2, price);
                ps.setString(3, mobile);
                ps.setString(4, description);
                 i = ps.executeUpdate();
                

            } else if (session.getAttribute("usertype").equals("flowerist")) {

                String name = request.getParameter("name");
                int price = Integer.parseInt(request.getParameter("price"));
                String mobile = request.getParameter("mobile");
                String description = request.getParameter("description");
                PreparedStatement ps = con.prepareStatement("insert into retail values(?,?,?,?,?)");

                ps.setString(1, name);
                ps.setInt(2, price);
                ps.setString(3, mobile);
                ps.setString(4, description);
                i = ps.executeUpdate();

            } else if (session.getAttribute("usertype").equals("planner")) {

                String name = request.getParameter("name");
                int price = Integer.parseInt(request.getParameter("price"));
                String mobile = request.getParameter("mobile");
                String address = request.getParameter("address");
                String description = request.getParameter("description");
                PreparedStatement ps = con.prepareStatement("insert into retail values(?,?,?,?,?)");

                ps.setString(1, name);
                ps.setInt(2, price);
                ps.setString(3, mobile);
                ps.setString(4, address);
                ps.setString(5, description);
                 i = ps.executeUpdate();

            } else if (session.getAttribute("usertype").equals("photo")) {

                String name = request.getParameter("name");
                String studioname = request.getParameter("studioname");
                int price = Integer.parseInt(request.getParameter("price"));
                String mobile = request.getParameter("mobile");
                String description = request.getParameter("description");
                PreparedStatement ps = con.prepareStatement("insert into retail values(?,?,?,?,?)");

                ps.setString(1, name);
                ps.setString(2, studioname);
                ps.setInt(3, price);
                ps.setString(4, mobile);
                ps.setString(5, description);
                i = ps.executeUpdate();

            }

            
            if (i > 0) {
                response.sendRedirect("ConfirmPage1.html");

            }
        } catch (Exception e2) {
            System.out.println(e2);
        }
        out.close();
    }
}
