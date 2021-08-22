<h1> Hello, Welcome to Simple DevOps Project !!   </h1>
<h2> Deploying on a kubernetes using ansible and Docker </h2>
<h2> Glad to see you here again !!! </h2>
<h2> GCP Ubuntu Instance AMI using KOP - CICD PipeLine using GCP<h2>
<h2> Good Evening All </h2>
  

<%@ taglib uri="tags-html-el" prefix="html-el"%>
<%
		  ClauseOavService cud =(ClauseOavService) AppContextUtil.getApplicationContext().getBean(BeanFactoryConstants.CLAUSE_OAV_SERVICE );
       request.getSession().getServletContext().setAttribute("app_clause_section_group",cud.getSectionGroup());
		   request.getSession().getServletContext().setAttribute("app_clause_section",cud.getSectionOrdered());
		   request.getSession().getServletContext().setAttribute("app_clause_group",cud.getGroup());
		   request.getSession().getServletContext().setAttribute("app_clause_title",cud.getClauseTitle() );
%>

<link rel="stylesheet" href="/css/print.css" type="text/css" media="screen">

<input:body title="OATool Signed Agreement" jsFile="form.js;Validate.js" >

<c:set var="cl_sec_special" value="3"/>
<c:set var="cl_gr_special" value="120"/>
<c:set var="section_adhoc_title" value="Ad Hoc Clauses - User" />

<table id="super" class="table_id">
<tr>
 <td><jsp:include page="ssi/topHeader.jsp" flush="true"></jsp:include></td>
</tr>
<tr>
    <td><table width="100%" class="table_id">
        <tr>
          <td width="20%" class="smallcell_left"><strong>OA Number</strong></td>
          <td>&nbsp;</td>
          <td class="smallcell_left">oaInfo.getOANumber()</td>
        </tr>

        <tr>
          <td width="20%" class="smallcell_left"><strong>CBR Number</strong></td>
          <td>&nbsp;</td>
          <td class="smallcell_left">cbrNumber</td>
        </tr>

        <tr>
          <td width="20%" class="smallcell_left"><strong>OA Version Number</strong></td>
          <td>&nbsp;</td>
          <td class="smallcell_left">oaVersionInfo.getVersion()</td>
        </tr>

        <tr>
          <td width="20%" class="smallcell_left"><strong>Date Last Modified</strong></td>
          <td>&nbsp;</td>
          <td class="smallcell_left">lastModifiedDate</td>
        </tr>

        <tr>
          <td width="20%" class="smallcell_left"><strong> OA Status</strong></td>
          <td>&nbsp;</td>
          <td class="smallcell_left">oaVersionStatus</td>
        </tr>

        <tr>
          <td width="20%" class="smallcell_left"><strong>Location Code</strong></td>
          <td>&nbsp;</td>
          <td class="smallcell_left">buildingID</td>
        </tr>

        <tr>
          <td width="20%" class="smallcell_left"><strong>Lease Number</strong></td>
          <td>&nbsp;</td>
          <td class="smallcell_left">leaseNumber</td>
        </tr>

        <tr>
          <td width="20%" class="smallcell_left"><strong>Supplemental Reason</strong></td>
          <td>&nbsp;</td>
          <td class="smallcell_left">supplementalReasonText</td>
        </tr>
        <tr>
          <td>&nbsp;</td>
        </tr>
        <tr>
          <td>&nbsp;</td>
          <td>&nbsp;</td>
          <td align="right"><input:button onClick="" class="aSignButton" value="Generate PDF Report" title="Generate PDF Report"/> </td>
        </tr>

        <tr>
          <td>&nbsp;</td>
        </tr>
      </table></td>
    </tr>
  <tr>
      <td align="center" class="headersign">OCCUPANCY AGREEMENT<br>
        Between<br>
        agencyInfo<br>
        And<br>
        GENERAL SERVICES ADMINISTRATION
    </td>
  </tr>

  <tr>
    <td><br></td>
  </tr>
        <tr>
            <td> <table width="100%" border="0" cellpadding="2" cellspacing="0" class="table_id" >

              <c:forEach items="${app_clause_section}" var="section" >
              <c:if test="${section.key!=cl_sec_special }" >
              <tr><td>&nbsp;</td></tr>
                <tr>
                    <td class="headersign"> <c:out value="${section.title}" /> </td>
                </tr>
              </c:if>
                <tr>
                    <td valign="top">
                        <table class="table_id">
                            <c:forEach items='${app_clause_section_group[section.key]}' var="group" >
                            <c:if test="${not empty requestScope.request_ClauseGroupEvet[group.key]}" >
                             <c:if test="${group.key!=cl_gr_special }" >
                                  <tr><td>&nbsp;</td></tr>
                                  <tr>
                                      <td class="titlesign"> <c:out value="${group.groupTitle}"/> </td>	
                                  </tr>
                            </c:if>
                                    <c:forEach items='${request_ClauseEvet}' var="clause" >
                                     <c:if test="${clause.clauseGroupId==group.key }" >
                                  <tr><td>&nbsp;</td></tr>
                                  <tr>
                                      <td class="subtitlesign"> <c:out value='${applicationScope.app_clause_title[clause.key].title }'/>

                                      </td></tr>
                                      <tr><td> <c:out value="${requestScope.request_OnlyOAClause[clause.key].text}" />
                                      </td></tr>
                                          </c:if> </c:forEach>
                                        </c:if> </c:forEach>
                        </table>
                    </td>
              </tr>
            </c:forEach>

                <tr><td>&nbsp;</td></tr>
                <tr>
                  <td class="headersign"><c:out value="${section_adhoc_title}"/>
                  <table class="table_id">
                  <c:forEach items='${request_OnlyOAClauseList}' var="clause" >
                  <c:if test='${clause.groupId==0 and (clause.mandatoryInd  eq "Y")}' >
                  <tr><td>&nbsp;</td></tr>
                    <tr>
                        <td class="titlesign"> <c:out value='${clause.title }'/></td>
                    </tr>
                  <tr><td>&nbsp;</td></tr>
                  <tr>
                    <td> <c:out value='${clause.text }'/></td>
                  </tr>
                  </c:if>
                  </c:forEach>
                  </table></td>
                  </tr>


  <tr>
    <td><br></td>
  </tr>
  <tr>
    <td>I agree to the initial terms with the understanding modifications will be made over time. </td>
  </tr>
  <tr>
    <td><table width="100%" border="0" cellspacing="0" cellpadding="1" class="table_id">
        <tr>
          <td class="smallcell_topleft" height="25">Approved</td>
          <td class="smallcell_right" height="25">Approved</td>
        </tr>
        <tr>
          <td class="smallcell_left" height="25">Agency Representative</td>
          <td class="smallcell" height="25">GSA Representative</td>
        </tr>
        <tr>
          <td class="smallcell_left" height="25">Title</td>
          <td class="smallcell" height="25">Title</td>
        </tr>
        <tr>
          <td class="smallcell_left" height="25">Date</td>
          <td class="smallcell" height="25">Date</td>
        </tr>
      </table></td>
  </tr>
  <tr>
    <td><br></td>
  </tr>
  <tr>
    <td align="right"><input:button onClick="" class="aSignButton" value="Generate PDF Report" title="Generate PDF Report"/> </td>
  </tr>
</table></td>
 </tr></table>
</input:body> 
