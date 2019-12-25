
import java.io.*;
import java.sql.*;
import java.util.logging.*;
import javax.naming.*;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.sql.*;

public class QueryServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF‐8");
        PrintWriter out = response.getWriter();
        Connection conn = null;
        Statement stmt = null;
        try {
// Retrieve and process request parameters: "author" and "search"
            String date = request.getParameter("date");
            boolean hasAuthorParam = date != null && !date.equals("Select...");
            out.println(hasAuthorParam);
            out.println("<html><head><title>Query Results</title></head><body>");
            out.println("<h2>Booking gateway - Query Servlet</h2>");
            if (!hasAuthorParam) // No params present
            {
                out.println("<h3>Please select an author or enter a search term!</h3>");
                out.println("<p><a href='EntryServlet'>Back to Select Menu</a></p>");
            } else {
                out.println("fuck off");
                conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/bookgate", "root", "root");
                stmt = conn.createStatement();
// Form a SQL command based on the param(s) present

                StringBuilder sqlStr = new StringBuilder(); // more efficient than String
                sqlStr.append("SELECT * FROM content WHERE quantity > 0 AND (");

                sqlStr.append("cdate = '").append(date).append("'");

                sqlStr.append(") ORDER BY category, seller");

                ResultSet rset = stmt.executeQuery(sqlStr.toString());
                // for debugging
                if (!rset.next()) { // Check for empty ResultSet (no book found)
                    out.println("<h3>No book found. Please try again!</h3>");
                    out.println("<p><a href='EntryServlet'>Back to Select Menu</a></p>");
                } else {
// Print the result in an HTML form inside a table
                    out.println("<form method='get' action='CartServlet'>");
                    out.println("<input type='hidden' name='todo' value='add' />");
                    out.println("<table border='1' cellpadding='6'>");
                    out.println("<tr>");
                    out.println("<th>&nbsp;</th>");
                    out.println("<th>SELLER</th>");
                    out.println("<th>CATEGORY</th>");
                    out.println("<th>PRICE</th>");
                    out.println("<th>QTY</th>");
                    out.println("</tr>");
// ResultSet's cursor now pointing at first row
                    do {
// Print each row with a checkbox identified by book's id
                        String id = rset.getString("id");
                        out.println("<tr>");
                        out.println("<td><input type='checkbox' name='id' value='" + id + "' /></td>");
                        out.println("<td>" + rset.getString("seller") + "</td>");
                        out.println("<td>" + rset.getString("category") + "</td>");
                        out.println("<td>$" + rset.getString("price") + "</td>");
                        out.println("<td><input type='text' size='3' value='1' name='qty" + id + "' /></td>");
                        out.println("</tr>");
                    } while (rset.next());
                    out.println("</table><br />");
// Submit and reset buttons
                    out.println("<input type='submit' value='Add to My Shopping Cart' />");
                    out.println("<input type='reset' value='CLEAR' /></form>");
// Hyperlink to go back to search menu
                    out.println("<p><a href='EntryServlet'>Back to Select Menu</a></p>");
// Show "View Shopping Cart" if cart is not empty
                    HttpSession session = request.getSession(false); // check if session exists
                    if (session != null) {
                        Cart cart;
                        synchronized (session) {
// Retrieve the shopping cart for this session, if any. Otherwise, create one.
                            cart = (Cart) session.getAttribute("cart");
                            if (cart != null && !cart.isEmpty()) {
                                out.println("<p><a href='CartServlet?todo=view'>View Shopping Cart</a></p>");
                            }
                        }
                    }
                    out.println("</body></html>");
                }
            }
        } catch (SQLException ex) {
            out.println("<h3>Service not available. Please try again later!</h3></body></html>");
            Logger.getLogger(QueryServlet.class.getName()).log(Level.SEVERE, null, ex);
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
                Logger.getLogger(QueryServlet.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }

}
