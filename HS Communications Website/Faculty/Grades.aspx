﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Faculty/FacuMaster.Master" AutoEventWireup="true" CodeBehind="Grades.aspx.cs" Inherits="HS_Communications_Website.Faculty.Grades" %>
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
			<h4><strong class="colhead">Grades</strong></h4>
		</div>
       
                 <asp:Panel ID="Panel1" runat="server" CssClass="alert-box" Visible="False" ><h4 style="text-align: center">
                  Grades Successfully updated.</h4></asp:Panel>
                  <asp:Panel ID="ErrorPanel" runat="server" CssClass="alert-box alert" Visible="False"><h4>
                    <asp:Label ID="ErrorLabel" ForeColor="white" runat="server" Text="Label"></asp:Label></h4></asp:Panel>

                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:HsDbConnectionString %>" SelectCommand="SELECT [Sectno], [Subcode], [GR-YR] AS column1 FROM [subjectsView] WHERE ([fCode] = @fCode) ORDER BY [GR-YR]">
                        <SelectParameters>
                            <asp:SessionParameter DefaultValue="0" Name="fCode" SessionField="fcode" Type="Int32" />
                        </SelectParameters>
                    </asp:SqlDataSource>
        <div class="seven columns centered">
                    <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource1" OnItemCommand="ListView1_ItemCommand">
                       
                        <EditItemTemplate>
                            <tr style="background-color: #FFCC66;color: #000080;">
                                <td>
                                    <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="Update" />
                                    <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancel" />
                                </td>
                                <td>
                                    <asp:TextBox ID="SectnoTextBox" runat="server" Text='<%# Bind("Sectno") %>' />
                                </td>
                                <td>
                                    <asp:TextBox ID="SubcodeTextBox" runat="server" Text='<%# Bind("Subcode") %>' />
                                </td>
                                <td>
                                    <asp:TextBox ID="column1TextBox" runat="server" Text='<%# Bind("column1") %>' />
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
                                    <asp:TextBox ID="SectnoTextBox" runat="server" Text='<%# Bind("Sectno") %>' />
                                </td>
                                <td>
                                    <asp:TextBox ID="SubcodeTextBox" runat="server" Text='<%# Bind("Subcode") %>' />
                                </td>
                                <td>
                                    <asp:TextBox ID="column1TextBox" runat="server" Text='<%# Bind("column1") %>' />
                                </td>
                            </tr>
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <tr style="background-color: #FFFBD6;color: #333333;">
                                <td>
                                    <asp:Label ID="SectnoLabel" runat="server" Text='<%# Eval("Sectno") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="SubcodeLabel" runat="server" Text='<%# Eval("Subcode") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="column1Label" runat="server" Text='<%# Eval("column1") %>' />
                                </td>
                                <td>
                                    <asp:Button ID="Button1" runat="server" Text="Open" CssClass="buttonn" CommandName="open"/>
                                </td>
                            </tr>
                        </ItemTemplate>
                        <LayoutTemplate>
                            <table runat="server">
                                <tr runat="server">
                                    <td runat="server">
                                        <table id="itemPlaceholderContainer" runat="server" border="1" style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;font-family: Verdana, Arial, Helvetica, sans-serif;">
                                            <tr runat="server" style="background-color: #FFFBD6;color: #333333;">
                                                <th runat="server" style="padding:10px 15px 10px 15px;background-color:yellow">Section</th>
                                                <th runat="server" style="padding:10px 15px 10px 15px;background-color:yellow">Sub Code</th>
                                                <th runat="server" style="padding:10px 15px 10px 15px;background-color:yellow">Year</th>
                                                <th runat="server" style="padding:10px 15px 10px 15px;background-color:yellow">Control</th>
                                            </tr>
                                            <tr id="itemPlaceholder" runat="server">
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                                <tr runat="server">
                                    <td runat="server" style="text-align: center;background-color: #FFCC66;font-family: Verdana, Arial, Helvetica, sans-serif;color: #333333;"></td>
                                </tr>
                            </table>
                        </LayoutTemplate>
                        <SelectedItemTemplate>
                            <tr style="background-color: #FFCC66;font-weight: bold;color: #000080;">
                                <td>
                                    <asp:Label ID="SectnoLabel" runat="server" Text='<%# Eval("Sectno") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="SubcodeLabel" runat="server" Text='<%# Eval("Subcode") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="column1Label" runat="server" Text='<%# Eval("column1") %>' />
                                </td>
                            </tr>
                        </SelectedItemTemplate>
                    </asp:ListView>
                    
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
