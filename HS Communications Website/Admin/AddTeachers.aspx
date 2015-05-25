<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMaster.Master" AutoEventWireup="true" CodeBehind="AddTeachers.aspx.cs" Inherits="HS_Communications_Website.Admin.AddTeachers" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="hr">
</div>
<!-- CONTENT 
================================================== -->
<div class="row">
    <!-- MAIN CONTENT-->
      
            
                <asp:Panel ID="Panel1" runat="server" CssClass="info-box" Visible="False"><h2 style="text-align: center">
                    <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label></h2></asp:Panel>
                  <asp:Panel ID="ErrorPanel" runat="server" CssClass="warning-box" Visible="False"><h2>
                    <asp:Label ID="ErrorLabel" runat="server" Text="Label"></asp:Label></h2></asp:Panel>
                
     <div class="six columns centered">
         <div class="sectiontitle">
			<h4><strong class="colhead">Register Faculty Member</strong></h4>
		</div>
         
    <%-- <asp:UpdatePanel ID="UpdatePanel1" runat="server">
         <ContentTemplate>
           <p>Send to: <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
               <asp:ListItem Value="all">ALL</asp:ListItem>
               <asp:ListItem Value="students">STUDENTS</asp:ListItem>
               <asp:ListItem Value="parents">PARENTS</asp:ListItem>
               <asp:ListItem Value="faculty">FACULTY</asp:ListItem>
               </asp:DropDownList> &nbsp;&nbsp;&nbsp; Section: <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="SqlDataSource1" DataTextField="Sectno" DataValueField="Sectno"></asp:DropDownList>
               <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:HsDbConnectionString %>" SelectCommand="SELECT DISTINCT [Sectno] FROM [Section] ORDER BY [Sectno]"></asp:SqlDataSource>
                </p> </ContentTemplate>
     </asp:UpdatePanel>--%>
        
                   Employee ID Number: <asp:TextBox ID="empIDtxtbox" runat="server"></asp:TextBox>
                 Full Name: <asp:TextBox ID="nameTxtbox" runat="server" ></asp:TextBox>
               
               Password: <asp:TextBox ID="passwordTxtbox" runat="server" TextMode="Password"></asp:TextBox>
                
     User Level: <asp:DropDownList ID="DropDownList1" runat="server">
               <asp:ListItem Value="Teacher">Teacher</asp:ListItem>
               <asp:ListItem Value="Principal">Principal</asp:ListItem>
               </asp:DropDownList>
                &nbsp;&nbsp;&nbsp;&nbsp;
          <asp:CheckBox ID="CheckBox1" runat="server" Visible="False" /><%-- Check this if Admin Account--%>
               <br/> <span style="margin: 70%">
               <asp:Button ID="Button1" runat="server" Text="Add Faculty" CssClass="buttonn" OnClick="Button1_Click"/>
                </span>
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
