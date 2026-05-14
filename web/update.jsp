<%@ include file="db.jsp" %>

<%
int id = Integer.parseInt(request.getParameter("id"));

PreparedStatement ps = con.prepareStatement(
"update players set name=?,role=?,country=?,team=? where id=?");

ps.setString(1,request.getParameter("name"));
ps.setString(2,request.getParameter("role"));
ps.setString(3,request.getParameter("country"));
ps.setString(4,request.getParameter("team"));
ps.setInt(5,id);

ps.executeUpdate();

response.sendRedirect("view.jsp?page=1");
%>