﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HS_Communications_Website.Admin
{
    public partial class PrintClass : System.Web.UI.Page
    {
        Report2 r = new Report2();
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
               ReportViewer1.ReportSource = r;
                ReportViewer1.RefreshReport();
            }
           
        }
    }
}