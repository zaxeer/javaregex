<%@page import="java.util.regex.Matcher"%>
<%@page import="java.util.regex.Pattern"%>
<%@page import="org.apache.commons.lang3.StringUtils"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<%
String regex = request.getParameter("regex");
String testdata = request.getParameter("testdata");
if(regex == null) {
	regex = "";
}
if(testdata == null) {
	testdata = "";
}
%>
<body>
<form action="index.jsp" method="post">
Reg Ex : <input type="text" name="regex" value="<%=regex%>"/>&nbsp;&nbsp;&nbsp;<input type="submit" value="test"/>
<br/>
<textarea name="testdata" rows="10" cols="50"><%=testdata%></textarea>&nbsp;
<div name="resultdata" style="display:inline-block;border: 1px solid silver;">
<%
	if(StringUtils.isNotBlank(regex) && StringUtils.isNotBlank(testdata)) {
		Pattern pattern = Pattern.compile(regex);
		Matcher matcher = pattern.matcher(testdata);
		testdata = testdata.replace("\r\n", "<br/>");
		StringBuffer output= new StringBuffer(testdata);
		while(matcher.find()){
			String group = matcher.toMatchResult().group().trim();
			if(StringUtils.isNotBlank(group)){
				output.insert(output.indexOf(group),"<mark>");
				output.insert(output.indexOf(group) + group.length(),"</mark>");
			}
		}
		out.println(output);
	}
%>
</div>
</form>
</body>
</html>