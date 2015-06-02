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
<%@ page import="java.awt.List"%>
<%
BraintreeGateway gateway = new BraintreeGateway(
		  Environment.SANDBOX,
		  "fmz49x9n4s78f9qw",
		  "myr4cjw55sfh2bwh",
		  "d4d1b48bfd9c85bc6d0000effbdd648b"
		);
MerchantAccountRequest merrequest = new MerchantAccountRequest().
    individual().
        firstName(com.braintreegateway.test.MerchantAccount.Approve).
        lastName("Doe").
        email("jane@14ladders.com").
        phone("5553334444").
        dateOfBirth("1981-11-19").
        ssn("456-45-4567").
        address().
            streetAddress("111 Main St").
            locality("Chicago").
            region("IL").
            postalCode("60622").
            done().
        done().
    funding().
        descriptor("Blue Ladders").
        destination(MerchantAccount.FundingDestination.BANK).
        email("funding@blueladders.com").
        mobilePhone("1111111111").
        accountNumber("1123581321").
        routingNumber("071101307").
        done().
    tosAccepted(true).
    masterMerchantAccountId("k7mv6y7k4vhqhv8p").
    id("testSubMerchant15");

Result<MerchantAccount> result = gateway.merchantAccount().create(merrequest);
System.out.println(result.isSuccess());
System.out.println(result.getErrors());

ValidationErrors error = result.getErrors();



//true
/*MerchantAccount ma = result.getTarget();
System.out.println(ma.getStatus());
//true
System.out.println(ma.getId());
//"blue_ladders_store"
System.out.println(ma.getMasterMerchantAccount().getId());
//"14ladders_marketplace"
System.out.println(ma.getMasterMerchantAccount().getStatus());
//true */
%>
</body>
</html>