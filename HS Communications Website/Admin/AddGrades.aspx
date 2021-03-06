﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMaster.Master" AutoEventWireup="true" CodeBehind="AddGrades.aspx.cs" Inherits="HS_Communications_Website.Admin.AddGrades" %>
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
			<h4><strong class="colhead">Update Grades</strong></h4>
		</div>
        <div class="colp">
         <asp:Panel ID="Panel1" runat="server" CssClass="alert-box" Visible="False" ><h4 style="text-align: center">
                  Grades Successfully updated.</h4></asp:Panel>
                  <asp:Panel ID="ErrorPanel" runat="server" CssClass="alert-box alert" Visible="False"><h4>
                    <asp:Label ID="ErrorLabel" ForeColor="white" runat="server" Text="Label"></asp:Label></h4></asp:Panel>

                
                
                
              <span style="font-size: large">Subject: <asp:Label ID="subLbl" runat="server" Text="Label"></asp:Label> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    Section:  <asp:Label ID="secLbl" runat="server" Text="Label"></asp:Label> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                  Teacher: <asp:Label ID="teachLbl" runat="server" Text="Label"></asp:Label></span>
              
                <span style="position: absolute;left:83%"><asp:Button ID="InsertEqui" runat="server" Text="Insert Equivalent" CssClass="buttonn" OnClick="InsertEqui_Click" BackColor="Red" Visible="False" />
                  <asp:Button ID="UpdateButton" runat="server" Text="Save Grades" CssClass="buttonn" OnClick="UpdateButton_Click" /></span><br/><br/>
              <span style="font-size: 18px"> <a href="ManageGrades.aspx">Back to list of grades</a> </span>
                
                
            <br/>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:HsDbConnectionString %>" SelectCommand="SELECT [first], [second], [third], [fourth], [SMTRID], [name] FROM [SMTRView] WHERE (([Subcode] = @Subcode) AND ([Sectno] = @Sectno)) order by [name] asc" DeleteCommand="DELETE FROM [SMTRview] WHERE [SMTRID] = @SMTRID" InsertCommand="INSERT INTO [SMTRview] ([first], [second], [third], [fourth], [SMTRID]) VALUES (@first, @second, @third, @fourth, @SMTRID)" UpdateCommand="UPDATE [SMTRView] SET [first] = @first, [second] = @second, [third] = @third, [fourth] = @fourth WHERE [SMTRID] = @SMTRID">
                        <DeleteParameters>
                            <asp:Parameter Name="SMTRID" Type="Int32" />
                        </DeleteParameters>
                        <InsertParameters>
                            <asp:Parameter Name="first" Type="String" />
                            <asp:Parameter Name="second" Type="String" />
                            <asp:Parameter Name="third" Type="String" />
                            <asp:Parameter Name="fourth" Type="String" />
                            <asp:Parameter Name="SMTRID" Type="Int32" />
                        </InsertParameters>
                        <SelectParameters>
                            <asp:SessionParameter Name="Subcode" SessionField="subcode" Type="String" />
                            <asp:SessionParameter Name="Sectno" SessionField="sectno" Type="String" />
                        </SelectParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="first" Type="String" />
                            <asp:Parameter Name="second" Type="String" />
                            <asp:Parameter Name="third" Type="String" />
                            <asp:Parameter Name="fourth" Type="String" />
                            <asp:Parameter Name="SMTRID" Type="Int32" />
                        </UpdateParameters>
                    </asp:SqlDataSource>

                   <asp:GridView ID="GridView1" runat="server" DataSourceID="SqlDataSource1" AutoGenerateColumns="False" DataKeyNames="SMTRID" OnRowDataBound="GridView1_RowDataBound">
                       <Columns>
                            <asp:BoundField DataField="name" HeaderText="name" ReadOnly="True" SortExpression="name" />
                           <asp:TemplateField HeaderText="first" SortExpression="first">
                               <EditItemTemplate>
                                   <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("first") %>'></asp:TextBox>
                               </EditItemTemplate>
                               <ItemTemplate>
                                   <asp:TextBox ID="firstTxtbox" runat="server" Text='<%# Bind("first") %>'></asp:TextBox>
                               </ItemTemplate>
                           </asp:TemplateField>
                           <asp:TemplateField HeaderText="second" SortExpression="second">
                               <EditItemTemplate>
                                   <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("second") %>'></asp:TextBox>
                               </EditItemTemplate>
                               <ItemTemplate>
                                   <asp:TextBox ID="secondTxtbox" runat="server" Text='<%# Bind("second") %>'></asp:TextBox>
                               </ItemTemplate>
                           </asp:TemplateField>
                           <asp:TemplateField HeaderText="third" SortExpression="third">
                               <EditItemTemplate>
                                   <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("third") %>'></asp:TextBox>
                               </EditItemTemplate>
                               <ItemTemplate>
                                   <asp:TextBox ID="thirdTxtbox" runat="server" Text='<%# Bind("third") %>'></asp:TextBox>
                               </ItemTemplate>
                           </asp:TemplateField>
                           <asp:TemplateField HeaderText="fourth" SortExpression="fourth">
                               <EditItemTemplate>
                                   <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("fourth") %>'></asp:TextBox>
                               </EditItemTemplate>
                               <ItemTemplate>
                                   <asp:TextBox ID="fourthTxtbox" runat="server" Text='<%# Bind("fourth") %>'></asp:TextBox>
                               </ItemTemplate>
                           </asp:TemplateField>
                           <asp:BoundField DataField="SMTRID" HeaderText="SMTRID" ReadOnly="True" SortExpression="SMTRID" Visible="False" />
                          
                       </Columns>
                    </asp:GridView>
        
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
