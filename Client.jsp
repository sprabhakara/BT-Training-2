<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Payment</title>
<script src="https://js.braintreegateway.com/v2/braintree.js"></script>
<script>
function fnDropin(){
var clientToken = document.getElementById("clientToken").value;
braintree.setup(clientToken,'dropin', {
	container: 'dropin'
	});
}
</script>
</head>
<body onload="fnDropin()">
	<%@ page import="com.braintreegateway.*"%>
	<%
BraintreeGateway gateway = new BraintreeGateway(
		  Environment.SANDBOX,
		  "fmz49x9n4s78f9qw",
		  "myr4cjw55sfh2bwh",
		  "d4d1b48bfd9c85bc6d0000effbdd648b"
		);
String clientToken = gateway.clientToken().generate();
%>
	<input type="hidden" id="clientToken" value=<%=clientToken %>>
	<form id="checkout" method="post" action="SubMerchantTransaction.jsp">
		<div id="dropin"></div>
		<input type="submit" value="Pay">
	</form>
</body>
</html>