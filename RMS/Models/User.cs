using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace RMS.Models
{
    public class User
    {
        public int id { get; set; }
        public string firtName { get; set; }
        public string lastName { get; set; }
        public string department { get; set; }
        public string designationApplied { get; set; }
        public string degree { get; set; }
        public string institute { get; set; }
        public int experience { get; set; }

        public string recentOrganization { get; set; }

        public string designationCurrent { get; set; }

        public string jobTitle { get; set; }

        public Job job { get; set; }
    }
}