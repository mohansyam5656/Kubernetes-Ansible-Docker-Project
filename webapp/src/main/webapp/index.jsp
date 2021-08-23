<h1> Hello, Welcome to Simple DevOps Project !!   </h1>
<h2> Deploying on a kubernetes using ansible and Docker </h2>
<h2> Glad to see you here again !!! </h2>
<h2> GCP Ubuntu Instance AMI using KOP - CICD PipeLine using GCP<h2>
<h2> Good Evening All </h2>
  
  <%@ page import="com.telefonica.movistar.vo.UserVO" %>
<%@ page import="com.telefonica.movistar.dao.MonitorProcessDAO" %>
<%@ page import="com.telefonica.movistar.vo.MonitorProcessVO" %>
<%@ page import="java.util.ArrayList" %>

<style>
.layout-footer {
    display: flex;
    justify-content: center; 
}
</style>

<%
  MonitorProcessDAO dao = new MonitorProcessDAO();

  String action = request.getParameter("action");
  String reference = request.getParameter("reference");

  if ("keepalive".equals(action)) {
    dao.keepAlive(reference);
  } else
  if ("setmetrics".equals(action)) {
    String metric1 = request.getParameter("metric1");
    String metric2 = request.getParameter("metric2");
    String metric3 = request.getParameter("metric3");
    dao.setMetrics(reference, metric1, metric2, metric3);
  } else
  if ("reporterror".equals(action)) {
      String message = request.getParameter("message");
    dao.reportError(reference, message);
  } else {
%>
<%@ page contentType="text/html" pageEncoding="windows-1252"%>
<!DOCTYPE html PUBLIC "-//WAPFORUM//DTD XHTML Mobile 1.0//EN" "http://www.wapforum.org/DTD/xhtml-mobile10.dtd">
<html>
  <head>
    <link rel="stylesheet" type="text/css" href="../mobile/mobileWS.css" media="screen" />
    <meta http-equiv="Content-Type" content="text/html; charset=windows-1252" name="MobileOptimized">
    <title>Process Monitoring</title>
  </head>
  <body>
    <p><b>Now:</b> <%=(new java.util.Date())%></p>
    <table>
    <tr bgcolor="#E0E0E0">
      <td><b>Reference</b></td>
      <td><b>KeepaliveDate</b></td>
      <td><b>Metric1</b></td>
      <td><b>Metric2</b></td>
      <td><b>Metric3</b></td>
      <td width="100%">&nbsp;</td>
    </tr>

<%
  ArrayList list = dao.list(null);
  for (int i=0;(list!=null)&&(i<list.size());i++) {
    MonitorProcessVO vo = (MonitorProcessVO)list.get(i);

    String bgcolor= ((i%2)!=0) ? "#F0F0F0" : "#FFFFFF";
%>
    <tr bgcolor="<%=bgcolor%>">
      <td nowrap><%=vo.getReference()%></td>
      <td nowrap><%=vo.getKeepaliveDate()%></td>
      <td nowrap><%=vo.getMetric1Value()%></td>
      <td nowrap><%=vo.getMetric2Value()%></td>
      <td nowrap><%=vo.getMetric3Value()%></td>
    </tr>
<%
  }
%>    
    </table>
    <br/>
    <table>
    <tr bgcolor="#E0E0E0">
      <td><b>Reference</b></td>
      <td><b>ErrorDate</b></td>
      <td width="100%"><b>Message</b></td>
    </tr>

<%
  list = dao.listError(null);
  for (int i=0;(list!=null)&&(i<list.size());i++) {
    MonitorProcessVO vo = (MonitorProcessVO)list.get(i);

    String bgcolor= ((i%2)!=0) ? "#F0F0F0" : "#FFFFFF";
%>
    <tr bgcolor="<%=bgcolor%>">
      <td nowrap><%=vo.getReference()%></td>
      <td nowrap><%=vo.getErrorDate()%></td>
      <td nowrap><%=vo.getErrorMessage()%></td>
    </tr>
<%
  }
%>    
    </table>
    <br/>
    <table>
    <tr bgcolor="#E0E0E0">
      <td width="100%"><b>Daily Reports</b></td>
    </tr>
    <tr bgcolor="#F0F0F0">
      <td nowrap><a href="../reports/generic_html.jsp?guiUserId=10191&reportId=973&view=V_RPT_SAV_TELEFONO_STATUS">Aggregation Logs</a></td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td nowrap><a href="../reports/generic_html.jsp?guiUserId=191001&reportId=83&view=V_ABONADOS_MONITORING_DAY">Aggregation Monitoring</a></td>
    </tr>
    </table>

    <div class="layout-footer" style="align">
        <br/><br/>
        Build 1.0.0  -  (07/11/2017)  &nbsp;&nbsp;|&nbsp;&nbsp; &copy; Telefonica 2017
    </div>


  </body>
</html>
<% 
  } 
%>
  
