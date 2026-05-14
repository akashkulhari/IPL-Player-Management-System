<%@ page import="java.sql.*" %>
<%@ include file="db.jsp" %>

<%
if(session.getAttribute("user") == null){
    response.sendRedirect("login.jsp");
}

int id = Integer.parseInt(request.getParameter("id"));

PreparedStatement ps = con.prepareStatement("select * from players where id=?");
ps.setInt(1,id);
ResultSet rs = ps.executeQuery();
rs.next();
%>

<html>
<head>
    <title>Edit Player</title>
    <link rel="stylesheet" href="style.css">
</head>

<body>

<div class="navbar">
    <h2>IPL Manager</h2>
    <div>
        <a href="index.jsp">Add Player</a>
        <a href="view.jsp?page=1">View Players</a>
        <a href="logout.jsp">Logout</a>
    </div>
</div>

<div class="container">

<h1>Edit Player</h1>

<form action="update.jsp" method="post">

<input type="hidden" name="id" value="<%=rs.getInt(1)%>">

<label>Name:</label>
<input type="text" name="name" value="<%=rs.getString(2)%>" required>

<!-- ? Role Dropdown -->
<label>Role:</label>
<select name="role" required>
    <option <%=rs.getString(3).equals("Batsman")?"selected":""%>>Batsman</option>
    <option <%=rs.getString(3).equals("Bowler")?"selected":""%>>Bowler</option>
    <option <%=rs.getString(3).equals("All-rounder")?"selected":""%>>All-rounder</option>
    <option <%=rs.getString(3).equals("Wicketkeeper")?"selected":""%>>Wicketkeeper</option>
</select>

<!-- ? Country Dropdown -->
<label>Country:</label>
<select name="country" required>
    <option <%=rs.getString(4).equals("India")?"selected":""%>>India</option>
    <option <%=rs.getString(4).equals("Australia")?"selected":""%>>Australia</option>
    <option <%=rs.getString(4).equals("England")?"selected":""%>>England</option>
    <option <%=rs.getString(4).equals("South Africa")?"selected":""%>>South Africa</option>
    <option <%=rs.getString(4).equals("Other")?"selected":""%>>Other</option>
</select>

<!-- ? Team Dropdown -->
<label>Team:</label>
<select name="team" required>
    <option <%=rs.getString(5).equals("CSK")?"selected":""%>>CSK</option>
    <option <%=rs.getString(5).equals("MI")?"selected":""%>>MI</option>
    <option <%=rs.getString(5).equals("RCB")?"selected":""%>>RCB</option>
    <option <%=rs.getString(5).equals("RR")?"selected":""%>>RR</option>
    <option <%=rs.getString(5).equals("KKR")?"selected":""%>>KKR</option>
    <option <%=rs.getString(5).equals("LSG")?"selected":""%>>LSG</option>
    <option <%=rs.getString(5).equals("PBKS")?"selected":""%>>PBKS</option>
    <option <%=rs.getString(5).equals("GT")?"selected":""%>>GT</option>
    <option <%=rs.getString(5).equals("DC")?"selected":""%>>DC</option>
    <option <%=rs.getString(5).equals("SRH")?"selected":""%>>SRH</option>
</select>

<input type="submit" value="Update Player">

</form>

</div>

</body>
</html>