import java.io.*;
import java.sql.*;
import java.util.logging.*;
import javax.naming.*;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.sql.DataSource;

public class EntryServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF‐8");
        PrintWriter out = response.getWriter();
        Connection conn = null;
        Statement stmt = null;
        try {
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/bookgate", "root", "root"); // Get a connection from the pool
            stmt = conn.createStatement();
            String sqlStr = "SELECT DISTINCT cdate FROM content WHERE quantity > 0";
            ResultSet rset = stmt.executeQuery(sqlStr);
            out.println("<html><head><title>Welcome to E-shop</title> ");
           // out.println("<img src=\"pg.jpg\" height=\"115px\" width=\"100%\" /> </head><body>");
            out.println("<h2>Welcome to Booking Gateway </h2>");
            out.println("<form method='get' action='QueryServlet'>");
            // A pull‐down menu of all the authors with a no‐selection option
            out.println("Choose a date: <select name='date' size='1'>");
            out.println("<option value=''>Select...</option>"); // no‐selection
            while (rset.next()) { // list all the authors
                String date = rset.getString("cdate");
                out.println("<option value='" + date + "'>" + date + "</option>");
            }
            out.println("</select><br />");

            out.println("<input type='submit' value='SEARCH' />");
            out.println("<input type='reset' value='CLEAR' />");
            out.println("</form>");
// Show "View Shopping Cart" if the cart is not empty
            HttpSession session = request.getSession(false); // check if session exists
            if (session != null) {
                Cart cart;
                synchronized (session) {
// Retrieve the shopping cart for this session, if any. Otherwise, create one.
                    cart = (Cart) session.getAttribute("cart");
                    if (cart != null && !cart.isEmpty()) {
                        out.println("<P><a href='CartServlet?todo=view'>View Shopping Cart</a></p>");
                    }
                }
            }
            out.println("</body></html>");
        } catch (SQLException ex) {
            out.println("<h3>Service not available. Please try again later!</h3></body></html>");
            Logger.getLogger(EntryServlet.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            out.close();
            try {
                if (stmt != null) {
                    stmt.close();
                }
                if (conn != null) {
                    conn.close(); // Return the connection to the pool
                }
            } catch (SQLException ex) {
                Logger.getLogger(EntryServlet.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}
