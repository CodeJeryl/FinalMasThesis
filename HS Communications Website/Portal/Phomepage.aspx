<%@ Page Title="" Language="C#" MasterPageFile="~/Portal/PortMaster.Master" AutoEventWireup="true" CodeBehind="Phomepage.aspx.cs" Inherits="HS_Communications_Website.Portal.Phomepage" %>
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
			<h4><strong class="colhead">Announcement</strong></h4>
		</div>
       
                 <asp:Panel ID="ErrorPanel" runat="server" CssClass="alert-box" Visible="False" ><h4>
                    <asp:Label ID="ErrorLabel" ForeColor="white" runat="server" Text="Label"></asp:Label></h4></asp:Panel>
        <div class="nine columns centered">
              <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource1" OnItemCommand="ListView1_ItemCommand">
                  
                  <EditItemTemplate>
                      <tr style="background-color: #FFCC66;color: #000080;">
                          <td>
                              <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="Update" />
                              <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancel" />
                          </td>
                          <td>
                              <asp:TextBox ID="titleTextBox" runat="server" Text='<%# Bind("title") %>' />
                          </td>
                          <td>
                              <asp:TextBox ID="senderTextBox" runat="server" Text='<%# Bind("sender") %>' />
                          </td>
                          <td>
                              <asp:TextBox ID="userlvlTextBox" runat="server" Text='<%# Bind("userlvl") %>' />
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
                              <asp:TextBox ID="titleTextBox" runat="server" Text='<%# Bind("title") %>' />
                          </td>
                          <td>
                              <asp:TextBox ID="senderTextBox" runat="server" Text='<%# Bind("sender") %>' />
                          </td>
                          <td>
                              <asp:TextBox ID="userlvlTextBox" runat="server" Text='<%# Bind("userlvl") %>' />
                          </td>
                      </tr>
                  </InsertItemTemplate>
                  <ItemTemplate>
                      <tr style="background-color: #FFFBD6;color: #333333;">
                          <asp:HiddenField ID="HiddenField1" runat="server" Value='<%# Eval("MsgId") %>' />
                          <td>
                              <asp:Label ID="titleLabel" runat="server" Text='<%# Eval("title") %>' />
                          </td>
                          <td>
                              <asp:Label ID="senderLabel" runat="server" Text='<%# Eval("sender") %>' />
                          </td>
                          <td>
                              <asp:Label ID="userlvlLabel" runat="server" Text='<%# Eval("userlvl") %>' />
                          </td>
                            <td>
                              <asp:Label ID="Label1" runat="server" Text='<%# Eval("date", "{0:d}") %>' />
                          </td>
                           <td>
                               <asp:Button ID="Button1" runat="server" Text="Read Now" CssClass="buttonn" CommandName="readd"/>
                          </td>
                      </tr>
                  </ItemTemplate>
                  <LayoutTemplate>
                      <table runat="server">
                          <tr runat="server">
                              <td runat="server">
                                  <table id="itemPlaceholderContainer" runat="server" border="1" style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;font-family: Verdana, Arial, Helvetica, sans-serif;">
                                      <tr runat="server" style="background-color: #FFFBD6;color: #333333;">
                                          <th runat="server">title</th>
                                          <th runat="server">sender</th>
                                          <th runat="server">userlvl</th>
                                           <th id="Th5" runat="server">date</th>
                                          <th id="Th1" runat="server">Option</th>
                                      </tr>
                                      <tr id="itemPlaceholder" runat="server">
                                      </tr>
                                  </table>
                              </td>
                          </tr>
                          <tr runat="server">
                              <td runat="server" style="text-align: center;background-color: #FFCC66;font-family: Verdana, Arial, Helvetica, sans-serif;color: #333333;">
                                  <asp:DataPager ID="DataPager1" runat="server">
                                      <Fields>
                                          <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" ShowLastPageButton="True" />
                                      </Fields>
                                  </asp:DataPager>
                              </td>
                          </tr>
                      </table>
                  </LayoutTemplate>
                  <SelectedItemTemplate>
                      <tr style="background-color: #FFCC66;font-weight: bold;color: #000080;">
                          <td>
                              <asp:Label ID="titleLabel" runat="server" Text='<%# Eval("title") %>' />
                          </td>
                          <td>
                              <asp:Label ID="senderLabel" runat="server" Text='<%# Eval("sender") %>' />
                          </td>
                          <td>
                              <asp:Label ID="userlvlLabel" runat="server" Text='<%# Eval("userlvl") %>' />
                          </td>
                      </tr>
                  </SelectedItemTemplate>
                </asp:ListView>
            </div>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:HsDbConnectionString %>" SelectCommand="SELECT [MsgId],[title], [sender], [userlvl],[date] FROM [msgTbl] WHERE [parent] = @parent AND [section] IN (@section,'all') ORDER BY [date] DESC">
                    <SelectParameters>
                        <asp:SessionParameter DefaultValue="false" Name="parent" SessionField="parent" Type="Boolean" />
                        <asp:SessionParameter DefaultValue="all" Name="section" SessionField="section" Type="String" />
                    </SelectParameters>
                </asp:SqlDataSource>
                
                

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
