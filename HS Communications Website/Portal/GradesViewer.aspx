<%@ Page Title="" Language="C#" MasterPageFile="~/Portal/PortMaster.Master" AutoEventWireup="true" CodeBehind="GradesViewer.aspx.cs" Inherits="HS_Communications_Website.Portal.GradesViewer" %>
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
			<h4><strong class="colhead">Grades Viewer</strong></h4>
		</div>
       
                     <asp:Panel ID="ErrorPanel" runat="server" CssClass="alert-box" Visible="False" ><h4>
                    <asp:Label ID="ErrorLabel" ForeColor="white" runat="server" Text="Label"></asp:Label></h4></asp:Panel>
                <br />
                

                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:HsDbConnectionString %>" SelectCommand="SELECT [Subcode], [Units], [first], [second], [third], [fourth], 
                            [Ave], [d1], [d2], [d3], [d4] FROM [GradesViewer] WHERE ([Studno] = @Studno)">
                            <SelectParameters>
                                <asp:SessionParameter DefaultValue="0" Name="Studno" SessionField="studno" Type="Int32" />
                            </SelectParameters>
                    </asp:SqlDataSource>
        	<div class="ten columns centered">
                        <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource1" OnItemCreated="ListView1_ItemCreated">
                            
                            <EditItemTemplate>
                                <tr style="background-color: #FFCC66;color: #000080;">
                                    <td>
                                        <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="Update" />
                                        <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancel" />
                                    </td>
                                    <td>
                                        <asp:TextBox ID="SubcodeTextBox" runat="server" Text='<%# Bind("Subcode") %>' />
                                    </td>
                                    <td>
                                        <asp:TextBox ID="UnitsTextBox" runat="server" Text='<%# Bind("Units") %>' />
                                    </td>
                                    <td>
                                        <asp:TextBox ID="firstTextBox" runat="server" Text='<%# Bind("first") %>' />
                                    </td>
                                    <td>
                                        <asp:TextBox ID="secondTextBox" runat="server" Text='<%# Bind("second") %>' />
                                    </td>
                                    <td>
                                        <asp:TextBox ID="thirdTextBox" runat="server" Text='<%# Bind("third") %>' />
                                    </td>
                                    <td>
                                        <asp:TextBox ID="fourthTextBox" runat="server" Text='<%# Bind("fourth") %>' />
                                    </td>
                                    <td>
                                        <asp:TextBox ID="d1TextBox" runat="server" Text='<%# Bind("d1") %>' />
                                    </td>
                                    <td>
                                        <asp:TextBox ID="d2TextBox" runat="server" Text='<%# Bind("d2") %>' />
                                    </td>
                                    <td>
                                        <asp:TextBox ID="d3TextBox" runat="server" Text='<%# Bind("d3") %>' />
                                    </td>
                                    <td>
                                        <asp:TextBox ID="d4TextBox" runat="server" Text='<%# Bind("d4") %>' />
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
                                        <asp:TextBox ID="SubcodeTextBox" runat="server" Text='<%# Bind("Subcode") %>' />
                                    </td>
                                    <td>
                                        <asp:TextBox ID="UnitsTextBox" runat="server" Text='<%# Bind("Units") %>' />
                                    </td>
                                    <td >
                                        <asp:TextBox ID="firstTextBox" runat="server" Text='<%# Bind("first") %>' />
                                    </td>
                                    <td >
                                        <asp:TextBox ID="secondTextBox" runat="server" Text='<%# Bind("second") %>' />
                                    </td>
                                    <td >
                                        <asp:TextBox ID="thirdTextBox" runat="server" Text='<%# Bind("third") %>' />
                                    </td>
                                    <td >
                                        <asp:TextBox ID="fourthTextBox" runat="server" Text='<%# Bind("fourth") %>' />
                                    </td>
                                    <td>
                                        <asp:TextBox ID="d1TextBox" runat="server" Text='<%# Bind("d1") %>' />
                                    </td>
                                    <td>
                                        <asp:TextBox ID="d2TextBox" runat="server" Text='<%# Bind("d2") %>' />
                                    </td>
                                    <td>
                                        <asp:TextBox ID="d3TextBox" runat="server" Text='<%# Bind("d3") %>' />
                                    </td>
                                    <td>
                                        <asp:TextBox ID="d4TextBox" runat="server" Text='<%# Bind("d4") %>' />
                                    </td>
                                </tr>
                            </InsertItemTemplate>
                            <ItemTemplate>
                                <tr style="background-color: #FFFBD6;color: #333333;">
                                    <td>
                                        <asp:Label ID="SubcodeLabel" runat="server" Text='<%# Eval("Subcode") %>' />
                                    </td>
                                    <td>
                                        <asp:Label ID="UnitsLabel" runat="server" Text='<%# Eval("Units") %>' />
                                    </td>
                                    <td  style="background-color: #ffeaaa; text-align: center">
                                        <asp:Label ID="firstLabel" runat="server" Text='<%# Eval("first") %>'  />
                                    </td>
                                    <td style="text-align: center">
                                        <asp:Label ID="secondLabel" runat="server" Text='<%# Eval("second") %>' />
                                    </td>
                                    <td  style="background-color: #ffeaaa; text-align: center">
                                        <asp:Label ID="thirdLabel" runat="server" Text='<%# Eval("third") %>' />
                                    </td>
                                     <td style="text-align: center">
                                        <asp:Label ID="fourthLabel" runat="server" Text='<%# Eval("fourth") %>' />
                                    </td>
                                     <td  style="background-color: #ffeaaa; text-align: center">
                                        <asp:Label ID="Label1" runat="server" Text='<%# Eval("Ave") %>' />
                                    </td>
                                 <%--   <td>
                                        <asp:Label ID="d1Label" runat="server" Text='<%# Eval("d1") %>' />
                                    </td>
                                    <td>
                                        <asp:Label ID="d2Label" runat="server" Text='<%# Eval("d2") %>' />
                                    </td>
                                    <td>
                                        <asp:Label ID="d3Label" runat="server" Text='<%# Eval("d3") %>' />
                                    </td>
                                    <td>
                                        <asp:Label ID="d4Label" runat="server" Text='<%# Eval("d4") %>' />
                                    </td>--%>
                                </tr>
                            </ItemTemplate>
                            <LayoutTemplate>
                                <table runat="server">
                                    <tr runat="server">
                                        <td runat="server">
                                            <table id="itemPlaceholderContainer" runat="server" border="1" style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;font-family: Verdana, Arial, Helvetica, sans-serif;">
                                                <tr runat="server" style="background-color: #FFFBD6;color: #333333;">
                                                    <th runat="server" style="padding:10px 15px 10px 15px;background-color:yellow">Subcode</th>
                                                    <th runat="server" style="padding:10px 15px 10px 15px;background-color:yellow">Units</th>
                                                    <th runat="server" style="padding:10px 15px 10px 15px;background-color:yellow">First Quarter</th>
                                                    <th runat="server" style="padding:10px 15px 10px 15px;background-color:yellow">Second Quarter</th>
                                                    <th runat="server" style="padding:10px 15px 10px 15px;background-color:yellow">Third Quarter</th>
                                                    <th runat="server" style="padding:10px 15px 10px 15px;background-color:yellow">Fourth Quarter</th>
                                                      <th id="Th1" runat="server" style="padding:10px 15px 10px 15px;background-color:yellow">Average</th>
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
                                        <asp:Label ID="SubcodeLabel" runat="server" Text='<%# Eval("Subcode") %>' />
                                    </td>
                                    <td>
                                        <asp:Label ID="UnitsLabel" runat="server" Text='<%# Eval("Units") %>' />
                                    </td>
                                    <td>
                                        <asp:Label ID="firstLabel" runat="server" Text='<%# Eval("first") %>' />
                                    </td>
                                    <td>
                                        <asp:Label ID="secondLabel" runat="server" Text='<%# Eval("second") %>' />
                                    </td>
                                    <td>
                                        <asp:Label ID="thirdLabel" runat="server" Text='<%# Eval("third") %>' />
                                    </td>
                                    <td>
                                        <asp:Label ID="fourthLabel" runat="server" Text='<%# Eval("fourth") %>' />
                                    </td>
                                    <td>
                                        <asp:Label ID="d1Label" runat="server" Text='<%# Eval("d1") %>' />
                                    </td>
                                    <td>
                                        <asp:Label ID="d2Label" runat="server" Text='<%# Eval("d2") %>' />
                                    </td>
                                    <td>
                                        <asp:Label ID="d3Label" runat="server" Text='<%# Eval("d3") %>' />
                                    </td>
                                    <td>
                                        <asp:Label ID="d4Label" runat="server" Text='<%# Eval("d4") %>' />
                                    </td>
                                </tr>
                            </SelectedItemTemplate>
                        </asp:ListView>
                
                <br /> 
                <div style="font-weight: 500; font-size: 15px">
                    First Quarter Average : <asp:Label ID="firstAve" runat="server" Text="1"></asp:Label> <br/>
                      Second Quarter Average : <asp:Label ID="secondAve" runat="server" Text="2"></asp:Label> <br/>
                      Third Quarter Average : <asp:Label ID="thirdAve" runat="server" Text="3"></asp:Label> <br/>
                      Fourth Quarter Average : <asp:Label ID="fourthAve" runat="server" Text="4"></asp:Label> <br/>
                      General Weoghted Average : <asp:Label ID="genAve" runat="server" Text="5"></asp:Label> 
                </div>
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
