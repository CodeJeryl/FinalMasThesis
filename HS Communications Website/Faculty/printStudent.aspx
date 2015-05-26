<%@ Page Title="" Language="C#" MasterPageFile="~/Faculty/FacuMaster.Master" AutoEventWireup="true" CodeBehind="printStudent.aspx.cs" Inherits="HS_Communications_Website.Faculty.printStudent" %>

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
	<div class="twelve columns" style="height: 1200px">
	    <div class="sectiontitle">
			<h4><strong class="colhead">Class list Generator</strong></h4>
		</div>
       
                    <h2>Student Generator</h2>
                
         <telerik:ReportViewer ID="ReportViewer1" runat="server" Height="991px" ShowDocumentMapButton="False" ShowHistoryButtons="False" ShowPrintPreviewButton="False" ShowRefreshButton="False" Width="887px"></telerik:ReportViewer>
            
        


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
