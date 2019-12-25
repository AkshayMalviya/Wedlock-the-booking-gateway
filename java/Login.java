
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;

public class Login extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        String n = request.getParameter("username");
        String p = request.getParameter("userpass");
        String u = request.getParameter("usertype");
        if (u.equals("admin")) {
            if ((n.equals("admin")) && (p.equals("admin"))) {
                HttpSession session = request.getSession(true); // The session will be set only if there is a valid login 
                session.setAttribute("name", n);
                RequestDispatcher rd = request.getRequestDispatcher("adminmain.html");
                rd.forward(request, response);
                // out.println("Welcome Admin");
            } else {
                out.print("Invalid Admin Name or password");
            }
        } else if (u.equals("customer")) {
            String email = "";
            email = LoginCheck.validate(n, p);

            if (email.trim() != "" && email.length() > 0) {
                HttpSession session = request.getSession(true); // The session will be set only if there is a valid login 
                session.setAttribute("name", n);
                session.setAttribute("email", email);
                //   response.sendRedirect("ConfirmPage.html");
                RequestDispatcher rd = request.getRequestDispatcher("venue.jsp");
                rd.forward(request, response);
                //out.println("hello");
            } else {
                out.print("<p style=\"color:red\">Sorry username or password error</p>");
                RequestDispatcher rd = request.getRequestDispatcher("registration.html");
                rd.include(request, response);
            }
        } else if (u.equals("retailer")) {
            String category = "";
            category = LoginCheck1.validate(n, p);

            if (category.trim() != "" && category.length() > 0) {
                HttpSession session1 = request.getSession(true); // The session will be set only if there is a valid login 
                session1.setAttribute("name", n);
                session1.setAttribute("category", category);
                RequestDispatcher rd = request.getRequestDispatcher("retailermain.jsp");
                rd.forward(request, response);
                //out.println("hello");
            } else {
                out.print("<p style=\"color:red\">Sorry username or password error</p>");
                RequestDispatcher rd = request.getRequestDispatcher("registration.html");
                rd.include(request, response);
            }
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
