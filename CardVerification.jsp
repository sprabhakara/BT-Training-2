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
CustomerRequest custrequest = new CustomerRequest()
.creditCard()
    .paymentMethodNonce(request.getParameter("payment_method_nonce"))
    .options()
        .verifyCard(true)
        .done()
    .done();

Result<Customer> result = gateway.customer().update("21660991", custrequest);

System.out.println(result.isSuccess());


CreditCardVerification verification = result.getCreditCardVerification();
System.out.println(result);
System.out.println(verification);
System.out.println(verification.getStatus());

System.out.println(verification.getProcessorResponseCode());

System.out.println(verification.getProcessorResponseText());


%>
</body>
</html>