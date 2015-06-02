<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%@ page import="com.braintreegateway.*"%>
<%@ page import="java.math.BigDecimal"%>
<% 
BraintreeGateway gateway = new BraintreeGateway(
		  Environment.SANDBOX,
		  "fmz49x9n4s78f9qw",
		  "myr4cjw55sfh2bwh",
		  "d4d1b48bfd9c85bc6d0000effbdd648b"
		);
TransactionRequest vaultrequest = new TransactionRequest()
    .paymentMethodToken("38ybbw")
    .amount(new BigDecimal("11.00"));

Result<Transaction> vaultresult = gateway.transaction().sale(vaultrequest);
if(vaultresult.isSuccess()==true){
%>
<h2>Transaction is successful </h2>
<h2><%=vaultresult.getTarget().getId() %></h2>
<%}else {%>
<h2>Transaction failed: <%=vaultresult.getMessage() %></h2>
<%} %>
</body>
</html>