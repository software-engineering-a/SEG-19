using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace RMS.Models
{
    public class Job
    {
        public int id {get; set;}

        public int userId { get; set; }
        public string title { get; set; }
        public string description { get; set; }
        public int designation { get; set; }
        public int department { get; set; }
        public string skills { get; set; }
        public int office { get; set; }
        public int minEducation { get; set; }
        public int minExperience { get; set; }
        public int minAge { get; set; }
        public int maxAge { get; set; }
        public string gender { get; set; }
        public string closingDate { get; set; }
        public int salary { get; set; }

        public string benefits { get; set; }
        public string detailDocuments { get; set; }
        public string status { get; set; }
        public int duration { get; set; }
        public string type { get; set; }
        public int startDate { get; set; }
        public int endDate { get; set; }

        public List<String> city { get; set; }
        public List<String> degree { get; set; }
        public List<String> field { get; set; }

        public List<String> institute { get; set; }

        public List<String> dept { get; set; }

        public User user { get; set; }
        public List<User> users { get; set; }
    }
}