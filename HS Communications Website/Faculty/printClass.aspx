<%@ Page Title="" Language="C#" MasterPageFile="~/Faculty/FacuMaster.Master" AutoEventWireup="true" CodeBehind="printClass.aspx.cs" Inherits="HS_Communications_Website.Faculty.printClass" %>
<%@ Register Assembly="Telerik.ReportViewer.WebForms, Version=7.0.13.220, Culture=neutral, PublicKeyToken=a9d7983dfcc261be" Namespace="Telerik.ReportViewer.WebForms" TagPrefix="telerik" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    </asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="hr">
</div>
<!-- CONTENT 
================================================== -->
<div class="row">
    <!-- MAIN CONTENT-->
	<div class="twelve columns" style="height: 1000px">
	    <div class="sectiontitle">
			<h4><strong class="colhead">Class list Generator</strong></h4>
		</div>
        
        <div class="four columns ">
            <strong>Choose Section: </strong>
      <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged" DataSourceID="SqlDataSource1" DataTextField="Section" DataValueField="Section">
           </asp:DropDownList>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:HsDbConnectionString %>" SelectCommand="SELECT DISTINCT [Section], [GR_YR] FROM [BLHD] ORDER BY [GR_YR]"></asp:SqlDataSource>
        </div>
       <br/>
        
                <telerik:ReportViewer ID="ReportViewer1" runat="server" Height="800px" ShowDocumentMapButton="False" ShowHistoryButtons="False" ShowPrintPreviewButton="False" ShowRefreshButton="False" Width="820px"></telerik:ReportViewer>
                
                
        

	</div><!-- end main content-->

	<!--
	<div class="four columns">
      
	</div> -->
</div>
<div class="hr">
</div>
    
<!-- JAVASCRIPTS 
================================================== -->
<!-- Javascript files placed here for faster loading -->
<script src="../javascripts/formvalidation.js"></script>
<script src="../javascripts/jquery.cycle.js"></script>
<script src="../javascripts/app.js"></script>
<script src="../javascripts/scrolltotop.js"></script>
</asp:Content>
