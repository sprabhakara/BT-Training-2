<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<script src="https://js.braintreegateway.com/v2/braintree.js"></script>
<script type="text/javascript">
function fnDropin(){
var clientToken = document.getElementById("clientToken").value;
braintree.setup(clientToken, "paypal", {
	  container: "paypal-container",
	  onPaymentMethodReceived: function (obj) {
	    alert("paymnt method nonce   --   " + obj.nonce);
	  }
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
<form id="checkout" method="post" action="Result.jsp">
	<input type="hidden" id="clientToken" value=<%=clientToken %>>

		<div id="paypal-container"></div>

<input type="submit" id="submit" value="Pay">
</form>
</body>
</html>