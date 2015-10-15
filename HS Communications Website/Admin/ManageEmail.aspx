<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMaster.Master" AutoEventWireup="true" CodeBehind="ManageEmail.aspx.cs" Inherits="HS_Communications_Website.Admin.ManageEmail" %>

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
            <asp:Panel ID="Panel1" runat="server" CssClass="alert-box" Visible="False">
                <h4 style="text-align: center">
                      <asp:Label ID="errorLabel" runat="server" Text="Label"></asp:Label></h4>
            </asp:Panel>
            <asp:Panel ID="ErrorPanel" runat="server" CssClass="alert-box alert" Visible="False">
                <h4>
                    <asp:Label ID="Label2" ForeColor="white" runat="server" Text=""></asp:Label></h4>
            </asp:Panel>

<%--             <asp:Panel ID="Panel1" runat="server">
                         
                        </asp:Panel>--%>

            <div class="six columns centered">


                <div class="row">
                    <div class="large-6 columns">
                        <span class="label">Student ID: </span>
                        <asp:TextBox ID="StudTxt" runat="server" OnTextChanged="StudTxt_TextChanged" ValidationGroup="s"></asp:TextBox>
                        <br />
                        <span class="label">Middle + 1st char of last name: </span>
                        <asp:TextBox ID="TextBox1" runat="server" ValidationGroup="s"></asp:TextBox>
                        <br />
                        <span class="label">Email Add: </span>
                        <asp:TextBox ID="StudEmailTxt" runat="server" ValidationGroup="s"></asp:TextBox><asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Input Valid EmailAddress!!!" ValidationGroup="s" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ControlToValidate="StudEmailTxt"></asp:RegularExpressionValidator><br />
                        <asp:Button ID="Button1" runat="server" Text="Update" CssClass="button" OnClick="update_click" ValidationGroup="s" />
                    </div>
                   
                </div>


            </div>
        </div>
        <!-- end main content-->

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

