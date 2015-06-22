<%@ Page Title="" Language="C#" MasterPageFile="~/MainMaster.Master" AutoEventWireup="true" CodeBehind="ActivateAccount.aspx.cs" Inherits="HS_Communications_Website.ActivateAccount" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
   </asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
  <div class="hr">
</div>
<!-- CONTENT 
================================================== -->
<div class="row">
    <!-- MAIN CONTENT-->
	<div class="six columns centered">
	    <div class="sectiontitle">
			<h4><strong class="colhead">Activate Account</strong></h4>
		</div>
       
                <asp:Panel ID="Panel1" runat="server" CssClass="alert-box" Visible="False" ><h4 style="text-align: center">
                   Student Account and Parent Account Successfully Activated</h4></asp:Panel>
                  <asp:Panel ID="ErrorPanel" runat="server" CssClass="alert-box alert" Visible="False"><h4>
                    <asp:Label ID="ErrorLabel" ForeColor="white" runat="server" Text="Label"></asp:Label></h4></asp:Panel>
                
    
                    <p> Student ID: <asp:TextBox ID="userTxtbox" runat="server"></asp:TextBox></p> 
                  <p> Email Address: <asp:TextBox ID="emailTxtbox" runat="server"></asp:TextBox></p>
                  <br/>
                <span style="margin: 72%"> <asp:Button ID="Button1" runat="server" Text="Activate Now" CssClass="buttonn" OnClick="Button1_Click"/></span>
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
<script src="/javascripts/formvalidation.js"></script>
<script src="/javascripts/jquery.cycle.js"></script>
<script src="/javascripts/app.js"></script>
<script src="/javascripts/scrolltotop.js"></script>

</asp:Content>
