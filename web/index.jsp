<%
if(session.getAttribute("user") == null){
    response.sendRedirect("login.jsp");
}
%>
<html>
<head>
    <title>IPL Players</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>
    <div class="navbar">
    <h2>IPL Manager</h2>
    <div>
        <a href="view.jsp?page=1">View Players</a>
        <a href="logout.jsp">Logout</a>
    </div>
</div>

<h1>Add New Player</h1>

<form action="add.jsp" method="post">
<table>
<tr>
    <td>Name:</td>
    <td><input type="text" name="name" placeholder="Player Name" required></td>
</tr>

<tr>
<td>Role:</td>
<td>
<select name="role" required>
<option value="" disabled selected>Select Role</option>
<option value="Batsman">Batsman</option>
<option value="Bowler">Bowler</option>
<option value="All-rounder">All-rounder</option>
<option value="Wicketkeeper">Wicketkeeper</option>
</select>
</td>
</tr>

<tr>
<td>Country:</td>
<td>
<select name="country" required>
<option value="" disabled selected>Select Country</option>
<option value="India">India</option>
<option value="Australia">Australia</option>
<option value="England">England</option>
<option value="South Africa">South Africa</option>
</select>
</td>
</tr>

<tr>
<td>Team:</td>
<td>
<select name="team" required>
<option value="" disabled selected>Select Team</option>
<option value="CSK">CSK</option>
<option value="MI">MI</option>
<option value="RCB">RCB</option>
<option value="RR">RR</option>
<option value="KKR">KKR</option>
</select>
</td>
</tr>

<tr>
<td colspan="2"><input type="submit" value="Save"></td>
</tr>
</table>
</form>

<br>


</body>
</html>