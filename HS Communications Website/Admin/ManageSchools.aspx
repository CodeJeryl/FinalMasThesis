<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMaster.Master" AutoEventWireup="true" CodeBehind="ManageSchools.aspx.cs" Inherits="HS_Communications_Website.Admin.ManageSchools" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="hr"></div>
    <!-- CONTENT 
================================================== -->
    <div class="row">
        <!-- MAIN CONTENT-->
        <div class="twelve columns">
            <div class="sectiontitle">
                <h4><strong class="colhead">Manage School database</strong></h4>
            </div>


            <div class="six columns centered" style="min-height: 300px;">
                   <asp:Panel ID="Panel1" runat="server" CssClass="alert-box" Visible="False" ><h4 style="text-align: center">
                    School has been added successfully! </h4></asp:Panel>
                  <asp:Panel ID="ErrorPanel" runat="server" CssClass="alert-box alert" Visible="false"><h4>
                    <asp:Label ID="ErrorLabel" ForeColor="white" runat="server" Text="Label"></asp:Label></h4></asp:Panel>
                
                <p> School: <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*Required Field" ControlToValidate="TextBox1" ValidationGroup="s"></asp:RequiredFieldValidator>
                   <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox> 
                    
                </p>
                <p>
                    School Address: <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="*Required Field" ControlToValidate="TextBox2" ValidationGroup="s"></asp:RequiredFieldValidator>
                     <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
                </p>
                <span style="position: relative; left: 60%">
                 <asp:Button ID="Button1" runat="server" Text="Add Schools" CssClass="buttonn" OnClick="Button1_Click" ValidationGroup="s" /></span>
            </div>

           
        </div>


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
