<%@page import="com.dispensary.project.model.*" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib tagdir="/WEB-INF/tags/simpletable" prefix="simpletable"%>
<%@ include file="/commons/taglibs.jsp" %>

<rapid:override name="head">
	<title><%=PrescriptionInfo.TABLE_ALIAS%> 维护</title>
	
	<link href="<c:url value="/widgets/simpletable/simpletable.css"/>" type="text/css" rel="stylesheet">
	<link href="<c:url value="/styles/style.css"/>" type="text/css" rel="stylesheet">
	<script type="text/javascript" src="<c:url value="/widgets/simpletable/simpletable.js"/>"></script>
	
	<script type="text/javascript" >
		$(document).ready(function() {
			// 分页需要依赖的初始化动作
			window.simpleTable = new SimpleTable('queryForm',${page.thisPageNumber},${page.pageSize},'${pageRequest.sortColumns}');
		});
	</script>
</rapid:override>

<rapid:override name="content">
	<form id="queryForm" name="queryForm" action="<c:url value="/pages/PrescriptionInfo/list.do"/>" method="post" style="display: inline;">
	<div class="queryPanel">
		<fieldset>
			<legend>搜索</legend>
			<table>
				<tr>	
					<td class="tdLabel"><%=PrescriptionInfo.ALIAS_CASE_ID%></td>		
					<td>
							<input type="text" value="${query.caseIdModelTag}" id="caseIdModelTag" name="caseIdModelTag"/>
					</td>
					<td class="tdLabel"><%=PrescriptionInfo.ALIAS_PERS_DATE%></td>		
					<td>
						<input type="text" value="<fmt:formatDate value='${query.persDateBegin}' pattern='<%=PrescriptionInfo.FORMAT_PERS_DATE%>'/>" onclick="WdatePicker({dateFmt:'<%=PrescriptionInfo.FORMAT_PERS_DATE%>'})" id="persDateBegin" name="persDateBegin"   />
						<input type="text" value="<fmt:formatDate value='${query.persDateEnd}' pattern='<%=PrescriptionInfo.FORMAT_PERS_DATE%>'/>" onclick="WdatePicker({dateFmt:'<%=PrescriptionInfo.FORMAT_PERS_DATE%>'})" id="persDateEnd" name="persDateEnd"   />
					</td>
					<td class="tdLabel"><%=PrescriptionInfo.ALIAS_STATE%></td>		
					<td>
						<input type="text" value="${query.state}" id="state" name="state" maxlength="10"  class="validate-integer max-value-2147483647"/>
					</td>
				</tr>	
			</table>
		</fieldset>
		<div class="handleControl">
			<input type="submit" class="stdButton" style="width:80px" value="查询" onclick="getReferenceForm(this).action='${ctx}/pages/PrescriptionInfo/list.do'"/>
			<input type="submit" class="stdButton" style="width:80px" value="新增" onclick="getReferenceForm(this).action='${ctx}/pages/PrescriptionInfo/create.do'"/>
			<input type="button" class="stdButton" style="width:80px" value="删除" onclick="batchDelete('${ctx}/pages/PrescriptionInfo/delete.do','items',document.forms.queryForm)"/>
		</div>
	</div>
	
	<div class="gridTable">
	
		<simpletable:pageToolbar page="${page}">
		<s:property value="@com.dispensary.project.model.PrescriptionInfo@TABLE_ALIAS"/>列表
		</simpletable:pageToolbar>
	
		<table width="100%"  border="0" cellspacing="0" class="tablelist">
		  <thead>
			  
			  <tr>
				<th style="width:50px;"> </th>
				<th style="width:50px;"><input type="checkbox" onclick="setAllCheckboxState('items',this.checked)"></th>
				
				<!-- 排序时为th增加sortColumn即可,new SimpleTable('sortColumns')会为tableHeader自动增加排序功能; -->
				<th sortColumn="Case_ID" ><%=PrescriptionInfo.ALIAS_CASE_ID%></th>
				<th sortColumn="PersDate" ><%=PrescriptionInfo.ALIAS_PERS_DATE%></th>
				<th sortColumn="State" ><%=PrescriptionInfo.ALIAS_STATE%></th>
	
				<th>操作</th>
			  </tr>
			  
		  </thead>
		  <tbody>
		  	  <c:forEach items="${page.result}" var="item" varStatus="status">
		  	  
			  <tr class="${status.count % 2 == 0 ? 'odd' : 'even'}">
				<td>${page.thisPageFirstElementNumber + status.index}</td>
				<td><input type="checkbox" name="items" value="presId=${item.presId}&"></td>
				
				<td><c:out value='${item.caseIdModel.modelTagValue}'/>&nbsp;</td>
				<td><c:out value='${item.persDateString}'/>&nbsp;</td>
				<td><c:out value='${item.state}'/>&nbsp;</td>
				<td>
					<a href="${ctx}/pages/PrescriptionInfo/show.do?presId=${item.presId}&">查看</a>&nbsp;&nbsp;&nbsp;
					<a href="${ctx}/pages/PrescriptionInfo/edit.do?presId=${item.presId}&">修改</a>
				</td>
			  </tr>
			  
		  	  </c:forEach>
		  </tbody>
		</table>
	
		<simpletable:pageToolbar page="${page}">
		<s:property value="@com.dispensary.project.model.PrescriptionInfo@TABLE_ALIAS"/>列表
		</simpletable:pageToolbar>
	</div>
	</form>
</rapid:override>


<%@ include file="base.jsp" %>

