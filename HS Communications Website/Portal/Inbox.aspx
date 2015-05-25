<%@ Page Title="" Language="C#" MasterPageFile="~/Portal/PortMaster.Master" AutoEventWireup="true" CodeBehind="Inbox.aspx.cs" Inherits="HS_Communications_Website.Portal.Inbox" %>

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
                <h4><strong class="colhead">Inbox</strong></h4>
            </div>


          <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:HsDbConnectionString %>" SelectCommand="SELECT [msgId], [senderName], [subject], [date], [status] FROM [personalMsgTbl] WHERE (([studno] = @studno) AND ([admin] = @admin)) ORDER BY [date] DESC">
                <SelectParameters>
                    <asp:SessionParameter Name="studno" SessionField="studno" Type="Int32" />
                    <asp:Parameter DefaultValue="true" Name="admin" Type="Boolean" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource1" OnItemCommand="ListView1_ItemCommand">

                <EditItemTemplate>
                    <tr style="background-color: #FFCC66; color: #000080;">
                        <td>
                            <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="Update" />
                            <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancel" />
                        </td>
                        <td>
                            <asp:Label ID="IdLabel1" runat="server" Text='<%# Eval("Id") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="senderNameTextBox" runat="server" Text='<%# Bind("senderName") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="subjectTextBox" runat="server" Text='<%# Bind("subject") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="dateTextBox" runat="server" Text='<%# Bind("date") %>' />
                        </td>
                    </tr>
                </EditItemTemplate>
                <EmptyDataTemplate>
                    <table id="Table1" runat="server" style="background-color: #FFFFFF; border-collapse: collapse; border-color: #999999; border-style: none; border-width: 1px;">
                        <tr>
                            <td>No Message Available.</td>
                        </tr>
                    </table>
                </EmptyDataTemplate>
                <InsertItemTemplate>
                    <tr style="">
                        <td>
                            <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="Insert" />
                            <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Clear" />
                        </td>
                        <td>&nbsp;</td>
                        <td>
                            <asp:TextBox ID="senderNameTextBox" runat="server" Text='<%# Bind("senderName") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="subjectTextBox" runat="server" Text='<%# Bind("subject") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="dateTextBox" runat="server" Text='<%# Bind("date") %>' />
                        </td>
                    </tr>
                </InsertItemTemplate>
                <ItemTemplate>
                    <tr style="background-color: #FFFBD6; color: #333333;">
                        <asp:HiddenField ID="HiddenField1" runat="server" Value='<%# Eval("msgId") %>' />
                        <td>
                            <asp:Label ID="senderNameLabel" runat="server" Text='<%# Eval("senderName") %>' />
                        </td>
                        <td>
                            <asp:Label ID="subjectLabel" runat="server" Text='<%# Eval("subject") %>' />
                        </td>
                        <td>
                            <asp:Label ID="dateLabel" runat="server" Text='<%# Eval("date") %>' />
                        </td>
                        <td>
                            <asp:Label ID="Label1" runat="server" Text='<%# Eval("status") %>' />
                        </td>
                        <td>
                            <asp:Button ID="readBtn" runat="server" Text="Read" CommandName="read" CssClass="buttonn" />
                            <asp:Button ID="delBtn" runat="server" Text="Delete" CommandName="del" CssClass="buttonn" OnClientClick="javascript:return confirm('Delete Message?');" />
                        </td>
                    </tr>
                </ItemTemplate>
                <LayoutTemplate>
                    <table id="Table2" runat="server">
                        <tr id="Tr1" runat="server">
                            <td id="Td1" runat="server">
                                <table id="itemPlaceholderContainer" runat="server" border="1" style="background-color: #FFFFFF; border-collapse: collapse; border-color: #999999; border-style: none; border-width: 1px; font-family: Verdana, Arial, Helvetica, sans-serif;">
                                    <tr id="Tr2" runat="server" style="background-color: #FFFBD6; color: #333333;">
                                        <th id="Th1" runat="server">senderName</th>
                                        <th id="Th2" runat="server">subject</th>
                                        <th id="Th3" runat="server">date</th>
                                        <th id="Th4" runat="server">Status</th>
                                        <th id="Th5" runat="server">Controls</th>
                                    </tr>
                                    <tr id="itemPlaceholder" runat="server">
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr id="Tr3" runat="server">
                            <td id="Td2" runat="server" style="text-align: center; background-color: #FFCC66; font-family: Verdana, Arial, Helvetica, sans-serif; color: #333333;"></td>
                        </tr>
                    </table>
                </LayoutTemplate>
                <SelectedItemTemplate>
                    <tr style="background-color: #FFCC66; font-weight: bold; color: #000080;">
                        <td>
                            <asp:Label ID="IdLabel" runat="server" Text='<%# Eval("Id") %>' />
                        </td>
                        <td>
                            <asp:Label ID="senderNameLabel" runat="server" Text='<%# Eval("senderName") %>' />
                        </td>
                        <td>
                            <asp:Label ID="subjectLabel" runat="server" Text='<%# Eval("subject") %>' />
                        </td>
                        <td>
                            <asp:Label ID="dateLabel" runat="server" Text='<%# Eval("date") %>' />
                        </td>
                    </tr>
                </SelectedItemTemplate>
            </asp:ListView>



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
