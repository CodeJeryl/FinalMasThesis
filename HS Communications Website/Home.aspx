<%@ Page Title="" Language="C#" MasterPageFile="~/My.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="HS_Communications_Website.Home" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    
    <!--Start of Zopim Live Chat Script-->
<script type="text/javascript">
    var ua = navigator.userAgent.toLowerCase(),
platform = navigator.platform.toLowerCase();
    platformName = ua.match(/ip(?:ad|od|hone)/) ? 'ios' : (ua.match(/(?:webos|android)/) || platform.match(/mac|win|linux/) || ['other'])[0],
    isMobile = /ios|android|webos/.test(platformName);
    if (!isMobile) {
        window.$zopim || (function (d, s) {
            var z = $zopim = function (c) { z._.push(c) }, $ = z.s =
                d.createElement(s), e = d.getElementsByTagName(s)[0]; z.set = function (o) {
                    z.set.
                        _.push(o)
                }; z._ = []; z.set._ = []; $.async = !0; $.setAttribute("charset", "utf-8");
            $.src = "//v2.zopim.com/?2qcBd7ZzrEoXc34m8qUMZBgGcPYQAkGl"; z.t = +new Date; $.
                type = "text/javascript"; e.parentNode.insertBefore($, e)
        })(document, "script");
    }
    
</script>
    
     
<!--End of Zopim Live Chat Script-->
    

   <%-- <SCRIPT language=Javascript>
      <!--
    function isNumberKey(evt) {
        var charCode = (evt.which) ? evt.which : event.keyCode
        if (charCode > 31 && (charCode < 48 || charCode > 57))
            return false;

        return true;
    }
    //-->
   </SCRIPT>--%>
    
    <style>
        h3
        {
            color: #003399 !important;
            
        }

        p
         {
            font-weight: 500 !important;
        }
        label {
            color: black !important;
        }
        em {
            color:  #3399cc !important;
        }
          </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     
    <div class="row" style="margin-left:26% !important">
      
    <div class="large-9 large-offset-3 columns" >
    <h1><img src="img/etc/head.png" /> </h1> 
    </div>

  </div>
    <br/> <br/> <br/>
    <div class="row" style="margin-left:26% !important" >
    
       
    <div class="large-9 columns large-offset-3 columns" >
        <h3>
            Welcome Letranites!
        </h3>
       
        <p>Encoding for summer class Grades are still in progress. Please wait for further announcement.</p>
        <p>Grades for SY. 2014-2015 are now available for viewing. Log-in using your Student ID and Password <br />
      Activate your account now to get your system generated password.   <span style="color: red !important"> <a href="#" data-reveal-id="ActivateModal" style="color: #000080">Activate now!</a></span><br />
       </p>
        <br />

    </div>
        </div> 
      
     <div class="row" style="margin-left:26% !important">
    
       
    <div class="large-9 columns large-offset-3 columns" >
       
     <h3>
         Log-in
     </h3>
        <div class="panel" runat="server" id="errorPanel" style="width: 70%; text-align: center; margin-left: 10%">
 <strong> <asp:Label ID="ErrorLbl" runat="server" Text="" ForeColor="darkblue"  ></asp:Label></strong>
</div>
         <div class="row">
   <div class="large-5 columns">  <label>Student ID <asp:TextBox ID="TextBox1" runat="server" onkeypress="return isNumberKey(event)"></asp:TextBox> </label> </div>    
        <div class="large-5 columns"> <label>Password <asp:TextBox ID="TextBox2" runat="server" TextMode="Password"> </asp:TextBox> </label> </div>    
        <div class="large-2 columns">
     <span> <asp:Button ID="Button1" runat="server" Text="Log in" CssClass="button radius" OnClick="Button1_Click" /></span> 
          </div>

            
        </div>
    </div></div>

         <div class="row" style="margin-left:26% !important">
        
    <div class="large-6 columns large-offset-6 columns" >
       
      <div>
      <span style="font-size: 12px"><em> Account not yet Activated? <a href="#" data-reveal-id="ActivateModal">Click Here</a></em> </span> &nbsp; •&nbsp;
        <span style="font-size: 12px"> <em>Forgot Password? <a href="#" data-reveal-id="forgotDiv">Click Here</a></em> </span></div>  
           <%--     <br/> <br/> <br/>
    <p style="color:orange !important; font-size: 12px">*due to high volume of students activating their account,
          there might be a delay in sending your password to your email. If you did not receive any email from us, kindly use the
              <a href="#" data-reveal-id="forgotDiv"> Forgot password</a> to resend your password to your email. Thank you! </p>--%>
      
    </div>
             

    </div>  

    
