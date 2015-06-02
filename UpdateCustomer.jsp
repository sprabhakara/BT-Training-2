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
<%
BraintreeGateway gateway = new BraintreeGateway(
		  Environment.SANDBOX,
		  "fmz49x9n4s78f9qw",
		  "myr4cjw55sfh2bwh",
		  "d4d1b48bfd9c85bc6d0000effbdd648b"
		);
Customer customer = gateway.customer().find("21660991");
System.out.println(customer.getCreditCards().size());
/*for(int i = 0; i<=customer.getPaymentMethods().size(); i++){
	customer.getPaymentMethods().get(i);
}*/
String token = customer.getPaymentMethods().get(1).getToken();
CreditCard creditcard = gateway.creditCard().find(token);
//PaymentMethod paymentMethod = gateway.paymentMethod().find(customer.getPaymentMethods().get(1).getToken());
System.out.println(creditcard.getLast4()); // array of PaymentMethod instances
/*
CustomerRequest custrequest = new CustomerRequest()
    .creditCard()
        .paymentMethodNonce(request.getParameter("payment_method_nonce"))
        .done();

Customer updatedCustomer = gateway.customer().update(customer.getId(), custrequest).getTarget();
System.out.println(updatedCustomer.getCreditCards().size());
*/
%>
</body>
</html>