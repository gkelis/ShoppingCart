<%-- 
    Document   : index
    Created on : Dec 9, 2011, 8:13:36 PM
    Author     : FoG
--%>

<%@page language="java" %>
<%@page import="java.util.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<% 
    if ((request.getParameter("cafe_quantity") != null) && (request.getParameter("sugar_quantity") != null) && (request.getParameter("water_quantity") != null)) {
    String cafe_quantity = request.getParameter("cafe_quantity").trim();
    String sugar_quantity = request.getParameter("sugar_quantity").trim();
    String water_quantity = request.getParameter("water_quantity").trim();
        if(cafe_quantity==null) cafe_quantity="";
        if(sugar_quantity==null) sugar_quantity="";
        if(water_quantity==null) water_quantity="";
    
     Cookie cafe_cookie = new Cookie ("cafe_quantity",cafe_quantity);
     Cookie sugar_cookie = new Cookie ("sugar_quantity",sugar_quantity);
     Cookie water_cookie = new Cookie ("water_quantity",water_quantity);
     cafe_cookie.setMaxAge(365 * 24 * 60 * 60);
     sugar_cookie.setMaxAge(365 * 24 * 60 * 60);
     water_cookie.setMaxAge(365 * 24 * 60 * 60);
     response.addCookie(cafe_cookie);
     response.addCookie(sugar_cookie);
     response.addCookie(water_cookie);
     }
%>

<%   String cookieCafe = "cafe_quantity";
     String cookieSugar = "sugar_quantity";
     String cookieWater = "water_quantity";
     Cookie cookies [] = request.getCookies ();
     Cookie myCafeCookie = null;
     Cookie mySugarCookie = null;
     Cookie myWaterCookie = null;
     if (cookies != null)
     {
     for (int i = 0; i < cookies.length; i++) 
     {
     if (cookies [i].getName().equals (cookieCafe))
     {
     myCafeCookie = cookies[i];
     //break;
     }
     if (cookies [i].getName().equals (cookieSugar))
     {
     mySugarCookie = cookies[i];
     //break;
     }
     if (cookies [i].getName().equals (cookieWater))
     {
     myWaterCookie = cookies[i];
     //break;
     }
     }
     }
%>
 
 <%
    if ((request.getParameter("cafe_quantity") != null) && (request.getParameter("sugar_quantity") != null) && (request.getParameter("water_quantity") != null)) {
        session.setAttribute("cafe_quantity", request.getParameter("cafe_quantity").trim());
        session.setAttribute("sugar_quantity", request.getParameter("sugar_quantity").trim());
        session.setAttribute("water_quantity", request.getParameter("water_quantity").trim());}
       else if ((session.getAttribute("cafe_quantity") == null) && (session.getAttribute("sugar_quantity") == null) && (session.getAttribute("water_quantity") == null)) {
        if ((myCafeCookie != null) && (mySugarCookie != null) && (myWaterCookie != null)) {
                session.setAttribute("cafe_quantity", myCafeCookie.getValue().trim());
                session.setAttribute("sugar_quantity", mySugarCookie.getValue().trim());
                session.setAttribute("water_quantity", myWaterCookie.getValue().trim());
         }
       }
%>
        
