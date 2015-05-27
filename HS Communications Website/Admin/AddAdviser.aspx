<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMaster.Master" AutoEventWireup="true" CodeBehind="AddAdviser.aspx.cs" Inherits="HS_Communications_Website.Admin.AddAdviser" %>
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
            
                <asp:Panel ID="Panel1" runat="server" CssClass="alert-box" Visible="False" ><h4 style="text-align: center">
                    <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label></h4></asp:Panel>
                  <asp:Panel ID="ErrorPanel" runat="server" CssClass="alert-box alert" Visible="False"><h4>
                    <asp:Label ID="ErrorLabel" ForeColor="white" runat="server" Text="Label"></asp:Label></h4></asp:Panel>
                
   

         <div class="sectiontitle">
			<h4><strong class="colhead">Assign Advisers to Section</strong></h4>
		</div>
               <div class="six columns centered">
        Section: <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="SqlDataSource1" DataTextField="Sectno" DataValueField="Sectno"></asp:DropDownList>
             <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:HsDbConnectionString %>" SelectCommand="SELECT DISTINCT [Sectno], [GR-YR] AS column1 FROM [Section] ORDER BY [GR-YR]"></asp:SqlDataSource>
      
         Adviser Name: 
             <asp:DropDownList ID="DropDownList3" runat="server" DataSourceID="SqlDataSource2" DataTextField="fullname" DataValueField="fCode">
             </asp:DropDownList>
             <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:HsDbConnectionString %>" SelectCommand="SELECT [fCode], [fullname] FROM [FacTbl] ORDER BY [fullname]"></asp:SqlDataSource>
               <br/><br/>
         <span style="margin: 70%">
               <asp:Button ID="AdviserBtn" runat="server" Text="Assign Adviser" CssClass="buttonn" OnClick="AdviserBtn_Click"/>
                </span>
     </div> </div>
          
                </div>
        
	<!-- end main content-->

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
