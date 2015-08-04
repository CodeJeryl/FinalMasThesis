<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMaster.Master" AutoEventWireup="true" CodeBehind="ManageDashboard.aspx.cs" Inherits="HS_Communications_Website.Admin.ManageDashboard" %>

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
                <h4><strong class="colhead">Generate Dashboard results</strong></h4>
            </div>


            <div class="six columns centered" style="min-height: 300px;">
                   <asp:Panel ID="Panel1" runat="server" CssClass="alert-box" Visible="False" ><h4 style="text-align: center">
                 Dashboard results successfully updated.</h4></asp:Panel>
                  <asp:Panel ID="ErrorPanel" runat="server" CssClass="alert-box alert" Visible="false"><h4>
                    <asp:Label ID="ErrorLabel" ForeColor="white" runat="server" Text="Label"></asp:Label></h4></asp:Panel>
                
                <p>
                    School Year:
                    <asp:DropDownList ID="DropDownList2" runat="server">
                        <asp:ListItem Value="511">2011-2012</asp:ListItem>
                        <asp:ListItem Value="512">2012-2013</asp:ListItem>
                        <asp:ListItem Value="513">2013-2014</asp:ListItem>
                        <asp:ListItem Value="514">2014-2015</asp:ListItem>
                      </asp:DropDownList>
                </p>
                <span style="position: relative; left: 60%">
                 <asp:Button ID="Button1" runat="server" Text="Update Dashboard" CssClass="buttonn" OnClick="Button1_Click" /></span>
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