<html>
  <head>
  <meta http-equiv="content-type" content="text/html;charset=utf-8" >
        <title>Your Shopping Cart</title>
    </head>
	
    <body bgcolor="#E6E6FA">
	<br>
	<br>
	<br>
	<h1 align="center"> Your Shopping Cart </h1>
	<h3 align="center"> by Fotios Gkelis </h3>
	<br>
	<br>
	<form method=POST action="index.jsp">
	<table bgcolor="#FFFFFF" border="3" cellpadding="5" align="center">
		<thead>
			<tr>
				<th>Item</th>
				<th>Price</th>
				<th>Quantity</th>
				<th>Total</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td>Cafe</td>
				<td><%=(String)application.getInitParameter("cafe_price")%></td>
				<td>
                                    <input type="text" name="cafe_quantity" size="6" align="center" value="<% if (session.getAttribute("cafe_quantity") != null) 
                                    {%> <%=session.getAttribute("cafe_quantity")%> <%} else {%> <%=0%> <% }%>">
                                </td>
				<td>
                                    <% double cafe_quantityNumber;
                                    double cafe_unit = Double.valueOf((String)application.getInitParameter("cafe_price"));
                                    if (request.getParameter("cafe_quantity") != null) {
                                    cafe_quantityNumber = Double.valueOf((String)request.getParameter("cafe_quantity"));} 
                                    else {if (session.getAttribute("cafe_quantity")!=null) {cafe_quantityNumber = Double.valueOf((String)session.getAttribute("cafe_quantity"));} 
                                    else {cafe_quantityNumber=0;}}%>
                                    <%=cafe_quantityNumber * cafe_unit%> 
                                </td>
			</tr>
			<tr>
				<td>Sugar</td>
				<td><%=(String)application.getInitParameter("sugar_price")%></td>
				<td>
                                    <input type="text" name="sugar_quantity" size="6" align="center" value="<% if (session.getAttribute("sugar_quantity") != null) 
                                    {%> <%=session.getAttribute("sugar_quantity")%> <%} else {%> <%=0%> <% }%>">
                                </td>
				<td>
                                    <% double sugar_quantityNumber;
                                    double sugar_unit = Double.valueOf((String)application.getInitParameter("sugar_price"));
                                    if (request.getParameter("sugar_quantity") != null) {
                                    sugar_quantityNumber = Double.valueOf((String)request.getParameter("sugar_quantity"));} 
                                    else {if (session.getAttribute("sugar_quantity")!=null) {sugar_quantityNumber = Double.valueOf((String)session.getAttribute("sugar_quantity"));} 
                                    else {sugar_quantityNumber=0;}}%>
                                    <%=sugar_quantityNumber * sugar_unit%> 
                                </td>
			</tr>
			<tr>
				<td>Water</td>
				<td><%=(String)application.getInitParameter("water_price")%></td>
				<td>
                                    <input type="text" name="water_quantity" size="6" align="center" value="<% if (session.getAttribute("water_quantity") != null) 
                                    {%> <%=session.getAttribute("water_quantity")%> <%} else {%> <%=0%> <% }%>">
                                </td>
				<td>
                                    <% double water_quantityNumber;
                                    double water_unit = Double.valueOf((String)application.getInitParameter("water_price"));
                                    if (request.getParameter("water_quantity") != null) {
                                    water_quantityNumber = Double.valueOf((String)request.getParameter("water_quantity"));} 
                                    else {if (session.getAttribute("water_quantity")!=null) {water_quantityNumber = Double.valueOf((String)session.getAttribute("water_quantity"));} 
                                    else {water_quantityNumber=0;}}%>
                                    <%=water_quantityNumber * water_unit %>
                                </td>
			</tr>
			<tr>
				<td>Total:</td>
				<td></td>
				<td></td>
				<td>
                                    <%  double cafe_Number;
                                        double sugar_Number;
                                        double water_Number;
                                        if ((request.getParameter("cafe_quantity") != null) && (request.getParameter("sugar_quantity") != null) && (request.getParameter("water_quantity") != null)) {
                                        cafe_Number = Double.valueOf((String)request.getParameter("cafe_quantity"));
                                        sugar_Number = Double.valueOf((String)request.getParameter("sugar_quantity"));
                                        water_Number = Double.valueOf((String)request.getParameter("water_quantity"));}
                                            else {if 
                                                ((session.getAttribute("cafe_quantity")!=null) && (session.getAttribute("sugar_quantity")!=null) && (session.getAttribute("water_quantity")!=null))
                                                  {cafe_Number = Double.valueOf((String)session.getAttribute("cafe_quantity"));
                                                   sugar_Number = Double.valueOf((String)session.getAttribute("sugar_quantity"));
                                                   water_Number = Double.valueOf((String)session.getAttribute("water_quantity"));}
                                                    else {cafe_Number=0;
                                                          sugar_Number=0;
                                                          water_Number=0;}}%> 
                                        <%=(cafe_Number * cafe_unit) + (sugar_Number * sugar_unit) + (water_Number * water_unit)%> 
                                </td>
			</tr>
		</tbody>
	</table>
	<br>
	<br>
	<div align="center">
	<input type=submit name="Checkout" value="Checkout" title="Hit to checkout">
	</div>
	</form>
	<br>
	<br>
		<div align="center">
		<form action="http://dl.dropbox.com/u/29354428/P3.pdf" style="display:inline;">
		 <input type=submit name="report" value="   &#63;   " title="Get the report">
		</form>
		<form action="https://github.com/gkelis/ShoppingCart/tarball/master" style="display:inline;">
		 <input type=submit name="code" value="   &#33;   " title="Get the entire project in .tar">
		</form>
		<br>
		<br>
		<br>
		<p><a href="http://gkelis.github.com/ShoppingCart/">My GitHub Page</a></p>
		</div>
	</body>
</html>