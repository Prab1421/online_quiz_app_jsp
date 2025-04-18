<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>

<%! static int count = 0; %>
<%! static int count1 = 0; %>

<%
String name = (String) session.getAttribute("quizname");

if (name != null) {
    try {
        Class.forName("oracle.jdbc.driver.OracleDriver");
        Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:ORCL", "KINSHUK", "MANTU");

        // Retrieve the min and max QID for the quiz only once
        if (count == 0) {
            PreparedStatement ps1 = con.prepareStatement("SELECT MIN(qid) FROM quizques WHERE quizname = ?");
            PreparedStatement ps2 = con.prepareStatement("SELECT MAX(qid) FROM quizques WHERE quizname = ?");
            ps1.setString(1, name);
            ps2.setString(1, name);

            ResultSet rs1 = ps1.executeQuery();
            ResultSet rs2 = ps2.executeQuery();

            // Set session attributes for min and max QID
            if (rs2.next()) {
                count1 = rs2.getInt(1);
                session.setAttribute("max", count1);
            }
            if (rs1.next()) {
                count = rs1.getInt(1);
                session.setAttribute("min", count);
            }
        }

        // Get the current question and its options
        if (count > 0) {
            PreparedStatement ps = con.prepareStatement("SELECT * FROM quizques WHERE quizname = ? AND qid = ?");
            ps.setString(1, name);
            ps.setInt(2, count);
            ResultSet rs = ps.executeQuery();

            // Store question and options in session attributes
            if (rs.next()) {
                String question = rs.getString("question");
                String option1 = rs.getString("option1");
                String option2 = rs.getString("option2");
                String option3 = rs.getString("option3");
                String option4 = rs.getString("option4");

                session.setAttribute("question", question);
                session.setAttribute("option1", option1);
                session.setAttribute("option2", option2);
                session.setAttribute("option3", option3);
                session.setAttribute("option4", option4);
            }
        }

        // Update question count
        count++;
        session.setAttribute("count", count);

        // If count exceeds max, reset count and answer
        if (count > (Integer) session.getAttribute("max")) {
            count = 0;
            session.setAttribute("ans", null); // Reset answer
        }

        con.close();
    } catch (Exception e) {
        e.printStackTrace();
    }
}

// Correct placement of jsp:forward tag
%>
<jsp:forward page="start.jsp" />
