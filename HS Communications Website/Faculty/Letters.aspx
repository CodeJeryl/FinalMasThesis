﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Faculty/FacuMaster.Master" AutoEventWireup="true" CodeBehind="Letters.aspx.cs" Inherits="HS_Communications_Website.Faculty.Letters" %>
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
			<h4><strong class="colhead">Letters and Memos</strong></h4>
		</div>
       
        <asp:Panel ID="Panel1" runat="server" CssClass="alert-box" Visible="False" ><h4 style="text-align: center">
                  Download Successful!</h4></asp:Panel>
                  <asp:Panel ID="ErrorPanel" runat="server" CssClass="alert-box alert" Visible="False"><h4>
                    <asp:Label ID="ErrorLabel" ForeColor="white" runat="server" Text="Label"></asp:Label></h4></asp:Panel>
                
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:HsDbConnectionString %>" SelectCommand="SELECT [id], [title], [date], [uploader] FROM [uploadedFiles] WHERE ([uploadtype] = @uploadtype) ORDER BY [date] DESC">
                    <SelectParameters>
                        <asp:Parameter DefaultValue="Memo" Name="uploadtype" Type="String" />
                    </SelectParameters>
                    </asp:SqlDataSource>
        	<div class="seven columns centered">
        	     <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                    <ContentTemplate>
                <div class="row collapse prefix-radius">
                                 <div class="small-5 columns">
                                      <span class="prefix">Title of Memo:</span>
                                    </div>
                                    <div class="small-5 columns">
                                       <asp:TextBox ID="TextBox11" runat="server"></asp:TextBox>
                                    </div>
                                    <div class="small-2 columns">
                                        <asp:Button ID="searchBtn1" runat="server" Text="Search" CssClass="button postfix" OnClick="searchBtn1_Click" />
                                    </div>
                                     </div>

                <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource1" OnItemCommand="ListView1_ItemCommand">
                
                    <EditItemTemplate>
                        <tr style="background-color: #FFCC66;color: #000080;">
                            <td>
                                <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="Update" />
                                <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancel" />
                            </td>
                            <td>
                                <asp:Label ID="idLabel1" runat="server" Text='<%# Eval("id") %>' />
                            </td>
                            <td>
                                <asp:TextBox ID="titleTextBox" runat="server" Text='<%# Bind("title") %>' />
                            </td>
                            <td>
                                <asp:TextBox ID="dateTextBox" runat="server" Text='<%# Bind("date") %>' />
                            </td>
                            <td>
                                <asp:TextBox ID="uploaderTextBox" runat="server" Text='<%# Bind("uploader") %>' />
                            </td>
                        </tr>
                    </EditItemTemplate>
                    <EmptyDataTemplate>
                        <table id="Table1" runat="server" style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;">
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
                            <td>&nbsp;</td>
                            <td>
                                <asp:TextBox ID="titleTextBox" runat="server" Text='<%# Bind("title") %>' />
                            </td>
                            <td>
                                <asp:TextBox ID="dateTextBox" runat="server" Text='<%# Bind("date") %>' />
                            </td>
                            <td>
                                <asp:TextBox ID="uploaderTextBox" runat="server" Text='<%# Bind("uploader") %>' />
                            </td>
                        </tr>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <tr style="background-color: #FFFBD6;color: #333333;">
                            <asp:HiddenField ID="HiddenField1" runat="server" Value='<%# Eval("id") %>' />
                              
                            <td>
                                <asp:Label ID="titleLabel" runat="server" Text='<%# Eval("title") %>' />
                            </td>
                            <td>
                                <asp:Label ID="dateLabel" runat="server" Text='<%# Eval("date", "{0:d}") %>' />
                            </td>
                            <td>
                                <asp:Label ID="uploaderLabel" runat="server" Text='<%# Eval("uploader") %>' />
                            </td>
                            <td>

                                <asp:Button ID="Button1" runat="server" Text="Download Now" CssClass="buttonn" CommandName="dl"/>
                            </td>
                        </tr>
                    </ItemTemplate>
                    <LayoutTemplate>
                        <table id="Table2" runat="server">
                            <tr id="Tr1" runat="server">
                                <td id="Td1" runat="server">
                                    <table id="itemPlaceholderContainer" runat="server" border="1" style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;font-family: Verdana, Arial, Helvetica, sans-serif;">
                                        <tr id="Tr2" runat="server" style="background-color: #FFFBD6;color: #333333;">
                                           
                                            <th id="Th1" runat="server">title</th>
                                            <th id="Th2" runat="server">date</th>
                                            <th id="Th3" runat="server">uploader</th>
                                             <th id="Th4" runat="server">Option</th>
                                        </tr>
                                        <tr id="itemPlaceholder" runat="server">
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr id="Tr3" runat="server">
                                <td id="Td2" runat="server" style="text-align: center;background-color: #FFCC66;font-family: Verdana, Arial, Helvetica, sans-serif;color: #333333;"></td>
                            </tr>
                        </table>
                    </LayoutTemplate>
                    <SelectedItemTemplate>
                        <tr style="background-color: #FFCC66;font-weight: bold;color: #000080;">
                            <td>
                                <asp:Label ID="idLabel" runat="server" Text='<%# Eval("id") %>' />
                            </td>
                            <td>
                                <asp:Label ID="titleLabel" runat="server" Text='<%# Eval("title") %>' />
                            </td>
                            <td>
                                <asp:Label ID="dateLabel" runat="server" Text='<%# Eval("date") %>' />
                            </td>
                            <td>
                                <asp:Label ID="uploaderLabel" runat="server" Text='<%# Eval("uploader") %>' />
                            </td>
                        </tr>
                    </SelectedItemTemplate>
                    </asp:ListView>
                 </ContentTemplate>
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="searchBtn1" EventName="Click" />
                        <asp:PostBackTrigger ControlID="ListView1" />
                    </Triggers>
                </asp:UpdatePanel>
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