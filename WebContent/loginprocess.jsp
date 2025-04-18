<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>

<%
String username = request.getParameter("username");
String userpass = request.getParameter("userpass");
String category = request.getParameter("category");

boolean status = false;

try {
    // Load MySQL JDBC Driver
    Class.forName("com.mysql.cj.jdbc.Driver");

    // Establish Connection (update db_name, username, and password as needed)
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/quiz_db", "quizuser", "1234");

    // Prepare SQL statement
    PreparedStatement ps = con.prepareStatement("SELECT * FROM QUIZREGISTER WHERE username = ? AND userpass = ?");
    ps.setString(1, username);
    ps.setString(2, userpass);

    ResultSet rs = ps.executeQuery();
    status = rs.next();

    if (status) {
        // Set session attributes
        session.setAttribute("username", rs.getString("username")); 
        session.setAttribute("islogin", "true");
        session.setAttribute("category", category);

        // Redirect to home page
        response.sendRedirect("home.jsp");
    } else {
        // Set error message and forward back to login
        request.setAttribute("Error", "Sorry! Username or Password is incorrect. Please try again or register.");
        session.setAttribute("Loginmsg", "Please sign in first.");
        RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
        rd.forward(request, response);
    }

    // Close resources
    rs.close();
    ps.close();
    con.close();

} catch (Exception e) {
    e.printStackTrace();
    out.println("<p style='color:red;'>An error occurred while processing your request. Please try again later.</p>");
}
%>
