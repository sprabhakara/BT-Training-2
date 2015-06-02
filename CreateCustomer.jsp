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
.firstName("Mark")
.lastName("Jones")
.company("Jones Co.")
.email("mark.jones@example.com")
.fax("419-555-1234")
.phone("614-555-1234")
.website("http://example.com");
Result<Customer> custresult = gateway.customer().create(custrequest);

if(custresult.isSuccess()==true){
%>
<h2>Transaction is successful </h2>
<h2><%=custresult.getTarget().getId() %></h2>
<%}else {%>
<h2>Transaction failed: <%=custresult.getMessage() %></h2>
<%} %>
</body>
</html>