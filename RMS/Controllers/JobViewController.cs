using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Configuration;
using System.Data.SqlClient;
using RMS.Models;

namespace RMS.Controllers
{
    public class JobViewController : Controller
    {
        int jobId;
        Job job = new Job();
        // GET: JobView
        [HttpGet]
        public ActionResult JobView(int id)
        {
            jobId = id;
            job.users = new List<User>();

            string connStr = ConfigurationManager.ConnectionStrings["RMS"].ConnectionString;
            SqlConnection conn = new SqlConnection(connStr);

            string sql = "SELECT * from jobs where id="+jobId+"";
            SqlCommand cmd = new SqlCommand(sql, conn);
            conn.Open();
            SqlDataReader reader = cmd.ExecuteReader();
            while (reader.Read())
            {
                job.id = (int)reader["id"];
                job.title = (string)reader["title"];
                job.description = (string)reader["description"];
                job.designation = (int)reader["designation"];
                job.department = (int)reader["department"];
                job.skills = (string)reader["skills"];
                job.minExperience = (int)reader["minExperience"];
            }
            conn.Close();


            string sql1 = "SELECT office.city from office";
            SqlCommand cmd1 = new SqlCommand(sql1, conn);
            conn.Open();
            SqlDataReader reader1 = cmd1.ExecuteReader();

            job.city = new List<string>();
            while (reader1.Read())
            {
                string c = (string)reader1["city"];
                job.city.Add(c);
            }
            conn.Close();

            string sql2 = "select distinct instituteName from education";
            SqlCommand cmd2 = new SqlCommand(sql2, conn);
            conn.Open();
            SqlDataReader reader2 = cmd2.ExecuteReader();

            job.institute = new List<string>();
            while (reader2.Read())
            {
                string i = (string)reader2["instituteName"];
                job.institute.Add(i);
            }
            conn.Close();


            string sql3 = "select distinct degreeName from education";
            SqlCommand cmd3 = new SqlCommand(sql3, conn);
            conn.Open();
            SqlDataReader reader3 = cmd3.ExecuteReader();

            job.degree = new List<string>();
            while (reader3.Read())
            {
                string d = (string)reader3["degreeName"];
                job.degree.Add(d);
            }
            conn.Close();

            string sql4 = "select * from department";
            SqlCommand cmd4 = new SqlCommand(sql4, conn);
            conn.Open();
            SqlDataReader reader4 = cmd4.ExecuteReader();

            job.dept = new List<string>();
            while (reader4.Read())
            {
                string d = (string)reader4["name"];
                job.dept.Add(d);
            }
            conn.Close();

            string sql5 = "select B.UID, B.FirstName, B.LastName, B.dept, B.desig, education.degreeName, education.instituteName " +
                "from education inner join (select A.UID, A.FirstName, A.LastName, A.dept, designation.name as desig " +
                "from designation inner join (select Z.UID, Z.FirstName, Z.LastName, Z.designation, department.name as dept " +
                "from department inner join (select Y.UID, users.FirstName, users.LastName, Y.designation, Y.department " +
                "from users inner join (select applications.UID, X.title, X.designation, X.department " +
                "from applications inner join (select * " +
                "from jobs where jobs.ID = "+jobId+") as X on X.ID = applications.JID) as Y on users.ID = Y.UID) as Z on department.ID = Z.department) " +
                "as A on A.designation = designation.ID) as B on B.UID = education.UID";
            SqlCommand cmd5 = new SqlCommand(sql5, conn);
            conn.Open();

            SqlDataReader reader5 = cmd5.ExecuteReader();

            while (reader5.Read())
            {
                User user = new User();
                user.firtName = (string)reader5["FirstName"];
                user.lastName = (string)reader5["LastName"];
                user.id = (int)reader5["UID"];
                user.jobTitle = job.title;
                user.department = (string)reader5["dept"];
                user.designationApplied = (string)reader5["desig"];
                user.degree = (string)reader5["degreeName"];
                user.institute = (string)reader5["instituteName"];

                job.users.Add(user);

            }
            conn.Close();

            return View(job);
        }

        [HttpPost]
        // Post: JobView
        public ActionResult JobView(int id, string name, string designation, string experience, 
            string city, string degree, string field, string inst, string dept) {

            string connStr = ConfigurationManager.ConnectionStrings["RMS"].ConnectionString;
            SqlConnection conn = new SqlConnection(connStr);

          
            

            return View();
        }
    }
}