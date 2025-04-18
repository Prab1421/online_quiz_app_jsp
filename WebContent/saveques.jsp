<%@ page language="java" import="java.util.*, java.sql.*" pageEncoding="ISO-8859-1"%>

<%! static int counter = 0; %>
<%
    counter++;  // Increment counter each time page loads
    
    try {
        // Load the MySQL JDBC driver
        Class.forName("com.mysql.cj.jdbc.Driver");
        
        // Establish the MySQL connection
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/quiz_db", "quizuser", "1234");

        // Get parameters from the form
        String question = request.getParameter("question");
        String option1 = request.getParameter("option1");
        String option2 = request.getParameter("option2");
        String option3 = request.getParameter("option3");
        String option4 = request.getParameter("option4");
        String answer = request.getParameter("answer");
        String description = request.getParameter("description");

        // Get the latest quiz name (assuming `quizinfo` table exists)
        PreparedStatement ps1 = con.prepareStatement("SELECT MAX(quizname) FROM quizinfo");
        ResultSet rs = ps1.executeQuery();

        while (rs.next()) {
            String quizname = rs.getString(1);  // Get the quiz name

            // Prepare SQL statement for inserting quiz question
            PreparedStatement ps = con.prepareStatement("INSERT INTO quizques (question, option1, option2, option3, option4, answer, quizname, description) VALUES (?, ?, ?, ?, ?, ?, ?, ?)");

            // Set the parameters for the SQL insert
            ps.setString(1, question);
            ps.setString(2, option1);
            ps.setString(3, option2);
            ps.setString(4, option3);
            ps.setString(5, option4);
            ps.setString(6, answer);
            ps.setString(7, quizname);
            ps.setString(8, description);

            // Execute the insert statement
            int s = ps.executeUpdate();

            // Check the result
            if (s > 0) {
                System.out.println("Question added successfully!");
            } else {
                System.out.println("Error adding question.");
            }
        }

        rs.close();  // Close ResultSet
        ps1.close(); // Close PreparedStatement

    } catch (Exception e) {
        e.printStackTrace();
    }
%>

<% 
    // Pass the updated counter to the next page
    request.setAttribute("counter", counter);
%>

<jsp:forward page="createquiz1.jsp"></jsp:forward>
