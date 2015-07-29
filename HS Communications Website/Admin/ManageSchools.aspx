<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMaster.Master" AutoEventWireup="true" CodeBehind="ManageSchools.aspx.cs" Inherits="HS_Communications_Website.Admin.ManageSchools" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="hr"></div>
    <!-- CONTENT 
================================================== -->
    <div class="row">
        <!-- MAIN CONTENT-->
        <div class="twelve columns">
            <div class="sectiontitle">
                <h4><strong class="colhead">Manage School database</strong></h4>
            </div>


            <div class="nine columns centered" style="min-height: 300px;">
                   <asp:Panel ID="Panel1" runat="server" CssClass="alert-box" Visible="False" ><h4 style="text-align: center">
                    School has been successfully added! </h4></asp:Panel>
                  <asp:Panel ID="ErrorPanel" runat="server" CssClass="alert-box alert" Visible="false"><h4>
                    <asp:Label ID="ErrorLabel" ForeColor="white" runat="server" Text="Label"></asp:Label></h4></asp:Panel>
                
                <p> School: <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*Required Field" ControlToValidate="TextBox1" ValidationGroup="s"></asp:RequiredFieldValidator>
                   <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox> 
                    
                </p>
                <p>
                    School Address: <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="*Required Field" ControlToValidate="TextBox2" ValidationGroup="s"></asp:RequiredFieldValidator>
                     <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
                </p>
                <span style="position: relative; left: 75%">
                 <asp:Button ID="Button1" runat="server" Text="Add Schools" CssClass="buttonn" OnClick="Button1_Click" ValidationGroup="s" /></span>
                
                <br/>
                <br/>

                <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource1" OnItemCommand="ListView1_ItemCommand" DataKeyNames="id">
                   
                   
                    <EditItemTemplate>
                        <tr style="background-color: #FFCC66;color: #000080;">
                            <td>
                                <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="Update" CssClass="buttonn"/>
                                <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancel" CssClass="buttonn"/>
                            </td>
                          
                                <asp:Label ID="idLabel1" runat="server" Text='<%# Eval("id") %>' Visible="False" />
                 
                            <td>
                                <asp:TextBox ID="schoolTextBox" runat="server" Text='<%# Bind("school") %>' />
                            </td>
                            <td>
                                <asp:TextBox ID="schAddressTextBox" runat="server" Text='<%# Bind("schAddress") %>' />
                            </td>
                        </tr>
                    </EditItemTemplate>
                    <EmptyDataTemplate>
                        <table runat="server" style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;">
                            <tr>
                                <td>No data was returned.</td>
                            </tr>
                        </table>
                    </EmptyDataTemplate>
                    <InsertItemTemplate>
                        <tr style="">
                            <td>
                                <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="Insert" />
                                <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Clear" />
                            </td>
                            <td>
                                &nbsp;</td>
                            <td>
                                <asp:TextBox ID="schoolTextBox" runat="server" Text='<%# Bind("school") %>' />
                            </td>
                            <td>
                                <asp:TextBox ID="schAddressTextBox" runat="server" Text='<%# Bind("schAddress") %>' />
                            </td>
                        </tr>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <tr style="background-color: #FFFBD6;color: #333333;">
                 <td>
                                <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="Delete"  CssClass="buttonn" Visible="False" />
                                <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Edit" CssClass="buttonn" />
                            </td>
                         
                               
                    
                              <td>
                                  <asp:Label ID="schoolLabel" runat="server" Text='<%# Eval("school") %>' />
                            </td>
                            <td>
                                <asp:Label ID="schAddressLabel" runat="server" Text='<%# Eval("schAddress") %>' />
                            </td>
                             <asp:Label ID="idLabel" runat="server" Text='<%# Eval("id") %>' Visible="False" />
                        </tr>
                    </ItemTemplate>
                    <LayoutTemplate>
                        <table runat="server">
                            <tr runat="server">
                                <td runat="server">
                                    <table id="itemPlaceholderContainer" runat="server" border="1" style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;font-family: Verdana, Arial, Helvetica, sans-serif;">
                                        <tr runat="server" style="background-color: #FFFBD6;color: #333333;">
                                            <th runat="server">Control</th>
                                          
                                            <th runat="server">School</th>
                                            <th runat="server">School Address</th>
                                        </tr>
                                        <tr id="itemPlaceholder" runat="server">
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr runat="server">
                                <td runat="server" style="text-align: center;background-color: #FFCC66;font-family: Verdana, Arial, Helvetica, sans-serif;color: #333333;">
                                </td>
                            </tr>
                        </table>
                    </LayoutTemplate>
                    <SelectedItemTemplate>
                        <tr style="background-color: #FFCC66;font-weight: bold;color: #000080;">
                            <td>
                                <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="Delete" />
                                <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Edit" />
                            </td>
                            <td>
                                <asp:Label ID="idLabel" runat="server" Text='<%# Eval("id") %>' />
                            </td>
                            <td>
                                <asp:Label ID="schoolLabel" runat="server" Text='<%# Eval("school") %>' />
                            </td>
                            <td>
                                <asp:Label ID="schAddressLabel" runat="server" Text='<%# Eval("schAddress") %>' />
                            </td>
                        </tr>
                    </SelectedItemTemplate>
                   </asp:ListView>
                   <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:HsDbConnectionString %>" SelectCommand="SELECT * FROM [schoolTbl] ORDER BY [school]" ConflictDetection="CompareAllValues" DeleteCommand="DELETE FROM [schoolTbl] WHERE [id] = @original_id AND (([school] = @original_school) OR ([school] IS NULL AND @original_school IS NULL)) AND (([schAddress] = @original_schAddress) OR ([schAddress] IS NULL AND @original_schAddress IS NULL))" InsertCommand="INSERT INTO [schoolTbl] ([school], [schAddress]) VALUES (@school, @schAddress)" OldValuesParameterFormatString="original_{0}" UpdateCommand="UPDATE [schoolTbl] SET [school] = @school, [schAddress] = @schAddress WHERE [id] = @original_id AND (([school] = @original_school) OR ([school] IS NULL AND @original_school IS NULL)) AND (([schAddress] = @original_schAddress) OR ([schAddress] IS NULL AND @original_schAddress IS NULL))">
                       <DeleteParameters>
                           <asp:Parameter Name="original_id" Type="Int32" />
                           <asp:Parameter Name="original_school" Type="String" />
                           <asp:Parameter Name="original_schAddress" Type="String" />
                       </DeleteParameters>
                       <InsertParameters>
                           <asp:Parameter Name="school" Type="String" />
                           <asp:Parameter Name="schAddress" Type="String" />
                       </InsertParameters>
                       <UpdateParameters>
                           <asp:Parameter Name="school" Type="String" />
                           <asp:Parameter Name="schAddress" Type="String" />
                           <asp:Parameter Name="original_id" Type="Int32" />
                           <asp:Parameter Name="original_school" Type="String" />
                           <asp:Parameter Name="original_schAddress" Type="String" />
                       </UpdateParameters>
                   </asp:SqlDataSource>
            </div>

           
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
