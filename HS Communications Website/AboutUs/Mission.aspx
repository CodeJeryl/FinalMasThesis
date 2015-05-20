<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Mission.aspx.cs" Inherits="LetranWebsite2014.Colegio.AboutUs.Mission" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="../../stylesheets/skins/teal.css" rel="stylesheet" />
    <link href="../../stylesheets/letran/Subhead.css" rel="stylesheet" />
    <link href="../../stylesheets/style.css" rel="stylesheet" />
    <link href="../../stylesheets/responsive.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="subheader">
	<div class="row">
		<div class="twelve columns" style="color: #FFFFFF; font-size: x-large">
			<c style=" font-size: 24px;"><strong>The Mission, Vision & Creed of Letran</strong></c></div>
	</div>
</div>
  
<div class="hr">
</div>
<!-- CONTENT 
================================================== -->
<div class="row">
    <!-- MAIN CONTENT-->
	<div class="eight columns">
	    <!-- Our History-->
		<div class="sectiontitle">
			<h4><strong class="colhead" >MISSION</strong></h4>
		</div>
        <div class="colp">
           
                <span  >&nbsp;&nbsp;&nbsp;&nbsp;We, the Colegio de San Juan de Letran, a Dominican institution of learning, commit ourselves to the quality formation of integral human persons in the noble tradition of excellence and the supreme ideals of :<br />
                <br />
                <span style="margin-left: 210px"> DEUS,PATRIA,LETRAN. </span><br />
                <br />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Specifically, we endeavor to form the Letran community to become:
                    <br /><br />
                <div style="margin-left: 100px"> <asp:BulletedList ID="BulletedList1" runat="server" BorderStyle="None" BulletStyle="Disc">
                    <asp:ListItem>Staunch defenders of the Church;</asp:ListItem>
                    <asp:ListItem>Faithful devotees of Mary;</asp:ListItem>
                    <asp:ListItem>Ardent lovers of Truth;</asp:ListItem>
                    <asp:ListItem>Dynamic builders and leaders of communities; and</asp:ListItem>
                    <asp:ListItem>Successful professionals in their chosen fields of endeavors.</asp:ListItem>
                </asp:BulletedList></div>
                    <br />
                </span><strong ><span class="colhead1">VISION</span></strong><br   />
                <br   />
                <span  >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; We envision a model Christ-centered, nationally responsive and globally competitive Colegio de San Juan de Letran-Bataan recognized in the region as:<br /><br />
             
                
                    <div style="margin-left: 100px">    <asp:BulletedList ID="BulletedList2" runat="server" BulletStyle="Disc">
                            <asp:ListItem>a premier college offering quality academic programs,</asp:ListItem>
                            <asp:ListItem>a leader in relevant research and community service,</asp:ListItem>
                            <asp:ListItem>an oasis for spiritual growth and a center for professional development,</asp:ListItem>
                            <asp:ListItem>a key player in advocating care for creation &amp; quality of life; and</asp:ListItem>
                            <asp:ListItem>an emerging University Town</asp:ListItem>
                        </asp:BulletedList></div>
                    <br />
              
                </span><span class="colhead1"  ><strong>CREED</strong></span><span  ><span  >&nbsp;</span></span><br   />
                <br   />
                <span  >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; I am a Letranite and I will continue to live my days as one for God, for the Fatherland and for my beloved Alma Mater.<span  >&nbsp;</span><br />
                </span>
            <br/>
		
        </div>
        
	</div><!-- end main content-->

	<!-- SIDEBAR-->
	<div class="four columns">
        <a href="http://www.letran.edu/" target="_blank">
		<div class="teamwrap teambox">
            <img src="../../images/12.jpg" alt="">
			<div class="mask" style="background-image: url('../../images/17.jpg');background-size:cover; ">
				<h2 style="text-shadow:2px 2px 2px rgba(0, 0, 0, 0.91);background-color:rgba(0, 0, 0, 0.20);">Letran Manila</h2>
                <p></p>
					
				</div>
			</div>
            </a>
        <a href="http://letran-calamba.edu.ph/" target="_blank">
			<div class="teamwrap teambox">
				<img src="../../images/13.jpg" alt="">
				<div class="mask" style="background-image: url('../../images/18.jpg');background-size:cover;">
					<h2 style="text-shadow:2px 2px 2px rgba(0, 0, 0, 0.91);background-color:rgba(0, 0, 0, 0.20);">Letran Calamba</h2>
					<p>
						
						
					</div>
			</div>
            </a>
			<a href="http://www.letranbataan.com" target="_blank">
                <div class="teamwrap teambox">
					<img src="../../images/14.JPG" alt="" >
					<div class="mask" style="background-image: url('../../images/15.JPG');background-size:cover; ">
						<h2 style="text-shadow:2px 2px 2px rgba(0, 0, 0, 0.91);background-color:rgba(0, 0, 0, 0.20);">Letran Bataan</h2>
						<p></p>
							
						
					</div>
                	
			</div></a>
        
          <a href="#" target="_blank">
                <div class="teamwrap teambox">
					<img src="../../images/Colegio/maoag1.jpg" alt="" >
					<div class="mask" style="background-image: url('../../images/Colegio/maoag.jpg');background-size:cover; ">
						<h2 style="text-shadow:2px 2px 2px rgba(0, 0, 0, 0.91);background-color:rgba(0, 0, 0, 0.20);">Letran Manaoag</h2>
						<p></p>
							
						
					</div>
                	
			</div></a>
	</div><!-- end sidebar -->
        </div>
<div class="hr">
</div>
    
<!-- JAVASCRIPTS 
================================================== -->
<!-- Javascript files placed here for faster loading -->
<script src="../../javascripts/foundation.min.js"></script>
<script src="../../javascripts/formvalidation.js"></script>
<script src="../../javascripts/jquery.cycle.js"></script>
<script src="../../javascripts/app.js"></script>
<script src="../../javascripts/modernizr.foundation.js"></script>
<script src="../../javascripts/slidepanel.js"></script>
<script src="../../javascripts/scrolltotop.js"></script>
<script src="../../javascripts/hoverIntent.js"></script>
<script src="../../javascripts/superfish.js"></script>
<script src="../../javascripts/responsivemenu.js"></script>

</asp:Content>
