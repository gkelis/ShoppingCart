In Project 3 (ShoppingCart) we had to create a Shopping Cart (basket) in two
ways (parts).

In the first part we used scriptlets in our jsp file without using any servlets
or java classes.
In the second part we used javabeans and EL expressions. We created a javabean
named "QuantityBean.java" and a java class named "Bean.java". The source code
of the .java files is located in the "bean\src\java" directory.

The folder named "scriptlet" contains the first part of Project 3 whilst
the folder named "bean" contains the second part.

Steps for successful deployment:
1) Install Apache Tomcat
2) Extract both folders ("scriptlet" and "bean" respectively) into the 
	“installation_directory\Apache Software Foundation\Tomcat 7.0\webapps” directory
3) Start (or restart) Tomcat service
4) Enter " http://localhost:8080/scriptlet " in the address bar of any web browser
	for the first part or
   Enter " http://localhost:8080/bean " in the address bar of any web browser
	for the second part
5) Start playing with your Shopping Cart!!!