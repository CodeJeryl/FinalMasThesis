<%@ Page Title="" Language="C#" MasterPageFile="~/My.Master" AutoEventWireup="true" CodeBehind="xlog.aspx.cs" Inherits="HS_Communications_Website.log" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="row" style="margin-left:26% !important" >
    
       
    <div class="large-9 columns large-offset-3 columns" >
    <div style="position: absolute; top: 135px; width: 436px;">
         <h2>Admin Login</h2>
    <asp:Label ID="Label1" runat="server" Text=""></asp:Label><br/>
       <span class="label">Username</span>
    <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox><br/>
         <span class="label">Password</span>
    <asp:TextBox ID="TextBox2" runat="server" TextMode="Password"></asp:TextBox><br/>
    <asp:Button ID="Button1" runat="server" Text="Button" OnClick="Button1_Click" CssClass="button"/>
        </div>
           </div>
          </div>
</asp:Content>
