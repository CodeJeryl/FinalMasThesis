<%@ Page Title="" Language="C#" MasterPageFile="~/Portal/PortMaster.Master" AutoEventWireup="true" CodeBehind="ReplyMessage.aspx.cs" Inherits="HS_Communications_Website.Portal.ReplyMessage" %>
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
			<h4><strong class="colhead">Message</strong></h4>
		</div>
       
                   <asp:Panel ID="Panel1" runat="server" CssClass="info-box" Visible="False"><h4 style="text-align: center">
                   Message Successfully Sent!</h4></asp:Panel>
                
                 <asp:Panel ID="ErrorPanel" runat="server" CssClass="warning-box" Visible="False"><h2>
                    <asp:Label ID="ErrorLabel" runat="server" Text="Label"></asp:Label></h2></asp:Panel>
                <br />
                    <p style="font-size: 17px"> From: <asp:Label ID="fromLbl" runat="server" Text="Label"></asp:Label> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        Date: <asp:Label ID="dateLbl" runat="server" Text="Label"></asp:Label>
                    </p> <br />
                    <br />
                <h2>Title: <asp:Label ID="titleLbl" runat="server" Text="Label"></asp:Label></h2>
                <br />
                    <br />

                    <p style="background-color: white"> <asp:Label ID="bodyLbl" runat="server" Text="Label" Font-Size="Larger"></asp:Label></p> <br/>

                
                <br/>
                <br/>
                <br/>
                
                Reply: <asp:TextBox ID="repTxtbox" runat="server" TextMode="MultiLine"></asp:TextBox>
                <asp:Button ID="Button1" runat="server" Text="Send Reply" CssClass="buttonn" OnClick="Button1_Click"/>
                <br /><br/>

                <a href="Phomepage.aspx">Go back to Inbox</a>
           

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
