<%-- 
    Document   : index
    Created on : Dec 10, 2011, 1:26:04 AM
    Author     : FoG
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<jsp:useBean id="cafe" class="beans.QuantityBean" scope="session"/>
<jsp:setProperty name="cafe" property="*"/>
<jsp:useBean id="sugar" class="beans.QuantityBean" scope="session"/>
<jsp:setProperty name="sugar" property="*"/>
<jsp:useBean id="water" class="beans.QuantityBean" scope="session"/>
<jsp:setProperty name="water" property="*"/>

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
				<td>${initParam.cafe_price}</td>
				<td>
                                    <input type="text" name="cafe_quantity" size="6" value="${cafe.cafe_quantity}">
                                </td>
                                <td>${initParam.cafe_price * cafe.cafe_quantity}</td>
			</tr>
			<tr>
				<td>Sugar</td>
				<td>${initParam.sugar_price}</td>
				<td>
                                    <input type="text" name="sugar_quantity" size="6" value="${sugar.sugar_quantity}">
                                </td>
				<td>${initParam.sugar_price * sugar.sugar_quantity}</td>
			</tr>
			<tr>
				<td>Water</td>
				<td>${initParam.water_price}</td>
				<td>
                                    <input type="text" name="water_quantity" size="6" value="${water.water_quantity}">
                                </td>
				<td>${initParam.water_price * water.water_quantity}</td>
			</tr>
			<tr>
				<td>Total:</td>
				<td></td>
				<td></td>
				<td>
                                    ${(initParam.cafe_price * cafe.cafe_quantity)+(initParam.sugar_price * sugar.sugar_quantity)+(initParam.water_price * water.water_quantity)}
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
		<form action="http://dl.dropbox.com/u/29354428/P3.pdf" style="display:inline">
		 <input type=submit name="report" value="   &#63   " title="Get the report">
		</form>
		<form action="https://github.com/gkelis/ShoppingCart/tarball/master" style="display:inline">
		 <input type=submit name="code" value="   &#33   " title="Get the entire project in .tar">
		</form>
		<br>
		<br>
		<br>
		<p><a href="http://gkelis.github.com/ShoppingCart/">My GitHub Page</a></p>
		</div>
	</body>
</html>