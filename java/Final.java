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
public class Final extends HttpServlet {

    
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String[] checkbox = request.getParameterValues("delete");
        boolean value = false;
        
        HttpSession session =request.getSession();
        if(checkbox != null){
        try {
            
            Class.forName("com.mysql.jdbc.Driver");
            Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/bookgate", "root", "root");
            for(int i =0; i<checkbox.length;i++){           
                
                System.out.print(checkbox[i]);
                if(checkbox[i] == null)
                    continue;
                else{
                    PreparedStatement statement = connection.prepareStatement("delete from cartitem where id =?") ;
                    int v = Integer.parseInt(checkbox[i]);
                    statement.setInt(1, v);
                    statement.executeUpdate();
                    value=true;
                }
                     
            }
            if(value){
            RequestDispatcher view = request.getRequestDispatcher("checkout.jsp");
            view.forward(request, response);
            return;
        }
            

        } catch (NumberFormatException e) {
            
            e.printStackTrace();
        } catch(Exception e){
            e.printStackTrace();
        }
        }/*else{
            RequestDispatcher view = request.getRequestDispatcher("checkout.jsp");
            view.forward(request, response);
            return;
        }*/
        
        
        String submit = request.getParameter("checkout");
        if(submit.equals("checkout")){
            try{
                Class.forName("com.mysql.jdbc.Driver");
                Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/bookgate", "root", "root");
                PreparedStatement smt = connection.prepareStatement("insert into orderrecord values(?,?,?,?,?,?,?,?)") ;
                smt.setString(1, request.getParameter("name"));
                smt.setString(2, request.getParameter("email")); 
                smt.setString(3, request.getParameter("mobile"));
                smt.setInt(4, Integer.parseInt((String)session.getAttribute("venueid")));
                smt.setInt(5, Integer.parseInt((String)session.getAttribute("catererid")));
                smt.setInt(6, Integer.parseInt((String)session.getAttribute("floweristid")));
                smt.setInt(7, Integer.parseInt((String)session.getAttribute("plannerid")));
                smt.setInt(8, Integer.parseInt((String)session.getAttribute("photoid")));
                
                smt.executeUpdate();
                
                PreparedStatement smt1 = connection.prepareStatement("delete from cartitem");
                smt1.executeUpdate();
                
                
                RequestDispatcher view = request.getRequestDispatcher("payment.jsp");
                view.forward(request, response);
                return;
                
                
                
            }catch(Exception e){
                e.printStackTrace();
                
            }
        }
        
        
        
    }

    
  
}
