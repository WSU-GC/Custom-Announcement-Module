<%@page import="edu.wsu.BuildingBlockHelper"%>
<%@page import="java.util.Properties"%>
<%@ taglib uri="/bbNG" prefix="bbNG"%>

<% Properties props = BuildingBlockHelper.loadBuildingBlockSettings(); %>

<bbNG:includedPage ctxId="bbContext">

<%= props.getProperty("message", "No system announcements at this time") %>

</bbNG:includedPage>