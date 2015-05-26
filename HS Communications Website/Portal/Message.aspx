<%@ Page Title="" Language="C#" MasterPageFile="~/Portal/PortMaster.Master" AutoEventWireup="true" CodeBehind="Message.aspx.cs" Inherits="HS_Communications_Website.Portal.Message" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
  <div class="hr">
</div>
<!-- CONTENT 
================================================== -->
<div class="row">
    <!-- MAIN CONTENT-->
	<div class="twelve columns" style="color: black">
	    <div class="sectiontitle">
			<h4><strong class="colhead">Message</strong></h4>
		</div>
       
                 <asp:Panel ID="ErrorPanel" runat="server" CssClass="warning-box" Visible="False"><h2>
                    <asp:Label ID="ErrorLabel" runat="server" Text="Label"></asp:Label></h2></asp:Panel>
            
                    <p style="font-size: 17px"> From: <asp:Label ID="fromLbl" runat="server" Text="Label"></asp:Label>
                           <span style="left: 70%;position: absolute"> Date: <asp:Label ID="dateLbl" runat="server" Text="Label"></asp:Label></span>  
                    </p> <br />
                  
                <h4>Title: <asp:Label ID="titleLbl" runat="server" Text="Label"></asp:Label></h4>
                <br />
                   

              <h5>Message:</h5>
                <div style="background-color: #d7d7d7; padding: 15px">    <p >
                  <asp:Label ID="bodyLbl" runat="server" Text="Label" Font-Size="Larger"></asp:Label>
                                                                          </p> </div>
                    <br/>
                
                <br/>
                
               <h5><a href="Phomepage.aspx">Go back to Announcement Inbox</a></h5> 
               
          
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
