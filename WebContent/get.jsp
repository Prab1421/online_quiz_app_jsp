<%@ page import="java.sql.*, java.util.*" pageEncoding="ISO-8859-1"%>
<%
    String name = request.getParameter("subject");
    if (name == null || name.trim().isEmpty()) {
        name = (String) session.getAttribute("subject");
    }
    session.setAttribute("subject", name);

    Integer count = (Integer) session.getAttribute("count");
    Integer max = (Integer) session.getAttribute("max");
    Integer min = (Integer) session.getAttribute("min");
    Integer correctAnswerCount = (Integer) session.getAttribute("correctAnswerCount");

    if (count == null) count = 0;
    if (max == null) max = 0;
    if (min == null) min = 0;
    if (correctAnswerCount == null) correctAnswerCount = 0;

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/quiz_db", "quizuser", "1234");

        if (count == 0) {
            PreparedStatement ps1 = con.prepareStatement("SELECT MIN(qid) FROM quizques WHERE quizname = ?");
            PreparedStatement ps2 = con.prepareStatement("SELECT MAX(qid) FROM quizques WHERE quizname = ?");
            ps1.setString(1, name);
            ps2.setString(1, name);
            ResultSet rs1 = ps1.executeQuery();
            ResultSet rs2 = ps2.executeQuery();

            if (rs1.next()) min = rs1.getInt(1);
            if (rs2.next()) max = rs2.getInt(1);

            rs1.close();
            rs2.close();
            ps1.close();
            ps2.close();

            session.setAttribute("min", min);
            session.setAttribute("max", max);
            count = min;
        }

        // Handle submitted answer from previous question
        String submittedAnswer = request.getParameter("ans");
        if (submittedAnswer != null && count > min) {
            int prevQid = count - 1;

            PreparedStatement psAns = con.prepareStatement("SELECT answer FROM quizques WHERE quizname = ? AND qid = ?");
            psAns.setString(1, name);
            psAns.setInt(2, prevQid);
            ResultSet rsAns = psAns.executeQuery();

            if (rsAns.next()) {
                String correctAnswer = rsAns.getString("answer");
                if (correctAnswer.equalsIgnoreCase(submittedAnswer)) {
                    correctAnswerCount++;
                }
            }

            rsAns.close();
            psAns.close();
        }

        // Now check if quiz is done
        if (count > max) {
            session.setAttribute("total", correctAnswerCount);
            session.setAttribute("finished", "You have successfully completed the quiz.");
            session.setAttribute("count", 0); // optional: reset for next quiz
            session.setAttribute("correctAnswerCount", 0); // reset
            response.sendRedirect("result.jsp");
            return;
        }

        // Fetch next question
        PreparedStatement ps = con.prepareStatement("SELECT * FROM quizques WHERE quizname = ? AND qid = ?");
        ps.setString(1, name);
        ps.setInt(2, count);
        ResultSet rs = ps.executeQuery();

        if (rs.next()) {
            session.setAttribute("question", rs.getString("question"));
            session.setAttribute("option1", rs.getString("option1"));
            session.setAttribute("option2", rs.getString("option2"));
            session.setAttribute("option3", rs.getString("option3"));
            session.setAttribute("option4", rs.getString("option4"));
            session.setAttribute("qid", count); // optional: use in forms
        }

        rs.close();
        ps.close();

        count++;
        session.setAttribute("count", count);
        session.setAttribute("correctAnswerCount", correctAnswerCount);

        con.close();

        RequestDispatcher rd = request.getRequestDispatcher("start.jsp");
        rd.forward(request, response);

    } catch (Exception e) {
        e.printStackTrace();
        out.println("<font color='red'>Database error occurred!</font>");
    }
%>
