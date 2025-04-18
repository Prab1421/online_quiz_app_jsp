<%@ page language="java" import="java.util.*, java.sql.*" pageEncoding="ISO-8859-1"%>
<% 
    try {
        // Retrieving parameters from the form
        String username = request.getParameter("username");
        String userpass = request.getParameter("userpass");
        String category = request.getParameter("category");
        String email = request.getParameter("email");

        // Load MySQL JDBC driver
        Class.forName("com.mysql.cj.jdbc.Driver");

        // Establish connection to the MySQL database
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/quiz_db", "quizuser", "1234");

        // Prepare SQL query for inserting data
        PreparedStatement ps = con.prepareStatement("INSERT INTO quizregister (username, userpass, category, email) VALUES (?, ?, ?, ?)");

        // Set values for the query
        ps.setString(1, username);
        ps.setString(2, userpass);
        ps.setString(3, category);
        ps.setString(4, email);

        // Execute the update
        int s = ps.executeUpdate();

        // Check for successful insertion
        if (s > 0) {
            System.out.println("Registration successful!");
        } else {
            System.out.println("Registration failed!");
        }

    } catch (SQLException e2) {
        e2.printStackTrace();
    } catch (ClassNotFoundException e1) {
        e1.printStackTrace();
    }
%>

<jsp:forward page="index.jsp"></jsp:forward>
