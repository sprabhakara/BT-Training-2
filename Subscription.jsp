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
SubscriptionRequest subsrequest = new SubscriptionRequest()
    .paymentMethodToken("2zbn2b")
    .planId("1");

Result<Subscription> result = gateway.subscription().create(subsrequest);

System.out.println(result.getTarget().getStatus());
// Pending

System.out.println(result.getTarget().getBillingDayOfMonth());
%>
</body>
</html>