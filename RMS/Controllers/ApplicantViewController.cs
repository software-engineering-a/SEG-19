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
    public class ApplicantViewController : Controller
    {
        int userID;
        [HttpGet]
        // GET: ApplicantView
        public ActionResult Index(int id)
        {
            userID = id;
            string connStr = ConfigurationManager.ConnectionStrings["RMS"].ConnectionString;
            SqlConnection conn = new SqlConnection(connStr);

            string sql = "SELECT * from users where id=" + userID + "";

            SqlCommand cmd = new SqlCommand(sql, conn);
            conn.Open();
            SqlDataReader reader = cmd.ExecuteReader();

            while (reader.Read())
            {

            }


            return View();
        }
    }
}