<%--      <div class="row" style="background-color: whitesmoke; position: relative; top:15px;height: 23pt">
        <div class="large-12 columns text-center" style="padding: 7px">
          &#169; Letran Bataan 2015
        </div>
          </div>
    --%>
    

<div id="ActivateModal" class="reveal-modal small" >
    <asp:UpdatePanel ID="UpdatePanel2" runat="server">
        <ContentTemplate>
  <h2>Account Activation</h2>
<div class="panel" runat="server" id="errorPanel1">
  <asp:Label ID="Label1" runat="server" Text="" ForeColor="Black"></asp:Label>
</div>
            <%--<asp:ValidationSummary ID="ValidationSummary1" runat="server" ValidationGroup="d" />--%>
      <label>Student Number</label>
      <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Required." ControlToValidate="studNumberTxtbox" ValidationGroup="d" ForeColor="red" Display="Dynamic"></asp:RequiredFieldValidator>
    <asp:TextBox ID="studNumberTxtbox" runat="server" onkeypress="return isNumberKey(event)"></asp:TextBox>
            <label>Middle Name + First Character of Last Name.   Ex. dela cruzL</label>
      <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Required." ControlToValidate="midActivateTxtbox" ValidationGroup="d" ForeColor="red" Display="Dynamic"></asp:RequiredFieldValidator>
          <asp:TextBox ID="midActivateTxtbox" runat="server"></asp:TextBox> 
             <label>Email Address </label>  <span style="font-size: 11px">Important: Use a valid and working email address. Your password will be sent to your email. </span>
     <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Required." ControlToValidate="emailAddTxtb" ValidationGroup="d" ForeColor="red" Display="Dynamic"></asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Please Input Valid Email Address" ControlToValidate="emailAddTxtb" ValidationGroup="d" ForeColor="red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" Display="Dynamic"></asp:RegularExpressionValidator>
             <asp:TextBox ID="emailAddTxtb" runat="server"></asp:TextBox>
    <asp:Button ID="Button2" runat="server"  Text="Activate Account" CssClass="button right" OnClick="Button2_Click" ValidationGroup="d" />
  <a class="close-reveal-modal">&#215;</a>
            </ContentTemplate>
       </asp:UpdatePanel>
</div>
    
    
<div id="forgotDiv" class="reveal-modal small">
    <asp:UpdatePanel ID="UpdatePanel3" runat="server">
        <ContentTemplate>
  <h2>Forgot Password</h2>
<div class="panel" runat="server" id="errorPanelForgot">
  <asp:Label ID="Label2" runat="server" Text="" ForeColor="Black"></asp:Label>
</div>
      <label>Student Number</label><asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Required." ValidationGroup="i" Display="Dynamic" ForeColor="red" ControlToValidate="studTxt3"></asp:RequiredFieldValidator>
      <asp:TextBox ID="studTxt3" runat="server" onkeypress="return isNumberKey(event)"></asp:TextBox>
    <label>Middle Name + First Character of Last Name.   Ex. dela cruzL</label><asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="Required." ValidationGroup="i" ForeColor="red" Display="Dynamic" ControlToValidate="midnameTxtbox"></asp:RequiredFieldValidator>
      <asp:TextBox ID="midnameTxtbox" runat="server" TextMode="SingleLine"></asp:TextBox>
    <asp:Button ID="Button3" runat="server" Text="Retrieve Password"  CssClass="button right" OnClick="forgot1_Click" ValidationGroup="i" />
       
  <a class="close-reveal-modal">&#215;</a>
            </ContentTemplate>
       </asp:UpdatePanel>
</div>
  

</asp:Content>

