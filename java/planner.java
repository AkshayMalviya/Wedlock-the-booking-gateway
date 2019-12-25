/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Aakash
 */
public class planner extends HttpServlet {


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        HttpSession session = request.getSession();
        
        String id = request.getParameter("planner");
        

        
        try {
            
            int v=Integer.parseInt(id);
            Class.forName("com.mysql.jdbc.Driver");
            Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/bookgate", "root", "root");
            PreparedStatement statement = connection.prepareStatement("insert into cartitem select id,name,price,mobile,description from planner where id=?") ;
            statement.setInt(1, v);
            statement.executeUpdate(); 
            

        } catch (NumberFormatException e) {
            e.printStackTrace();
        } catch(Exception e){
            e.printStackTrace();
        }

        
        session.setAttribute("plannerid", id);
        
        RequestDispatcher view = request.getRequestDispatcher("photographer.jsp");
        view.forward(request, response);
        return;

        
    }

    
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
