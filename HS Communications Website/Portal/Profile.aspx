<%@ Page Title="" Language="C#" MasterPageFile="~/Portal/PortMaster.Master" AutoEventWireup="true" CodeBehind="Profile.aspx.cs" Inherits="HS_Communications_Website.Portal.Profile" %>

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
			<h4><strong class="colhead">Student Information</strong></h4>
		</div>
       
        
            <asp:Panel ID="Panel1" runat="server" CssClass="info-box" Visible="False">
                <h2 style="text-align: center">Profile Update Successful.</h2>
            </asp:Panel>
            <asp:Panel ID="ErrorPanel" runat="server" CssClass="warning-box" Visible="False">
                <h2>
                    <asp:Label ID="ErrorLabel" runat="server" Text="Label"></asp:Label></h2>
            </asp:Panel>


            <asp:Panel ID="Panel2" runat="server" Enabled="False">
                <div class="four columns">
                    <p>Last Name: 
                        <asp:TextBox ID="lastnameTxtbox" runat="server" Enabled="False"></asp:TextBox>
                    </p>
                </div>
                <div class="four columns">

                    <p>First Name: 
                        <asp:TextBox ID="firstnameTxtbox" runat="server" Enabled="False"></asp:TextBox></p>
                </div>
                <div class="four columns">
                    <p>Middle Name: 
                        <asp:TextBox ID="midnametxtbox" runat="server" Enabled="False"></asp:TextBox></p>
                </div>

                <div class="six columns">
                    <p>School Last Attended: 
                        <asp:TextBox ID="lastattendTxtbox" runat="server"></asp:TextBox></p>
                </div>
                <div class="six columns">
                    <p>School Address: 
                        <asp:TextBox ID="schoolAddTxtbox" runat="server"></asp:TextBox></p>
                </div>
        </asp:Panel>
                 <div class="six columns">
                     <p>House No., Street<asp:TextBox ID="houseAddTxtbox" runat="server"></asp:TextBox></p>
                 </div>

        <div class="six columns">
            <p>Barangay  
                <asp:TextBox ID="brgyAddTxtbox" runat="server"></asp:TextBox></p>
        </div>

        <div class="six columns">
            <p>Town
                <asp:TextBox ID="townAddTxtbox" runat="server"></asp:TextBox></p>
        </div>

        <div class="six columns">
            <p>Province
                <asp:TextBox ID="provinceAddTxtbox" runat="server"></asp:TextBox></p>
        </div>
        <div class="four columns">
            <p>Date of Birth: (MM/DD/YYYY)
                <asp:TextBox ID="dob" runat="server"></asp:TextBox>
            </p>
        </div>
        <div class="four columns">

            <p>Place of Birth 
                <asp:TextBox ID="placeBtxtbox" runat="server"></asp:TextBox></p>
        </div>
        <div class="four columns">
            <p>
                Gender:
                <asp:RadioButtonList ID="RadioButtonList1" runat="server" RepeatDirection="Horizontal">
                    <asp:ListItem>M</asp:ListItem>
                    <asp:ListItem>F</asp:ListItem>
                </asp:RadioButtonList>
            </p>
        </div>
            <asp:Panel ID="studPanel" runat="server">
        <div class="six columns">
            <p>Mobile No. :
                <asp:TextBox ID="mobileTxtbox" runat="server"></asp:TextBox></p>
        </div>

        <div class="six columns">
            <p>Email Address :
                <asp:TextBox ID="emailAddTxtbox" runat="server"></asp:TextBox></p>

        </div>
                </asp:Panel>
        <br />
        <span style="margin: 80%">
            <asp:Button ID="studentBtn" runat="server" Text="Update Profile" CssClass="buttonn" OnClick="studentBtn_Click" Visible="False" /></span><br />

        <asp:Panel ID="parentsPanel" runat="server" Enabled="False">
            <h2>Parent/Guardian Information</h2>
            <div class="four columns">
                <p>Mothers's Name: 
                    <asp:TextBox ID="MnameTxtbox" runat="server"></asp:TextBox>
                </p>
            </div>
            <div class="four columns">

                <p>Tel. no: 
                    <asp:TextBox ID="MtelNoTxtbox" runat="server"></asp:TextBox></p>
            </div>
            <div class="four columns">
                <p>Mobile no.: 
                    <asp:TextBox ID="MMobileTxtbox" runat="server"></asp:TextBox></p>
            </div>

            <div class="six columns">
                <p>Occupation: 
                    <asp:TextBox ID="MoccuTxtbox" runat="server"></asp:TextBox></p>

            </div>
            <div class="six columns">
                <p>Address: 
                    <asp:TextBox ID="MaddressTxtbox" runat="server" TextMode="MultiLine"></asp:TextBox></p>

            </div>


            <div class="four columns">
                <p>Fathers's Name: 
                    <asp:TextBox ID="FnameTxtbox" runat="server"></asp:TextBox>
                </p>
            </div>
            <div class="four columns">

                <p>Tel. no: 
                    <asp:TextBox ID="FtelTxtbox" runat="server"></asp:TextBox></p>
            </div>
            <div class="four columns">
                <p>Mobile no.: 
                    <asp:TextBox ID="FmobTxtbox" runat="server"></asp:TextBox></p>
            </div>

            <div class="six columns">
                <p>Occupation: 
                    <asp:TextBox ID="FoccuTxtbox" runat="server"></asp:TextBox></p>

            </div>
            <div class="six columns">
                <p>Address: 
                    <asp:TextBox ID="FaddressTxtbox" runat="server" TextMode="MultiLine"></asp:TextBox></p>

            </div>
            
             <div class="four columns">
                <p>Guardian's Name: 
                    <asp:TextBox ID="GnameTxtbox" runat="server"></asp:TextBox>
                </p>
            </div>
            <div class="four columns">

                <p>Tel. no: 
                    <asp:TextBox ID="GtelnoTxtbox" runat="server"></asp:TextBox></p>
            </div>
            <div class="four columns">
                <p>Mobile no.: 
                    <asp:TextBox ID="GmobileTxtbox" runat="server"></asp:TextBox></p>
            </div>

            <div class="six columns">
                <p>Occupation: 
                    <asp:TextBox ID="GoccuTxtbox" runat="server"></asp:TextBox></p>

            </div>
            <div class="six columns">
                <p>Address: 
                    <asp:TextBox ID="GaddressTxtbox" runat="server" TextMode="MultiLine"></asp:TextBox></p>

            </div>
            

            <span style="margin: 80%">
                <asp:Button ID="parentBtn" runat="server" Text="Update Profile" CssClass="buttonn" OnClick="parentBtn_Click" Visible="False" /></span>
        </asp:Panel>


        
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
