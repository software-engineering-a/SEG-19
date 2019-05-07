using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using RMS.Models;
using System.Configuration;
using System.Data.SqlClient;

namespace RMS.Controllers
{
    public class JobListController : Controller
    {
        // GET: JobList
        public ActionResult JobList()
        {
            string connStr = ConfigurationManager.ConnectionStrings["RMS"].ConnectionString;
            SqlConnection conn = new SqlConnection(connStr);

            string sql = "SELECT * from jobs";
            SqlCommand cmd = new SqlCommand(sql, conn);
            conn.Open();

            SqlDataReader reader = cmd.ExecuteReader();
            List <Job> jobsList = new List<Job>();

            while (reader.Read())
            {
                Job job = new Job();
                job.id = (int)reader["id"];
                job.title = (string)reader["title"];
                job.description = (string)reader["description"];
                job.designation = (int)reader["designation"];
                job.department = (int)reader["department"];
                job.skills = (string)reader["skills"];
                job.salary = (int)reader["salary"];
                job.minExperience = (int)reader["minExperience"];
                jobsList.Add(job);
            }

            conn.Close();
            return View(jobsList);
            
        }
    }
}