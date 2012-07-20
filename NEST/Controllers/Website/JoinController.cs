using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Xml;
using NEST.Models;
using NEST.Controllers.Common;
using System.IO;
using System.Net;
using System.Text;

namespace NEST.Controllers
{
    public class JoinController : Controller
    {

        private NESTV1Entities db = new NESTV1Entities();

        public ActionResult Index()
        {
            return View();
        }

        public ActionResult ThankYou()
        {
            return View("JoinThankYou");
        }

        [HttpPost]
        public ActionResult Index(Registrant registrant)
        {
            if (ModelState.IsValid)
            {
                db.Registrants.AddObject(registrant);
                db.SaveChanges();
                // send off to NGP
                NGPAPI thisNGPPoster = new NGPAPI();
                thisNGPPoster.postUserToNGP(registrant);    
                
                return RedirectToAction("ThankYou");

            }

            return View(registrant);
        }




    }
}
