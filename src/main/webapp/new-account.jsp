<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.net.InetAddress" %>
<!DOCTYPE html>
<html>
    <head>
        <title>IBanking - New Account</title>
    </head>
    <body style="margin: 10px 100px auto; padding: 10px 50px; font-size: 25px;">
    	<div style="margin: 20px 20px auto; padding: 20px 20px; width: 50%">
	        <h2>iBanking - Open Account</h2>
	        <hr/>
	        <form action="newAccount" method="POST">
	            Account No: <input type="text" name="accountNo"/><br/>
	            Account Holder Name: <input type="text" name="accountHolderName"/><br/>
	            Account Type: 
	            <select name="accountType" style="font-size: 16px;">
	                <option value="savings">savings</option>
	                <option value="current">current</option>
	            </select><br/>
	            Balance: <input type="text" name="balance"/><br/>
	            <input type="submit" value="Open-Account" style="padding: 5px 5px; font-size: 18px; float: right; margin-bottom: 10px"/>
	        </form>
	        <hr style="clear: both;"/>
	        Server IP: <%=request.getLocalAddr()%><br/>
	        Server HostName: <%=request.getLocalName()%><br/>
	        Server Port: <%=request.getLocalPort()%><br/>
	        Server IP Address HostAddress: <%=InetAddress.getLocalHost().getHostAddress() %><br/>
	        Server HostName: <%=InetAddress.getLocalHost().getHostName() %>
        </div>
    </body>
</html>