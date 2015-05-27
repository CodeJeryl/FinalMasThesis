<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMaster.Master" AutoEventWireup="true" CodeBehind="AddStudents.aspx.cs" Inherits="HS_Communications_Website.Admin.AddStudents" %>
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
			<h4><strong class="colhead">Add students</strong></h4>
		</div>
        <div class="colp">
            
                  <asp:Panel ID="Panel1" runat="server" CssClass="alert-box" Visible="False" ><h4 style="text-align: center">
                    <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label></h4></asp:Panel>
                  <asp:Panel ID="ErrorPanel" runat="server" CssClass="alert-box alert" Visible="False"><h4>
                    <asp:Label ID="ErrorLabel" ForeColor="white" runat="server" Text="Label"></asp:Label></h4></asp:Panel>
                
                <br />
                    <br />
            Note: .xls/.xlsx file format only
                <div class="three columns">
                  
                    <asp:FileUpload ID="FileUpload1" runat="server" />
                        </div>
                       <div class="three columns">

              <span >
                    <asp:Button ID="Button1" runat="server" Text="Submit" CssClass="buttonn" OnClick="Button1_Click"/></span>
           </div>
                
              <div class="six columns">
                  &nbsp;
                  
               </div>
               </div>
        
	</div><!-- end main content-->

	<!--
	<div class="four columns">
      
	</div> -->
</div>
<div class="hr">
</div><div class="hr">
</div><div class="hr">
</div><div class="hr">
</div>
    
<!-- JAVASCRIPTS 
================================================== -->
<!-- Javascript files placed here for faster loading -->
<script src="../javascripts/formvalidation.js"></script>
<script src="../javascripts/jquery.cycle.js"></script>
<script src="../javascripts/app.js"></script>
<script src="../javascripts/scrolltotop.js"></script>
</asp:Content>
