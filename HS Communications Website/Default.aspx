<%@ Page Title="" Language="C#" MasterPageFile="~/MainMaster.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="HS_Communications_Website.Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">


    <link href="stylesheets/letran/Subhead.css" rel="stylesheet" />

    <link rel="stylesheet" href="stylesheets/style.css">
    <link rel="stylesheet" href="stylesheets/homepage.css">
    <!-- homepage stylesheet -->
    <link rel="stylesheet" href="stylesheets/skins/teal.css">
    <!-- skin color -->
    <link rel="stylesheet" href="stylesheets/responsive.css">
    <link href="stylesheets/letran/lightbox.css" rel="stylesheet" />

    <style>
        #container {
	width: 900px;
	margin: 20px auto;
	padding: 30px;
	overflow: hidden;
	background-color: #fff;
	position: relative;
	-webkit-box-shadow: 0px 1px 2px -1px rgba(0, 0, 0, 0.6);
	-moz-box-shadow: 0px 1px 2px -1px rgba(0, 0, 0, 0.6);
	box-shadow: 0px 1px 2px -1px rgba(0, 0, 0, 0.6);
}

        img.responsiveslide
        {
            height: 100% !important;
            /*margin-left: -28.5px !important;*/
            margin-top: 0 !important;
            /* width: 1400px !important;*/
        }
        .mar
        {
            margin-left: 20px;
        }

        .teambox p
        {
            color: #333;
            -ms-filter: "progid: DXImageTransform.Microsoft.Alpha(Opacity=0)";
            filter: alpha(opacity=0);
            opacity: 0;
            -webkit-transform: scale();
            -moz-transform: scale();
            -o-transform: scale();
            -ms-transform: scale();
            transform: scale();
            -webkit-transition: all 0.5s linear;
            -moz-transition: all 0.5s linear;
            -o-transition: all 0.5s linear;
            -ms-transition: all 0.5s linear;
            transition: all 0.5s linear;
        }

        .teambox h2
        {
            border-bottom: 1px solid rgba(0, 0, 0, 0.3);
            background: transparent;
            margin: 2px 5px 0px 5px !important;
            -webkit-transform: scale();
            -moz-transform: scale();
            -o-transform: scale();
            -ms-transform: scale();
            transform: scale();
            color: #333;
            -webkit-transition: all 0.5s linear;
            -moz-transition: all 0.5s linear;
            -o-transition: all 0.5s linear;
            -ms-transition: all 0.5s linear;
            transition: all 0.5s linear;
            -ms-filter: "progid: DXImageTransform.Microsoft.Alpha(Opacity=0)";
            filter: alpha(opacity=0);
            opacity: 0;
        }

        .button1
        {
            -webkit-transition: background-color 0.15s ease-in-out;
            background: #e90329 !important;
            border: 0;
            color: white;
            cursor: pointer;
            display: inline-block;
            font-family: 'Helvetica Neue', Helvetica, Helvetica, Arial, sans-serif;
            font-size: 14px;
            font-weight: bold;
            line-height: 1;
            margin: 0;
            outline: none;
            overflow: hidden;
            padding: 14px 25px 17px !important;
            /*position: relative;*/
            text-align: center;
            text-decoration: none;
            transition: background-color 0.15s ease-in-out;
            width: auto;
            opacity: 0.6;
        }

        a.button1:hover
        {
            background: #950019 !important;
            opacity: 1;
        }

        ul.qwer img
        {
            width: 100%;
            height: 80%;
        }

        .teambox h2 {
            font-size: 14px !important;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <%-- <div id="container" class="opacity">  </div>--%>
    <!-- SLIDER 
================================================== -->
    <%--   <div class="row" style="width: 100% !important">

        <div class="twelve columns">

            <ul data-orbit data-options="timer_speed: 4000;bullets: false;animation_speed:1500;slide_number:false;pause_on_hover: false">
                <li>
                    <img src="images/newsbanner/orbit1.jpg" />
                </li>
                <li class="active">
                    <img src="images/newsbanner/orbit2.jpg" />
                </li>
                <li>
                    <img src="images/newsbanner/orbit3.jpg" />
                </li>
                <li>
                    <img src="images/newsbanner/orbit4.jpg" />
                </li>
                <li>
                    <img src="images/newsbanner/orbit5.jpg" />
                </li>
                
            </ul>

        </div>
    </div>--%>


    <div id="ei-slider" class="ei-slider">
        <ul class="ei-slider-large">
            <li>
                <img src="images/newsbanner/2.jpg" class="responsiveslide">
                <%--<div class="ei-title">
			<h2>High School students aim for K12 development</h2>  10px 40px 0px 40px
			<h3 style="margin-top: 0px;">K-12 in Letran Bataan.</h3>
		</div>--%>
            </li>
           <%--  <li>
                <img src="images/newsbanner/1.jpg" alt="Binyag Arriba 2015" class="responsiveslide">
            
            </li>--%>
       <%--     <li>
                <a href="Admissions/ProcedureRequirements.aspx">
                    <img src="images/newsbanner/3.jpg" class="responsiveslide"></a>
                <div class="ei-title">
                    <h2 style="margin-top: 0px; font-size: 20px"><a href="Admissions/ProcedureRequirements.aspx" style="color: white">Click here for Admissions Requirements</a></h2>
                    <h3 style="margin-top: 0px; font-size: 20px"><a href="Admissions/Online.aspx">Click here to Apply Online Now!</a></h3>
                </div>
            </li>--%>
            <li>
                <img src="images/newsbanner/4.jpg" alt="image04" class="responsiveslide">
                <%--<div class="ei-title">
			<h2>High School students aim for K12 development</h2>
			<h3 style="margin-top: 0px;">K-12 in Letran Bataan.</h3>
		</div>--%>
            </li>
            <%--    <li>
                <img src="images/newsbanner/orbit5.jpg" alt="image05" class="responsiveslide">
                <div class="ei-title">
			<h2>High School students aim for K12 development</h2>
			<h3 style="margin-top: 0px;">K-12 in Letran Bataan.</h3>
		</div>
            </li>--%>
        </ul>
        <!-- slider-thumbs -->

        <ul class="ei-slider-thumbs">
            <li class="ei-slider-element">Current</li>
            <li><a href="#">Slide 1</a><img src="images/newsbanner/2.jpg" class="slideshowthumb" alt="thumb01" /></li>
           <%-- <li><a href="#">Slide 2</a><img src="images/newsbanner/1.jpg" class="slideshowthumb" alt="thumb02" /></li>--%>
            <li><a href="#">Slide 3</a><img src="images/newsbanner/3.jpg" class="slideshowthumb" alt="thumb03" /></li>
       <%--     <li><a href="#">Slide 4</a><img src="images/newsbanner/4.jpg" class="slideshowthumb" alt="thumb04" /></li>--%>
            <%--  <li><a href="#">Slide 5</a><img src="images/newsbanner/orbit5.jpg" class="slideshowthumb" alt="thumb05" /></li>--%>
        </ul>
    </div>

    <div class="minipause">
    </div>
    <!-- SUBHEADER
================================================== -->
    <div id="subheader">
        <div class="row">
            <div class="twelve columns">
                <div class="text-center">
                    <p>To all candidates for graduation, Batch 2015; Deadline of submission of the exit clearance to the <br/> Office of the Registrar is on March 20, 2015 </p>
                </div>
            </div>
        </div>
    </div>

    <!-- CONTENT 
================================================== -->

    <div class="row">
        <div class="eight columns">
            <div class="centersectiontitle">
                <br />
                <h4>Message from the Principal</h4>

            </div>

            <%--<p class="colhead1" style="text-align: center"><strong>We are now accepting applicants for Grade 7 and College SY 2015-2016! </strong></p>--%>
           
          
           <p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; It gives me a great pleasure as Principal of the Colegio de San Juan de Letran – Bataan High School to welcome you to the official high school website. This website has been prepared in the hope that it will become a valuable source of school news and timely 
          information for parents, students, and visitors to the site.</p> 
        <p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; This website has been developed to enable everyone to become familiar with our school, its policies, and other procedures that are basic for the smooth operation of our school, as well as to provide you with updated school news, schedule and events.   </p>
  
        <p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Our school has a very long historic tradition and our staff takes great pride in providing a safe and secured learning environment and at the same time offering a wide array of exciting and challenging academic programs. Our extensive line-up of extra-curricular activities, both academic and recreational, is unparalleled. Our entire staff is committed to establishing a school environment that allows our students to flourish and to grow intellectually, emotionally, and socially.</p>
    
        <p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; With this in mind , our website will be updated regularly so as to provide visitors with updated notices and bulletins and other news on a variety of subject matters. I am encouraging Letran High School staff members, as well as the Family Council, the school clubs and organizations to be regular contributors to the website.</p>
            </div>
         <div class="four columns">
             <div class="centersectiontitle">
                <br />
                <h4>Important Dates</h4>
            </div>
        <ul class="latest-posts">
          <li><span class="date"><em class="day">27</em><em class="month">Mar</em></span> <br/><a href="#">Baccalaureate Mass</a> </li>
          <li><span class="date"><em class="day">30</em><em class="month">Mar</em></span> <br/><a href="#">1st Commencement Exercises </a> </li>
          <li><span class="date"><em class="day">7</em><em class="month">Apr</em></span><br/> <a href="#">Encoding of Grades</a> </li>
          <li><span class="date"><em class="day">13</em><em class="month">Apr</em></span> <br/><a href="#">Start of Enrollment</a> </li>
              <li><span class="date"><em class="day">22</em><em class="month">Jun</em></span><br/> <a href="#">Start of Classes</a> </li>
        </ul>
        

    </div>
    </div>


    <div class="row">
       <%-- <div class="six columns">
            <div class="centersectiontitle">
                <br />
                <h4>Announcement</h4>
                
            </div>

                 <p class="colhead" style="font-weight: 700; text-align: center; color: black;font-size: 17px">View your Grades online now! Visit <a href="http://My.letranbataan.edu.ph" target="_blank">My.LetranBataan.edu.ph</a></p>
            
                  <p class="colhead" style="font-weight: 700; text-align: center; color: black;font-size: 17px">     </p>
                

            </div>--%>
       
       </div>

 

    <div class="row">
        <div class="twelve columns">
           <div class="centersectiontitle">
                <br />
                <h4>Gallery</h4>

            </div>
             
                        <span style="padding: 30px"><a href="images/HighSchool/IMG1.jpg" data-lightbox="facilities">
                            <img src="images/HighSchool/IMG1.jpg" width="255px"/>
                        </a></span>
                        <span style="padding: 30px"><a href="images/HighSchool/IMG2.jpg" data-lightbox="facilities">
                            <img src="images/HighSchool/IMG2.jpg" width="255px"/>
                        </a></span>
                        <span style="padding: 30px"><a href="images/HighSchool/IMG3.jpg" data-lightbox="facilities">
                            <img src="images/HighSchool/IMG3.jpg" width="255px"/>
                        </a></span> 
                        <span style="padding: 30px"><a href="images/HighSchool/IMG4.jpg" data-lightbox="facilities">
                            <img src="images/HighSchool/IMG4.jpg" width="255px"/>
                        </a></span>
                        <span style="padding: 30px"><a href="images/HighSchool/IMG5.jpg" data-lightbox="facilities">
                            <img src="images/HighSchool/IMG5.jpg" width="255px"/>
                        </a></span>
                        <span style="padding: 30px"><a href="images/HighSchool/IMG6.jpg" data-lightbox="facilities">
                            <img src="images/HighSchool/IMG6.jpg" width="255px"/>
                        </a></span>
                   <br/>
                    
                    <span style="position: absolute; left:78%; color: darkred;font-size: 15px">More pictures. <a href="#">Click here</a></span>

            
            
            

        </div>
    </div>
    
    <!-- JAVASCRIPTS 
        ================================================== -->

    <!-- Javascript files placed here for faster loading -->



    <script src="javascripts/foundation.min.js"></script>
    <script src="javascripts/jquery.easing.1.3.js"></script>
    <script src="javascripts/elasticslideshow.js"></script>
    <script src="javascripts/jquery.carouFredSel-6.0.5-packed.js"></script>
    <script src="javascripts/jquery.cycle.js"></script>
    <script src="javascripts/app.js"></script>
    <script src="javascripts/modernizr.foundation.js"></script>
    <script src="javascripts/slidepanel.js"></script>
    <script src="javascripts/scrolltotop.js"></script>
    <script src="javascripts/hoverIntent.js"></script>
    <script src="javascripts/superfish.js"></script>
    <script src="javascripts/responsivemenu.js"></script>
    <script src="javascripts/gallery/jquery-1.11.0.min.js"></script>
    <script src="javascripts/gallery/lightbox.min.js"></script>
</asp:Content>
