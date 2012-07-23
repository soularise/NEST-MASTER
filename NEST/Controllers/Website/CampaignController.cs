using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Routing;
using NEST.Models;

namespace NEST.Controllers
{
    public class CampaignController : Controller
    {
        //
        // GET: /Custom/
        private NESTV1Entities db = new NESTV1Entities();

        public ActionResult Index(string pagename = "SEOdefault")
        {


            try
            {
                ContentBody contentbody = db.ContentBodies.Single(c => c.SEOUrl.ToLower() == pagename.ToLower());
                return View("Index", contentbody);
            }
            catch
            {

                ContentBody contentbody = db.ContentBodies.Single(c => c.SEOUrl == "SEOdefault");
                return View("Index", contentbody);

            }


        }




    }

}
