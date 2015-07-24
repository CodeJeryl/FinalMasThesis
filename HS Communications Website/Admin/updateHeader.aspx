<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMaster.Master" AutoEventWireup="true" CodeBehind="updateHeader.aspx.cs" Inherits="HS_Communications_Website.Admin.updateHeader" %>
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
			<h4><strong class="colhead">Update Header Logo</strong></h4>
		</div>
       
        
                <asp:Panel ID="Panel1" runat="server" CssClass="alert-box" Visible="False" ><h4 style="text-align: center">
                   Header Successfully Updated!</h4></asp:Panel>
                  <asp:Panel ID="ErrorPanel" runat="server" CssClass="alert-box alert" Visible="False"><h4>
                    <asp:Label ID="ErrorLabel" ForeColor="white" runat="server" Text="Label"></asp:Label></h4></asp:Panel>
             	<div class="nine columns centered">

                     <asp:FileUpload ID="FileUpload1" runat="server" />
                     <p>Note: Only .Png File extension is accepted to be uploaded.</p>
                     <asp:Button ID="Button1" runat="server" Text="Upload Now" OnClick="Button1_Click" CssClass="buttonn"/>
                     
                     
                     

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
