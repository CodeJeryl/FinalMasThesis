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
       
                   <asp:Panel ID="Panel1" runat="server" CssClass="alert-box" Visible="False" ><h4 style="text-align: center">
                   Message Successfully Sent!</h4></asp:Panel>
                
                 <asp:Panel ID="ErrorPanel" runat="server" CssClass="alert-box alert" Visible="False"><h4>
                    <asp:Label ID="ErrorLabel" ForeColor="white" runat="server" Text="Label"></asp:Label></h4></asp:Panel>
                <br />
                    <p style="font-size: 17px"> From: <asp:Label ID="fromLbl" runat="server" Text="Label"></asp:Label>
                            <span style="left: 70%;position: absolute"> Date and Time:<asp:Label ID="dateLbl" runat="server" Text="Label"></asp:Label></span>  
                    </p> <br />
                  
                <h4>Title: <asp:Label ID="titleLbl" runat="server" Text="Label"></asp:Label></h4>
                <br />
                  
                <h5>Message:</h5>
                <div style="background-color: #d7d7d7; padding: 15px">    <p ><asp:Label ID="bodyLbl" runat="server" Text="Label" Font-Size="Larger"></asp:Label></p> 
                </div> 
                <br/>
                <br/>

                Reply: <asp:TextBox ID="repTxtbox" runat="server" TextMode="MultiLine" Height="140px"></asp:TextBox> <br />
             <span style="left:87%; position: relative">       <asp:Button ID="Button1" runat="server" Text="Send Reply" CssClass="buttonn" OnClick="Button1_Click"/></span>
               
             <h5>   <a href="Inbox.aspx">Go back to Inbox</a></h5>
           
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
