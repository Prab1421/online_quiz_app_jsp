<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>

<%!
    // Removed static variables for count1 and total, to avoid issues across requests
    int total = 0;
    int count1 = 0;
%>

<%
    if (session.getAttribute("count") != null) {
        String name = (String) session.getAttribute("subject");
        String ans = (String) session.getAttribute("ans");
        Integer count = (Integer) session.getAttribute("count");

        try {
            // Set count1 based on current count value
            if (count1 == 0) {
                count1 = count - 1;
            } else {
                count1 = count - 2;
            }

            // Database connection setup for MySQL
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/quiz_db", "quizuser", "1234");

            // Query to get the correct answer for the current question
            PreparedStatement ps = con.prepareStatement("SELECT answer FROM quizques WHERE quizname = ? AND qid = ?");
            ps.setString(1, name);
            ps.setInt(2, count1);

            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                String ans1 = rs.getString(1);

                // Compare the user's answer with the correct answer
                if (ans1.equals(ans)) {
                    total++;
                }
            }

            // Check if the current count exceeds the max question count
            if (count > (Integer) session.getAttribute("max")) {
                Integer max = (Integer) session.getAttribute("max");
                ps = con.prepareStatement("SELECT answer FROM quizques WHERE quizname = ? AND qid = ?");
                ps.setString(1, name);
                ps.setInt(2, max);

                rs = ps.executeQuery();
                if (rs.next()) {
                    String ans1 = rs.getString(1);
                    String ans2 = (String) session.getAttribute("ans");

                    if (ans1.equals(ans2)) {
                        total++;
                    }
                }
            }

            // Set the total score as a request attribute
            request.setAttribute("total", total);
            total = 0;  // Reset total for the next session

            con.close();

            // Forward to result page
            %>
            <jsp:forward page="result.jsp"></jsp:forward>
            <%
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
%>

<jsp:forward page="get.jsp"></jsp:forward>
