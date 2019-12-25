// Loading required libraries
import java.io.*;
import java.util.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;
 import javax.servlet.http.HttpSession;

public class Bouquet1 extends HttpServlet{
    
  public void doGet(HttpServletRequest request,
                    HttpServletResponse response)
            throws ServletException, IOException
  {
     
            
      
      // Set response content type
      response.setContentType("text/html");
      PrintWriter out = response.getWriter();
      
      try{
         
          
            HttpSession session = request.getSession(true);
            String email="",name="";
            if(session.getAttribute("email")!=null && session.getAttribute("name")!=null ){
            email=session.getAttribute("email").toString();//Setting the session data to variable for reuse 
            name=session.getAttribute("name").toString();
          String title = "Database Result";
      String docType =
        "<!doctype html public \"-//w3c//dtd html 4.0 " +
         "transitional//en\">\n";
         out.println(docType +
         "<html>\n" +
         "<head><title>" + title + "</title></head>\n" +
         "<body bgcolor=\"#f0f0f0\">\n" +
         "<h1 align=\"center\">" + title + "</h1>\n");      
            
         // Register JDBC driver
         Class.forName("com.mysql.jdbc.Driver");
         
         // Open a connection
         Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/bookgate" ,"root","root");
         
            
            
         // Execute SQL query
         Statement stmt = conn.createStatement();
         String sql;
         sql = "SELECT ID,NAME,CONTACT_NO,EMAIL, ADDRESS,descrip FROM bonquet";
         ResultSet rs = stmt.executeQuery(sql);
 
         // Extract data from result set
         while(rs.next()){
            //Retrieve by column name
            int id = rs.getInt("ID");
            String Name = rs.getString("NAME");
            int Contact = rs.getInt("CONTACT_NO");
            String Email = rs.getString("EMAIL");
            String Add = rs.getString("ADDRESS");
            String descrip = rs.getString("descrip");

            //Display values
            out.println("ID: " + id + "<br>");
            out.println("NAME: " + Name + "<br>");
            out.println(", CONTACT_NO: " + Contact + "<br>");
            out.println(", EMAIL: " +Email + "<br>");
            out.println(", ADDRESS: " + Add + "<br>");
            out.println(", descrip: " + descrip + "<br>");
         }
         
         out.println("</body></html>");
     
         // Clean-up environment
         rs.close();
         stmt.close();
         conn.close();
      }}
            catch(SQLException se){
         //Handle errors for JDBC
         se.printStackTrace();
      }catch(Exception e){
         //Handle errors for Class.forName
         e.printStackTrace();
      }/*finally{
         //finally block used to close resources
         try{
            if(stmt!=null)
               stmt.close();
         }catch(SQLException se2){
         }// nothing we can do
         try{
            if(conn!=null)
            conn.close();
         }catch(SQLException se){
            se.printStackTrace();
         }//end finally try
      } //end try*/
   }
} 