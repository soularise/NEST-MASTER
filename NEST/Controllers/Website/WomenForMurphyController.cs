using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net.Mail;
using System.Web;
using System.Web.Mvc;
using NEST.Models;
using NEST.Common;

namespace NEST.Controllers
{
    public class WomenForMurphyController : Controller
    {
        private NESTV1Entities db = new NESTV1Entities();

        public ActionResult Index()
        {
            var contentbodies = db.ContentBodies.Where(c => c.SEOUrl == "women").OrderBy(s => s.SortOrder).ToList();
            return View(contentbodies.ToList());
        }

        public ActionResult ThankYou()
        {
            return View("WomenThankYou");
        }

        [HttpPost]
        public ActionResult Index(Registrant registrant)
        {
            if (ModelState.IsValid)
            {
                db.Registrants.AddObject(registrant);
                db.SaveChanges();

                MailHandler thisMailer = new MailHandler();
                thisMailer.SendContactEmail(registrant);

                return RedirectToAction("ThankYou");

            }

            return View(registrant);
        }

    }
}
