<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMaster.Master" AutoEventWireup="true" CodeBehind="ManageAccnt.aspx.cs" Inherits="HS_Communications_Website.Admin.ManageAccnt" %>
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
			<h4><strong class="colhead">Enable and Disable Accounts</strong></h4>
		</div>
    <asp:Panel ID="Panel1" runat="server" CssClass="alert-box" Visible="False" ><h4 style="text-align: center">
                    <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label></h4></asp:Panel>
                  <asp:Panel ID="ErrorPanel" runat="server" CssClass="alert-box alert" Visible="False"><h4>
                    <asp:Label ID="ErrorLabel" ForeColor="white" runat="server" Text=""></asp:Label></h4></asp:Panel>
                
            

                <div class="six columns centered">
                    <p> Faculty Name: <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource1" DataTextField="fullname" DataValueField="fCode" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged" AutoPostBack="True"></asp:DropDownList>
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:HsDbConnectionString %>" SelectCommand="SELECT [fullname], [fCode] FROM [FacTbl] ORDER BY [fullname]"></asp:SqlDataSource>
                    </p>
                <p style="left: 20%;position: relative">
                    <asp:Label ID="statusLbl" runat="server" Font-Size="Larger" Font-Bold="True"></asp:Label>
                </p>
                <p >Toggle Account :
                    <asp:DropDownList ID="DropDownList2" runat="server">
                        <asp:ListItem Value="False">Enabled</asp:ListItem>
                        <asp:ListItem Value="True">Disabled</asp:ListItem>
                    </asp:DropDownList></p>
              
                <span style="margin-left: 80%">
                    <asp:Button ID="Button1" runat="server" Text="Submit" CssClass="buttonn" OnClick="Button1_Click"/></span>
                </div> 
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
