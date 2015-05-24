<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMaster.Master" AutoEventWireup="true" CodeBehind="AdminHomepage.aspx.cs" Inherits="HS_Communications_Website.Admin.AdminHomepage" %>

<%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
<div class="hr">
</div>
<!-- CONTENT 
================================================== -->
<div class="row">
    <!-- MAIN CONTENT-->
	<div class="twelve columns">
	    <div class="sectiontitle">
			<h4><strong class="colhead">Dashboard</strong></h4>
		</div>
          <asp:Panel ID="Panel1" runat="server" CssClass="info-box" Visible="False"><h2 style="text-align: center">
                  </h2></asp:Panel>
                  <asp:Panel ID="ErrorPanel" runat="server" CssClass="warning-box" Visible="False"><h2>
                    <asp:Label ID="ErrorLabel" runat="server" Text="Label"></asp:Label></h2></asp:Panel>
        
                
                <div class="six columns">
          <strong class="colhead">Town Feeder</strong>
                <asp:Chart ID="Chart1" runat="server">
                    <Series>
                        <asp:Series Name="Series1" ChartArea="ChartArea1"  ChartType="Bar" ></asp:Series>
                    </Series>
                    <ChartAreas>
                        <asp:ChartArea Name="ChartArea1">
                            <AxisX Title="Town"></AxisX>
                            <AxisY Title="Number"></AxisY>
                        </asp:ChartArea>
                    </ChartAreas>
                 
                </asp:Chart>
                </div>
                

                      <div class="six columns">
                           <strong class="colhead">School Feeder</strong>
                <asp:Chart ID="Chart2" runat="server">
                    <Series>
                        <asp:Series Name="Series1" ChartArea="ChartArea1"  ChartType="Bar" ></asp:Series>
                    </Series>
                    <ChartAreas>
                        <asp:ChartArea Name="ChartArea1">
                            <AxisX Title="School"></AxisX>
                            <AxisY Title="Number"></AxisY>
                        </asp:ChartArea>
                    </ChartAreas>
                 
                </asp:Chart>
                          

                      </div>
                
          
                </div>
        
	</div><!-- end main content-->

	<!--
	<div class="four columns">
      
	</div> -->

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
