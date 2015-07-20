<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMaster.Master" AutoEventWireup="true" CodeBehind="GradeRange.aspx.cs" Inherits="HS_Communications_Website.Admin.GradeRange" %>
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
			<h4><strong class="colhead">Range of Grades</strong></h4>
		</div>
        <div class="six columns centered">
            
            
            
                <asp:Panel ID="Panel1" runat="server" CssClass="alert-box" Visible="False" ><h4 style="text-align: center">
                  Range of Grades Successfully Changed.</h4></asp:Panel>
                  <asp:Panel ID="ErrorPanel" runat="server" CssClass="alert-box alert" Visible="false"><h4>
                    <asp:Label ID="ErrorLabel" ForeColor="white" runat="server" Text="Label"></asp:Label></h4></asp:Panel>
                

    
    <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource1" OnItemCommand="ListView1_ItemCommand">
      
        <EditItemTemplate>
            <tr style="background-color: #FFCC66;color: #000080;">
                <td>
                    <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="Update" />
                    <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancel" />
                </td>
                <td>
                    <asp:TextBox ID="GcodeTextBox" runat="server" Text='<%# Bind("Gcode") %>' />
                </td>
                <td>
                    <asp:TextBox ID="fromGradesTextBox" runat="server" Text='<%# Bind("fromGrades") %>' />
                </td>
                <td>
                    <asp:TextBox ID="toGradesTextBox" runat="server" Text='<%# Bind("toGrades") %>' />
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
                    <asp:TextBox ID="GcodeTextBox" runat="server" Text='<%# Bind("Gcode") %>' />
                </td>
                <td>
                    <asp:TextBox ID="fromGradesTextBox" runat="server" Text='<%# Bind("fromGrades") %>' />
                </td>
                <td>
                    <asp:TextBox ID="toGradesTextBox" runat="server" Text='<%# Bind("toGrades") %>' />
                </td>
            </tr>
        </InsertItemTemplate>
        <ItemTemplate>
            <tr style="background-color: #FFFBD6;color: #333333;">
                <td style="text-align: center; font-size: 15px">
                    <asp:Label ID="GcodeLabel" runat="server" Text='<%# Eval("Gcode") %>' />
                </td>
                <td style="text-align: center; font-size: 15px">
                  
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Eval("fromGrades") %>' Width="50px"></asp:TextBox>
                </td>
                <td style="text-align: center; font-size: 15px">
                   
                    <asp:TextBox ID="TextBox2" runat="server" Text='<%# Eval("toGrades") %>' Width="50px"></asp:TextBox>
                </td>
                 <td style="text-align: center; font-size: 15px">
                     <asp:Button ID="Button1" runat="server" Text="Update" CssClass="buttonn" CommandName="upd"/>
                </td>
            </tr>
        </ItemTemplate>
        <LayoutTemplate>
            <table runat="server">
                <tr runat="server">
                    <td runat="server">
                        <table id="itemPlaceholderContainer" runat="server" border="1" style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;font-family: Verdana, Arial, Helvetica, sans-serif;">
                            <tr runat="server" style="background-color: #FFFBD6;color: #333333;">
                                <th runat="server" style="width: 150px;text-align: center">CODE</th>
                                <th runat="server" style="width: 150px;text-align: center">FROM</th>
                                <th runat="server" style="width: 150px;text-align: center">TO</th>
                                 <th id="Th1" runat="server" style="width: 150px;text-align: center">Control</th>
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
                    <asp:Label ID="GcodeLabel" runat="server" Text='<%# Eval("Gcode") %>' />
                </td>
                <td>
                    <asp:Label ID="fromGradesLabel" runat="server" Text='<%# Eval("fromGrades") %>' />
                </td>
                <td>
                    <asp:Label ID="toGradesLabel" runat="server" Text='<%# Eval("toGrades") %>' />
                </td>
            </tr>
        </SelectedItemTemplate>
    </asp:ListView>
    
    
    
    


<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:HsDbConnectionString %>" SelectCommand="SELECT * FROM [gradeRangeTbl]"></asp:SqlDataSource>
    
    
    
    
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