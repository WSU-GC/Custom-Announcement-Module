<%@page import="java.util.Properties"%>
<%@page import="edu.wsu.BuildingBlockHelper"%>
<%@ taglib uri="/bbNG" prefix="bbNG"%>

<bbNG:genericPage ctxId="bbContext" title="WSU Custom Announcement Module Settings">
<bbNG:jsFile href="<%= BuildingBlockHelper.getBaseUrl(\"js/jquery.js\") %>"/>
<bbNG:jsBlock>
<script type="text/javascript">
	$.noConflict();
	
	(function($) {
		$(function() {
			$(document).on('submit', '#systemMessage', function(e) {
				e.preventDefault();
				$.post('<%= BuildingBlockHelper.getBaseUrl() + "Settings" %>', {
					message: $('#messagetext_ifr').contents().find('#tinymce').html()
				}, function(data) {
					window.location.replace('<%= BuildingBlockHelper.getBaseUrl("admin/configure.jsp") %>');
				});
			});
		});
	}(jQuery));
</script>
</bbNG:jsBlock>
<bbNG:pageHeader> 
 <bbNG:pageTitleBar title="WSU Custom Announcement Module Settings"/> 
</bbNG:pageHeader>

<% Properties props = BuildingBlockHelper.loadBuildingBlockSettings(); %>

<form id="systemMessage" action='<%= BuildingBlockHelper.getBaseUrl() + "Settings" %>' method="post">
	<bbNG:dataCollection>
		<bbNG:step title="System Message">
			<bbNG:dataElement>
				<bbNG:textbox name="message" text='<%= props.getProperty("message", "") %>'></bbNG:textbox>
			</bbNG:dataElement>
		</bbNG:step>
		<bbNG:stepSubmit>
			<bbNG:stepSubmitButton label="Save"/>
		</bbNG:stepSubmit>
	</bbNG:dataCollection>
</form>

</bbNG:genericPage>