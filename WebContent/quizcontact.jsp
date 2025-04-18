<%@ page language="java" import="java.util.*, java.sql.*" pageEncoding="ISO-8859-1"%>

<%
    // Initialize variables from form parameters
    String name = request.getParameter("name");
    String email = request.getParameter("email");
    String phone = request.getParameter("phone");
    String message = request.getParameter("message");

    // Database connection variables
    Connection con = null;
    PreparedStatement ps = null;

    try {
        // Load MySQL JDBC driver
        Class.forName("com.mysql.cj.jdbc.Driver");

        // Establish the connection to MySQL
        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/quiz_db", "quizuser", "1234");

        // Prepare the SQL INSERT query
        ps = con.prepareStatement("INSERT INTO quizcontact (name, email, phone, message) VALUES (?, ?, ?, ?)");

        // Set the values for the query parameters
        ps.setString(1, name);
        ps.setString(2, email);
        ps.setString(3, phone);
        ps.setString(4, message);

        // Execute the update and check the result
        int result = ps.executeUpdate();

        // Set a message attribute based on whether the insertion was successful
        if (result > 0) {
            request.setAttribute("success_msg", "Your message has been sent successfully!");
        } else {
            request.setAttribute("error_msg", "There was an issue sending your message. Please try again.");
        }

    } catch (Exception e) {
        // Handle any exceptions by setting an error message
        request.setAttribute("error_msg", "An error occurred: " + e.getMessage());
        e.printStackTrace();
    } finally {
        try {
            // Close the resources (PreparedStatement and Connection)
            if (ps != null) ps.close();
            if (con != null) con.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    // Forward the request to home.jsp
    request.getRequestDispatcher("home.jsp").forward(request, response);
%>
