<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Result</title>
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

//System.out.println(request.getParameter("custom1"));
String nonce = request.getParameter("payment_method_nonce");
System.out.println(nonce);
TransactionRequest tranRequest = new TransactionRequest()
.amount(new BigDecimal("5.00"))
.paymentMethodNonce(nonce)
.options().
        storeInVaultOnSuccess(true).
        done();
;
//.customField("trans_1", request.getParameter("custom1"))
//.customField("trans_2", "value two");
Result<Transaction> result = gateway.transaction().sale(tranRequest);
Transaction transaction = result.getTarget();
//System.out.println(transaction.getCustomFields());
if(result.isSuccess()==true){
	System.out.println(transaction.getVaultCustomer(gateway).getPaymentMethods().get(0).getToken());
%>
<h2>Transaction is successful </h2>
<%}else {%>
<h2>Transaction failed: <%=result.getMessage() %></h2>
<%} %>

</body>
</html>