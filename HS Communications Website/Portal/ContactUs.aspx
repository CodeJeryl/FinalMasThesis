<%@ Page Title="" Language="C#" MasterPageFile="~/Portal/PortMaster.Master" AutoEventWireup="true" CodeBehind="ContactUs.aspx.cs" Inherits="HS_Communications_Website.Portal.ContactUs" %>
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
	   
       
        
                 <asp:Panel ID="Panel1" runat="server" CssClass="alert-box" Visible="False" ><h4 style="text-align: center">
                   Message Successfully Sent! We will reply ASAP. Check your Inbox regularly. Thank you!</h4></asp:Panel>
                  <asp:Panel ID="ErrorPanel" runat="server" CssClass="alert-box alert" Visible="False"><h4>
                    <asp:Label ID="ErrorLabel" ForeColor="white" runat="server" Text="Label"></asp:Label></h4></asp:Panel>
        
        <div class="six columns">
         <div class="sectiontitle">
			<h4><strong class="colhead">Contact Us</strong></h4>
		</div>
            <div style="font-size: large">
            <strong style="color: black;">COLEGIO DE SAN JUAN DE LETRAN</strong> <br/>
            HIGH SCHOOL DEPARTMENT<br/><br/>
            <strong>Address:</strong> Dominican Avenue, Abucay, Bataan 2114</div>
            
            <br/>
           <h5>Contact Numbers</h5>
             
                 <ul style="font-size: large; list-style-type: disc; margin-left: 50px">
        <li>    Office of the Principal - (047) 237-9432 </li>
              <li>     Financial Affairs - (047) 237-9433 </li>
              <li>     Rector's Office - (047) 237-9370 local 101 </li>
              <li>     Admission's Office - (047) 237-9370 local 102 </li>
              <li>     Guidance Office - (047) 237-9370 local 106 </li>
               <li>    Library - (047) 237-9370 local 112 </li>
                    </ul>
                 </div>
      
        
        <div class="six columns">
             <div class="sectiontitle">
			<h4><strong class="colhead">Leave us a Message</strong></h4>
		</div>
         <br/>
            Subject: <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Required Field." ControlToValidate="TextBox1" ValidationGroup="s"></asp:RequiredFieldValidator>
             <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox> 
            Message:  <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Required Field." ControlToValidate="TextBox2" ValidationGroup="s"></asp:RequiredFieldValidator>
             <asp:TextBox ID="TextBox2" runat="server" TextMode="MultiLine" Height="150px"></asp:TextBox>
            
        <span style="padding-left: 300px">    <asp:Button ID="sendMsgBtn" runat="server" Text="Send Message" CssClass="buttonn" OnClick="sendMsgBtn_Click" ValidationGroup="s" /></span>
              
            
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
