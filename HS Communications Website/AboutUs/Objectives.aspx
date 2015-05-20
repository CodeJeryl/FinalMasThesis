<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Objectives.aspx.cs" Inherits="LetranWebsite2014.Colegio.AboutUs.Objectives" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            font-size: medium;
        }
        .auto-style2 {
            font-size: 25px;
        }

    </style>
    
    <link href="../../stylesheets/skins/teal.css" rel="stylesheet" />
    <link href="../../stylesheets/letran/Subhead.css" rel="stylesheet" />
    <link href="../../stylesheets/style.css" rel="stylesheet" />
    <link href="../../stylesheets/responsive.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div id="subheader">
	<div class="row">
		<div class="twelve columns" style="color: #FFFFFF; font-size: x-large">
			<c style=" font-size: 24px;"><strong>The Objectives of Colegio de San Juan de Letran</strong></c></div>
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
			<h4><strong class="colhead" >OBJECTIVES</strong></h4>
		</div>
        <div class="colp">
           <div >
             <span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Colegio is a Dominican Institution of learning, tasked to form a student to become a person who has integrated within himself the natural and supernatural aspects of 
                Catholic education, that will effectively prepare him for his bounded duties as citizen of his country and a child of the Holy Mother Church.Specifically, the student shall become a person who:</span><br   />
                <br   />
                <span class="colhead1"  >Spiritually<br /><br />
                </span><div style="margin-left: 100px" >
                 <asp:BulletedList ID="BulletedList8" runat="server" BulletStyle="Square" Font-Names="'Book Antiqua'" Font-Size="15px" CssClass="auto-style2">
                        <asp:ListItem Value="Lives a life of constant witnessing to the gospel message of Jesus Christ;"></asp:ListItem>
                        <asp:ListItem Value="Practices the faith, solidly based on sound Catholic doctrine;"></asp:ListItem>
                        <asp:ListItem Value="Fearlessly stands up in the defense of his faith;"></asp:ListItem>
                        <asp:ListItem Value="Possesses a strong community spirit;"></asp:ListItem>
                        <asp:ListItem Value="Is an ardent devotee of the Blessed Mother Mary and the Rosary, St. Dominic and other Dominican saints."></asp:ListItem>
                    </asp:BulletedList>
                </div><span class="colhead1"   >
                <br />
                Volitionally<br /><br /><br />
                </span><div style="margin-left: 100px" >
                 <asp:BulletedList ID="BulletedList7" runat="server" BulletStyle="Square" Font-Names="'Book Antiqua'" Font-Size="15px" CssClass="auto-style2">
                        <asp:ListItem Value="Possesses a high degree of responsibility; a person who is a master of his own action;"></asp:ListItem>
                        <asp:ListItem Value="Always decides according to God’s will."></asp:ListItem>
              
                  
                        
                    </asp:BulletedList>
                </div><span class="colhead1"   >
                <br />
                Intellectually<br /><br />
                </span><div style="margin-left: 100px">
                 <asp:BulletedList ID="BulletedList6" runat="server" BulletStyle="Square" Font-Names="'Book Antiqua'" Font-Size="15px" CssClass="auto-style2">
                        <asp:ListItem Value="Has uncompromising passion for truth;"></asp:ListItem>
                        <asp:ListItem Value="Possesses the ability to think critically, analyze, synthesize and form right judgment;"></asp:ListItem>
                   <asp:ListItem Value="Organizes and applies knowledge to real - life situations."></asp:ListItem>
                  
                        
                    </asp:BulletedList>
                </div><span class="colhead1"   >
                <br />
                Socially<br /><br />
                </span><div style="margin-left: 100px" >
               <asp:BulletedList ID="BulletedList5" runat="server" BulletStyle="Square" Font-Names="'Book Antiqua'" Font-Size="15px" CssClass="auto-style2">
                        <asp:ListItem Value="Actively participates in the affairs of the Church and society;"></asp:ListItem>
                        <asp:ListItem Value="Is a respected leader in the society;"></asp:ListItem>
                   <asp:ListItem Value="Works for the betterment of the marginalized members of the society;"></asp:ListItem>
                   <asp:ListItem Value="Is an altruist, manifested in his active concern for others."></asp:ListItem>
                        
                    </asp:BulletedList>
                </div><span class="colhead1"   >
                <br />
                Culturally<br /><br />
                </span><div style="margin-left: 100px" >
                <asp:BulletedList ID="BulletedList4" runat="server" BulletStyle="Square" Font-Names="'Book Antiqua'" Font-Size="15px" CssClass="auto-style2">
                        <asp:ListItem Value="Adheres to traditional Filipino values, enriched by the Catholic teachings;"></asp:ListItem>
                        <asp:ListItem Value="Is proud of his heritage, customs and traditions which make the Filipino unique in the world"></asp:ListItem>
                        
                    </asp:BulletedList>
                </div><span class="colhead1"   >
                <br />
                Psychologically<br /><br />
                </span><div style="margin-left: 100px" >
                <asp:BulletedList ID="BulletedList3" runat="server" BulletStyle="Square" Font-Names="'Book Antiqua'" Font-Size="15px" CssClass="auto-style2">
                        <asp:ListItem Value="Manifests a well-balanced personality."></asp:ListItem>                      
                    </asp:BulletedList>
               </div>
                <br />
              <span class="colhead1" >  Physically</span><br /><br /><div style="margin-left: 100px" >
                <asp:BulletedList ID="BulletedList2" runat="server" BulletStyle="Square" Font-Names="'Book Antiqua'" Font-Size="15px" CssClass="auto-style2">
                        <asp:ListItem Value="Shows a state of physical well-being;"></asp:ListItem>
                        <asp:ListItem Value="Cares for his body as the temple of the Holy Spirit."></asp:ListItem>
                       
                    </asp:BulletedList>
                </div><span class="colhead1"   >
                <br />
                Professionally<br /><br />
                </span><div style="margin-left: 100px">
                    <asp:BulletedList ID="BulletedList1" runat="server" BulletStyle="Square" Font-Names="'Book Antiqua'" Font-Size="15px" CssClass="auto-style2">
                        <asp:ListItem Value="Is an asset to the society;"></asp:ListItem>
                        <asp:ListItem Value="Is prepared to meet the demands and challenges of his chosen profession;"></asp:ListItem>
                         <asp:ListItem Value="Creates opportunities for the improvement of the quality of life; and"></asp:ListItem>
                        <asp:ListItem Value="Is a world class professional, a person whose core competencies and skills are honed overtime."></asp:ListItem>
                    </asp:BulletedList>
                    </div>
                <br />
              <br   />
          
            <br/>
		</div>
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
     </span>
</asp:Content>
