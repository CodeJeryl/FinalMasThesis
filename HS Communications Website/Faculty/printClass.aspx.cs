﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using HS_Communications_Website.Admin;

namespace HS_Communications_Website.Faculty
{
    public partial class printClass : System.Web.UI.Page
    {
        Report2 r = new Report2();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ReportViewer1.ReportSource = r;
                ReportViewer1.RefreshReport();
            }

        }
    }
}