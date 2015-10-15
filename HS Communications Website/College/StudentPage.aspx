<%@ Page Title="" Language="C#" MasterPageFile="~/College/College.Master" AutoEventWireup="true" CodeBehind="StudentPage.aspx.cs" Inherits="HS_Communications_Website.College.StudentPage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
    <!-- Header and Nav -->

    <div class="row" style="margin-left:20% !important">
        <div class="large-8 columns">
            <h1>
                <img src="../img/etc/head.png" /></h1>

        </div>
        <div class="large-4 columns">
            <ul class="inline-list right">
                <li></li>
                <li></li>
                <li><a href="#" class="small button" data-reveal-id="changeee">Change Password</a></li>
                <li><a href="#">
                    <h5>
                        <asp:LoginStatus ID="LoginStatus1" runat="server" OnLoggingOut="LoginStatus1_LoggingOut" />
                    </h5>
                </a></li>
            </ul>
        </div>
    </div>

    <!-- End Header and Nav  onclick="myFunc()"-->



    <div class="row" style="margin-left:20% !important">

        <!-- Main Content Section -->
        <!-- This has been source ordered to come first in the markup (and on small devices) but to be to the right of the nav on larger screens -->
        <div class="large-9 push-3 columns">

            <p>
                <asp:Label ID="Label111" runat="server" Text=" Name: " Font-Bold="True" ForeColor="#99ccff"></asp:Label>&nbsp;
                <asp:Label ID="lastNameLbl" runat="server" Text="" Font-Bold="True"></asp:Label>,&nbsp;
                <asp:Label ID="FirstNameLbl" runat="server" Text="" Font-Bold="True"></asp:Label>&nbsp;
                <asp:Label ID="MiddleInitLbl" runat="server" Text="" Font-Bold="True"></asp:Label>. &nbsp;
             &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;  <asp:Label ID="Label3" runat="server" Text="Course: " Font-Bold="True" ForeColor="#99ccff"></asp:Label>&nbsp;<asp:Label ID="courseLbl" runat="server" Text=""></asp:Label>
            </p>
            <p>
                 <asp:Label ID="Label1" runat="server" Text="Year Level: " Font-Bold="True" ForeColor="#99ccff"></asp:Label>  &nbsp;
                <asp:Label ID="yearlbl" runat="server" Text="" Font-Bold="True"> </asp:Label>
                &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;  &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;
             <asp:Label ID="Label4" runat="server" Text="Period: " Font-Bold="True" ForeColor="#99ccff"></asp:Label> &nbsp;<span style="position: absolute"> <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged" Font-Bold="True">
                    <asp:ListItem Value="1">First Semester</asp:ListItem>
                    <asp:ListItem Value="2">Second Semester</asp:ListItem>
                              <asp:ListItem Value="3">Summer</asp:ListItem>
                         </asp:DropDownList></span>
                
            </p>
            <br />

            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:SqlConnection %>" SelectCommand="SELECT [Sub Code] AS Sub_Code, [Sub Description] AS Sub_Description, [Grade], [Units] FROM [GradeView] WHERE (([period] = @period) AND ([studno] = @studno))">
                <SelectParameters>
                    <asp:SessionParameter Name="period" SessionField="prd" Type="String" />
                    <asp:SessionParameter Name="studno" SessionField="stud" Type="String" />
                </SelectParameters>
            </asp:SqlDataSource>

            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="Sub_Code" DataSourceID="SqlDataSource1" ShowHeaderWhenEmpty="True" EmptyDataText="No Grades Available.">
                <Columns>
                    <asp:BoundField DataField="Sub_Code" HeaderText="Subject Code" ReadOnly="True" SortExpression="Sub_Code" />
                    <asp:BoundField DataField="Sub_Description" HeaderText="Subject Description" SortExpression="Sub_Description" />
                    <asp:BoundField DataField="Grade" HeaderText="Grade" SortExpression="Grade" />
                    <asp:BoundField DataField="Units" HeaderText="Units" SortExpression="Units" />
                </Columns>
            </asp:GridView>
            <br />
            
          
            <p style="color: #99ccff">Note: Please bring your clearance upon enrolment. Thank you! </p>
            <asp:Button ID="Button1" runat="server" Text="Print Grades" CssClass="button" OnClick="print1_Click" Visible="False" />
            
                <asp:Button ID="Button2" runat="server" Text="Print Grades Report" CssClass="button" OnClick="Button2_Click" Visible="False" />

        </div>


        <!-- Nav Sidebar -->
        <!-- This is source ordered to be pulled to the left on larger screens -->
        <div class="large-3 pull-9 columns">

            <p>
                </p>
            
          <%--  
            <ul class="side-nav">
                <li><a href="#">Section 1</a></li>
                <li><a href="#">Section 2</a></li>
                <li><a href="#">Section 3</a></li>
                <li><a href="#">Section 4</a></li>
                <li><a href="#">Section 5</a></li>
                <li><a href="#">Section 6</a></li>
            </ul>--%> <br/> <br/>
          <a href="http://www.letranbataan.edu.ph/Media/ArribaRadio/Home.aspx" target="_blank">  <img src="../images/College/listen.jpg" style="border: thin solid #000000;" /></a>


        </div>

    </div>

    


    <!-- Footer -->

    <footer class="row" style="margin-left:20% !important">
        <div class="large-12 columns">
            <hr />
            <div class="row">
                <div class="large-6 columns">
                    <p style="color: #FFFFFF">© Letran Bataan 2015</p>
                </div>
                <div class="large-6 columns">
                    <ul class="inline-list right">
                        <li><a href="http://www.letranbataan.edu.ph" target="_blank">Letran Official Website</a></li>
                        </ul>
                </div>
            </div>
        </div>
    </footer>

    <div id="changeee" class="reveal-modal small">
        <asp:UpdatePanel ID="UpdatePanel3" runat="server">
            <ContentTemplate>
                <h3>Change Password</h3>
                <div class="panel" runat="server" id="errorPanelChange">
                    <asp:Label ID="Label2" runat="server" Text="" ForeColor="Black"></asp:Label>
                </div>
                <label>Old Password</label>
                <asp:TextBox ID="oldpassTxtbox" runat="server" ValidationGroup="a" TextMode="Password"></asp:TextBox>
                <label>New Password</label>
                <asp:TextBox ID="newpassTxtbox" runat="server" TextMode="Password"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*" ControlToValidate="newpassTxtbox" ValidationGroup="a"></asp:RequiredFieldValidator>
                <asp:Button ID="ChangepassBtn" runat="server" Text="Change Password" CssClass="button right" OnClick="ChangePass_Click" ValidationGroup="a" />

                <a class="close-reveal-modal">&#215;</a>
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>

</asp:Content>
