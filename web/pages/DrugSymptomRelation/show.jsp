<%@page import="com.dispensary.project.model.*" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/commons/taglibs.jsp" %>

<rapid:override name="head">
	<link href="<c:url value="/styles/style.css"/>" type="text/css" rel="stylesheet">
	<title><%=DrugSymptomRelation.TABLE_ALIAS%>信息</title>
</rapid:override>

<rapid:override name="content">
	<s:form action="/pages/DrugSymptomRelation/list.do" method="get" theme="simple">
		<input type="button" value="返回列表" onclick="window.location='${ctx}/pages/DrugSymptomRelation/list.do'"/>
		<input type="button" value="后退" onclick="history.back();"/>
		
		<s:hidden name="id" id="id" value="%{model.id}"/>
	
		<table class="tablelist">
			<tr>	
				<td class="tdLabel"><%=DrugSymptomRelation.ALIAS_DRUG_ID%></td>	
				<td><s:property value='%{model.drugIdModel.modelTagValue}'/>&nbsp;</td>
			</tr>
			<tr>	
				<td class="tdLabel"><%=DrugSymptomRelation.ALIAS_SYMPTOM_ID%></td>	
				<td><s:property value='%{model.symptomIdModel.modelTagValue}'/>&nbsp;</td>
			</tr>
		</table>
	</s:form>
	<script>
		$(function(){
			$("tr:odd").addClass("odd");
			$("tr:even").addClass("even");
		});
	</script>
</rapid:override>


<%@ include file="base.jsp" %>