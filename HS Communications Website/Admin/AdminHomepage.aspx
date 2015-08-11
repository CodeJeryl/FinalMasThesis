<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMaster.Master" AutoEventWireup="true" CodeBehind="AdminHomepage.aspx.cs" Inherits="HS_Communications_Website.Admin.AdminHomepage" %>

<%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>
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
                <h4><strong class="colhead">Dashboard</strong></h4>
            </div>
            <asp:Panel ID="Panel1" runat="server" CssClass="alert-box" Visible="False">
                <h4 style="text-align: center"></h4>
            </asp:Panel>
            <asp:Panel ID="ErrorPanel" runat="server" CssClass="alert-box alert" Visible="false">
                <h4>
                    <asp:Label ID="ErrorLabel" ForeColor="white" runat="server" Text="Label"></asp:Label></h4>
            </asp:Panel>
            <div class="row">
                <div class="three columns right">
                    <p>
                        School Year:
                        <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource1" DataTextField="SY" DataValueField="SY" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:HsDbConnectionString %>" SelectCommand="SELECT DISTINCT [SY] FROM [Dashboard] ORDER BY [SY]"></asp:SqlDataSource>
                    </p>
                </div>
            </div>
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>
                    <div class="six columns">
                        <strong class="colhead" style="color: darkblue;">Town Feeder: Chart</strong>
                        <asp:Chart ID="Chart1" runat="server">
                            <Series>
                                <asp:Series Name="Series1" ChartArea="ChartArea1" ChartType="Bar"></asp:Series>
                            </Series>
                            <ChartAreas>
                                <asp:ChartArea Name="ChartArea1">
                                    <AxisX Title="Town"></AxisX>
                                    <AxisY Title="Number"></AxisY>
                                </asp:ChartArea>
                            </ChartAreas>

                        </asp:Chart>
                        <br />
                        <br />
                        <strong class="colhead" style="color: darkblue;">Town Feeder: List</strong><br />
                        <br />
                        <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource2">
                            <AlternatingItemTemplate>
                                <tr style="background-color: #FFF192; color: #333333;">
                                    <td>
                                        <asp:Label ID="townLabel" runat="server" Text='<%# Eval("town") %>' />
                                    </td>
                                    <td>
                                        <asp:Label ID="tCountLabel" runat="server" Text='<%# Eval("tCount") %>' />
                                    </td>
                                </tr>
                            </AlternatingItemTemplate>
                            <EditItemTemplate>
                                <tr style="background-color: #FFCC66; color: #000080;">
                                    <td>
                                        <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="Update" />
                                        <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancel" />
                                    </td>
                                    <td>
                                        <asp:TextBox ID="townTextBox" runat="server" Text='<%# Bind("town") %>' />
                                    </td>
                                    <td>
                                        <asp:TextBox ID="tCountTextBox" runat="server" Text='<%# Bind("tCount") %>' />
                                    </td>
                                </tr>
                            </EditItemTemplate>
                            <EmptyDataTemplate>
                                <table runat="server" style="background-color: #FFFFFF; border-collapse: collapse; border-color: #999999; border-style: none; border-width: 1px;">
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
                                        <asp:TextBox ID="townTextBox" runat="server" Text='<%# Bind("town") %>' />
                                    </td>
                                    <td>
                                        <asp:TextBox ID="tCountTextBox" runat="server" Text='<%# Bind("tCount") %>' />
                                    </td>
                                </tr>
                            </InsertItemTemplate>
                            <ItemTemplate>
                                <tr style="background-color: #FFFBD6; color: #333333;">
                                    <td>
                                        <asp:Label ID="townLabel" runat="server" Text='<%# Eval("town") %>' />
                                    </td>
                                    <td>
                                        <asp:Label ID="tCountLabel" runat="server" Text='<%# Eval("tCount") %>' />
                                    </td>
                                </tr>
                            </ItemTemplate>
                            <LayoutTemplate>
                                <table runat="server">
                                    <tr runat="server">
                                        <td runat="server">
                                            <table id="itemPlaceholderContainer" runat="server" border="1" style="background-color: #FFFFFF; border-collapse: collapse; border-color: #999999; border-style: none; border-width: 1px; font-family: Verdana, Arial, Helvetica, sans-serif;">
                                                <tr runat="server" style="background-color: #FFFBD6; color: #333333;">
                                                    <th runat="server" style="padding: 16px; font-size: 15px">TOWN</th>
                                                    <th runat="server" style="padding: 16px; font-size: 15px">COUNT</th>
                                                </tr>
                                                <tr id="itemPlaceholder" runat="server">
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                    <tr runat="server">
                                        <td runat="server" style="text-align: center; background-color: #FFCC66; font-family: Verdana, Arial, Helvetica, sans-serif; color: #333333;"></td>
                                    </tr>
                                </table>
                            </LayoutTemplate>
                            <SelectedItemTemplate>
                                <tr style="background-color: #FFCC66; font-weight: bold; color: #000080;">
                                    <td>
                                        <asp:Label ID="townLabel" runat="server" Text='<%# Eval("town") %>' />
                                    </td>
                                    <td>
                                        <asp:Label ID="tCountLabel" runat="server" Text='<%# Eval("tCount") %>' />
                                    </td>
                                </tr>
                            </SelectedItemTemplate>
                        </asp:ListView>
                        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:HsDbConnectionString %>" SelectCommand="SELECT [town], [tCount] FROM [Dashboard] WHERE (([category] = @category) AND ([SY] = @SY)) ORDER BY [tCount] DESC">
                            <SelectParameters>
                                <asp:Parameter DefaultValue="town" Name="category" Type="String" />
                                <asp:ControlParameter ControlID="DropDownList1" DefaultValue="2011-2012" Name="SY" PropertyName="SelectedValue" Type="String" />
                            </SelectParameters>
                        </asp:SqlDataSource>

                    </div>
                    <div class="six columns centered">
                        <strong class="colhead" style="color: darkblue;">School Feeder: Chart</strong>
                        <asp:Chart ID="Chart2" runat="server">
                            <Series>
                                <asp:Series Name="Series1" ChartArea="ChartArea1" ChartType="Bar"></asp:Series>
                            </Series>
                            <ChartAreas>
                                <asp:ChartArea Name="ChartArea1">
                                    <AxisX Title="School"></AxisX>
                                    <AxisY Title="Number"></AxisY>
                                </asp:ChartArea>
                            </ChartAreas>

                        </asp:Chart>


                        <br />
                        <br />
                        <strong class="colhead" style="color: darkblue;">School Feeder: List</strong><br />
                        <br />
                        <asp:ListView ID="ListView2" runat="server" DataSourceID="SqlDataSource3">
                            <AlternatingItemTemplate>
                                <tr style="background-color: #FFF192; color: #333333;">
                                    <td>
                                        <asp:Label ID="schoolLabel" runat="server" Text='<%# Eval("school") %>' />
                                    </td>
                                    <td>
                                        <asp:Label ID="sCountLabel" runat="server" Text='<%# Eval("sCount") %>' />
                                    </td>
                                </tr>
                            </AlternatingItemTemplate>
                            <EditItemTemplate>
                                <tr style="background-color: #FFCC66; color: #000080;">
                                    <td>
                                        <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="Update" />
                                        <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancel" />
                                    </td>
                                    <td>
                                        <asp:TextBox ID="schoolTextBox" runat="server" Text='<%# Bind("school") %>' />
                                    </td>
                                    <td>
                                        <asp:TextBox ID="sCountTextBox" runat="server" Text='<%# Bind("sCount") %>' />
                                    </td>
                                </tr>
                            </EditItemTemplate>
                            <EmptyDataTemplate>
                                <table runat="server" style="background-color: #FFFFFF; border-collapse: collapse; border-color: #999999; border-style: none; border-width: 1px;">
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
                                        <asp:TextBox ID="schoolTextBox" runat="server" Text='<%# Bind("school") %>' />
                                    </td>
                                    <td>
                                        <asp:TextBox ID="sCountTextBox" runat="server" Text='<%# Bind("sCount") %>' />
                                    </td>
                                </tr>
                            </InsertItemTemplate>
                            <ItemTemplate>
                                <tr style="background-color: #FFFBD6; color: #333333;">
                                    <td>
                                        <asp:Label ID="schoolLabel" runat="server" Text='<%# Eval("school") %>' />
                                    </td>
                                    <td>
                                        <asp:Label ID="sCountLabel" runat="server" Text='<%# Eval("sCount") %>' />
                                    </td>
                                </tr>
                            </ItemTemplate>
                            <LayoutTemplate>
                                <table runat="server">
                                    <tr runat="server">
                                        <td runat="server">
                                            <table id="itemPlaceholderContainer" runat="server" border="1" style="background-color: #FFFFFF; border-collapse: collapse; border-color: #999999; border-style: none; border-width: 1px; font-family: Verdana, Arial, Helvetica, sans-serif;">
                                                <tr runat="server" style="background-color: #FFFBD6; color: #333333;">
                                                    <th runat="server" style="padding: 16px; font-size: 15px">SCHOOL</th>
                                                    <th runat="server" style="padding: 16px; font-size: 15px">COUNT</th>
                                                </tr>
                                                <tr id="itemPlaceholder" runat="server">
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                    <tr runat="server">
                                        <td runat="server" style="text-align: center; background-color: #FFCC66; font-family: Verdana, Arial, Helvetica, sans-serif; color: #333333;"></td>
                                    </tr>
                                </table>
                            </LayoutTemplate>
                            <SelectedItemTemplate>
                                <tr style="background-color: #FFCC66; font-weight: bold; color: #000080;">
                                    <td>
                                        <asp:Label ID="schoolLabel" runat="server" Text='<%# Eval("school") %>' />
                                    </td>
                                    <td>
                                        <asp:Label ID="sCountLabel" runat="server" Text='<%# Eval("sCount") %>' />
                                    </td>
                                </tr>
                            </SelectedItemTemplate>
                        </asp:ListView>

                        <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:HsDbConnectionString %>" SelectCommand="SELECT [school], [sCount] FROM [Dashboard] WHERE (([category] = @category) AND ([SY] = @SY)) ORDER BY [sCount] DESC">
                            <SelectParameters>
                                <asp:Parameter DefaultValue="sc" Name="category" Type="String" />
                                <asp:ControlParameter ControlID="DropDownList1" DefaultValue="2011-2012" Name="SY" PropertyName="SelectedValue" Type="String" />
                            </SelectParameters>
                        </asp:SqlDataSource>

                    </div>

                </ContentTemplate>
            </asp:UpdatePanel>

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
