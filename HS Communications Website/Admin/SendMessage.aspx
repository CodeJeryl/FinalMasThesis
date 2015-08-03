<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMaster.Master" AutoEventWireup="true" CodeBehind="SendMessage.aspx.cs" Inherits="HS_Communications_Website.Admin.SendMessage" %>
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
			<h4><strong class="colhead">Send Message</strong></h4>
		</div>
       
        
                <asp:Panel ID="Panel1" runat="server" CssClass="alert-box" Visible="False" ><h4 style="text-align: center">
                   Message Successfully Sent!</h4></asp:Panel>
                  <asp:Panel ID="ErrorPanel" runat="server" CssClass="alert-box alert" Visible="False"><h4>
                    <asp:Label ID="ErrorLabel" ForeColor="white" runat="server" Text="Label"></asp:Label></h4></asp:Panel>
             	<div class="nine columns centered">
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
         <ContentTemplate>
          
            Send to: <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged" Width="60%">
               <asp:ListItem Value="all">ALL</asp:ListItem>
               <asp:ListItem Value="students">STUDENTS</asp:ListItem>
               <asp:ListItem Value="parents">PARENTS</asp:ListItem>
               <asp:ListItem Value="faculty">FACULTY</asp:ListItem>
               </asp:DropDownList>  &nbsp;&nbsp;&nbsp;   <asp:CheckBox ID="CheckBox1" runat="server" Text="Send to specific section" OnCheckedChanged="CheckBox1_CheckedChanged" AutoPostBack="True" Visible="False" /> &nbsp;&nbsp;&nbsp; 
             <asp:Label ID="seclbl" runat="server" Text="Section: "></asp:Label> <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="SqlDataSource1" DataTextField="Sectno" DataValueField="Sectno" Visible="False"></asp:DropDownList> 
              
               <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:HsDbConnectionString %>" SelectCommand="SELECT DISTINCT [Sectno] FROM [Section] ORDER BY [Sectno]"></asp:SqlDataSource>
                 </ContentTemplate>
            </asp:UpdatePanel>
     
                    <p> Title: <asp:TextBox ID="titleTxtbox" runat="server"></asp:TextBox></p>
                  <p> Message: <asp:TextBox ID="messageTxtbox" runat="server" TextMode="MultiLine"></asp:TextBox></p>
          
                <span style="margin: 80%"> <asp:Button ID="Button1" runat="server" Text="Send Message" CssClass="buttonn" OnClick="Button1_Click"/></span>
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
