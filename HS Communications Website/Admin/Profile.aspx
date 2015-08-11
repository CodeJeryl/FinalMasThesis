<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMaster.Master" AutoEventWireup="true" CodeBehind="Profile.aspx.cs" Inherits="HS_Communications_Website.Admin.Profile" %>
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
      
            <asp:Panel ID="Panel1" runat="server" CssClass="alert-box" Visible="False">
                <h2 style="text-align: center">Profile Update Successful.</h2>
            </asp:Panel>
            <asp:Panel ID="ErrorPanel" runat="server" CssClass="alert-box alert" Visible="False"><h4>
                    <asp:Label ID="ErrorLabel" ForeColor="white" runat="server" Text="Label"></asp:Label></h4>
            </asp:Panel>

        <div class="row">
            <div class="six columns">    Search Student ID: <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox></div>
               <div class="six columns"> <asp:Button ID="Button1" runat="server" Text="Search" CssClass="buttonn" OnClick="Button1_Click"/> &nbsp; &nbsp; &nbsp; &nbsp;  <asp:Button ID="resetBtn" runat="server" Text="Reset" CssClass="buttonn" OnClick="resetBtn_Click"/></div>
                    </div>



            <asp:Panel ID="Panel2" runat="server">
                <div class="four columns">
                    <p>Last Name:  <span style="color: red">*</span>
                        <asp:TextBox ID="lastnameTxtbox" runat="server"></asp:TextBox>
                    </p>
                </div>
                <div class="four columns">
                    <p>First Name: <span style="color: red">*</span>
                        &nbsp;<asp:TextBox ID="firstnameTxtbox" runat="server"></asp:TextBox>
                    </p>
                </div>
                <div class="four columns">
                    <p>Middle Name: <span style="color: red">*</span>
                        <asp:TextBox ID="midnametxtbox" runat="server"></asp:TextBox>
                    </p>
                </div>

                <div class="six columns">
                    <p>School Last Attended: 
                        <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource1" DataTextField="school" DataValueField="schAddress" Height="40px" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged1" Width="272px" AppendDataBoundItems="True">
                        <asp:ListItem Text="Choose School" Value="0" />
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:HsDbConnectionString %>" SelectCommand="SELECT [school], [schAddress] FROM [schoolTbl] ORDER BY [school]"></asp:SqlDataSource>
                       </p>
                </div>
                <div class="six columns">
                    <p>School Address: <span style="color: red">*</span>
                        <asp:TextBox ID="schoolAddTxtbox" runat="server" ReadOnly="True"></asp:TextBox></p>
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
            <p>Town <span style="color: red">*</span>
                <asp:TextBox ID="townAddTxtbox" runat="server"></asp:TextBox></p>
        </div>

        <div class="six columns">
            <p>Province <span style="color: red">*</span>
                <asp:TextBox ID="provinceAddTxtbox" runat="server"></asp:TextBox></p>
        </div>
        <div class="four columns">
            <p>Date of Birth: (MM/DD/YYYY)
               <asp:TextBox ID="dob" runat="server" TextMode="Date"></asp:TextBox>
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
            <p>Email Address : <span style="color: red">*</span>
                <asp:TextBox ID="emailAddTxtbox" runat="server"></asp:TextBox></p>

        </div>
                </asp:Panel>
      

        <asp:Panel ID="parentsPanel" runat="server">
          
           <div class="twelve columns">         <br /><br /><h2> Parent/Guardian Information</h2></div>
            <div class="four columns">        
                <p>Mothers's Name: <span style="color: red">*</span>
                    <asp:TextBox ID="MnameTxtbox" runat="server"></asp:TextBox>
                </p>
            </div>
            <div class="four columns">

                <p>Tel. no:
                    <asp:TextBox ID="MtelNoTxtbox" runat="server"></asp:TextBox></p>
            </div>
            <div class="four columns">
                <p>Mobile no.: <span style="color: red">*</span>
                    <asp:TextBox ID="MMobileTxtbox" runat="server"></asp:TextBox></p>
            </div>

            <div class="six columns">
                <p>Occupation:
                    <asp:TextBox ID="MoccuTxtbox" runat="server"></asp:TextBox></p>

            </div>
            <div class="six columns">
                <p>Address: <span style="color: red">*</span>
                    <asp:TextBox ID="MaddressTxtbox" runat="server" TextMode="MultiLine"></asp:TextBox></p>

            </div>


            <div class="four columns">
                <p>Fathers's Name: <span style="color: red">*</span>
                    <asp:TextBox ID="FnameTxtbox" runat="server"></asp:TextBox>
                </p>
            </div>
            <div class="four columns">

                <p>Tel. no: 
                    <asp:TextBox ID="FtelTxtbox" runat="server"></asp:TextBox></p>
            </div>
            <div class="four columns">
                <p>Mobile no.: <span style="color: red">*</span>
                    <asp:TextBox ID="FmobTxtbox" runat="server"></asp:TextBox></p>
            </div>

            <div class="six columns">
                <p>Occupation: 
                    <asp:TextBox ID="FoccuTxtbox" runat="server"></asp:TextBox></p>

            </div>
            <div class="six columns">
                <p>Address: <span style="color: red">*</span>
                    <asp:TextBox ID="FaddressTxtbox" runat="server" TextMode="MultiLine"></asp:TextBox></p>

            </div>
            
             <div class="four columns">
                <p>Guardian's Name: <span style="color: red">*</span>
                    <asp:TextBox ID="GnameTxtbox" runat="server"></asp:TextBox>
                </p>
            </div>
            <div class="four columns">

                <p>Tel. no: 
                    <asp:TextBox ID="GtelnoTxtbox" runat="server"></asp:TextBox></p>
            </div>
            <div class="four columns">
                <p>Mobile no.: <span style="color: red">*</span>
                    <asp:TextBox ID="GmobileTxtbox" runat="server"></asp:TextBox></p>
            </div>

            <div class="six columns">
                <p>Occupation: 
                    <asp:TextBox ID="GoccuTxtbox" runat="server"></asp:TextBox></p>

            </div>
            <div class="six columns">
                <p>Address: <span style="color: red">*</span>
                    <asp:TextBox ID="GaddressTxtbox" runat="server" TextMode="MultiLine"></asp:TextBox></p>

            </div>
            
            <div class="twelve columns">
            <span style="margin: 83%">
                <asp:Button ID="parentBtn" runat="server" Text="Update Profile" CssClass="buttonn" OnClick="parentBtn_Click" Enabled="False" /></span> </div>
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
