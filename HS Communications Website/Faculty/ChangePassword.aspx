<%@ Page Title="" Language="C#" MasterPageFile="~/Faculty/FacuMaster.Master" AutoEventWireup="true" CodeBehind="ChangePassword.aspx.cs" Inherits="HS_Communications_Website.Faculty.ChangePassword" %>
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
			<h4><strong class="colhead">Change Password</strong></h4>
		</div>
        <div class="six columns centered">
            
            
                <asp:Panel ID="Panel1" runat="server" CssClass="alert-box" Visible="False" ><h4 style="text-align: center">
                  Password Successfully Changed.</h4></asp:Panel>
                  <asp:Panel ID="ErrorPanel" runat="server" CssClass="alert-box alert" Visible="False"><h4>
                    <asp:Label ID="ErrorLabel" ForeColor="white" runat="server" Text="Label"></asp:Label></h4></asp:Panel>
                

        
                    <p>Old password: <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Required Field." ControlToValidate="oldpassTxtbox" ForeColor="Red" ValidationGroup="qw"></asp:RequiredFieldValidator>  <asp:TextBox ID="oldpassTxtbox" runat="server" TextMode="Password"></asp:TextBox> </p> 
                  <p>New password: <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Required Field" ControlToValidate="new1pass" ForeColor="Red" ValidationGroup="qw"></asp:RequiredFieldValidator> <asp:TextBox ID="new1pass" runat="server" TextMode="Password"></asp:TextBox></p>
                  
                <p> Repeat new password: <asp:TextBox ID="new2pass" runat="server" TextMode="Password"></asp:TextBox>  
                    <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="New Password does not match" ControlToCompare="new1pass" ControlToValidate="new2pass" ForeColor="Red" ValidationGroup="qw"></asp:CompareValidator></p>
               
                
                <span style="margin: 60%"> <asp:Button ID="Button1" runat="server" Text="Change Password" CssClass="buttonn" OnClick="Button1_Click" ValidationGroup="qw"/></span>
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
