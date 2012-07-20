using System;
using System.Xml.Linq;
using System.Xml.XPath;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using NEST.Models;

namespace NEST.Controllers
{
    public class ContentMaintenanceController : Controller
    {
        //
        private NESTV1Entities db = new NESTV1Entities();


        // GET: /ContentMaintenance/
        [Authorize]
        public ActionResult Index()
        {
            ViewData.Model = db.ContentSections.ToList();
            return View("ContentMaintenance");
        }

        // GET: /ContentMaintenance/SectionItems/5
        [Authorize]
        public ActionResult GetSectionItems(int id)
        {
            ContentSection contentSection = db.ContentSections.Single(c => c.Id == id);
            ViewBag.SectionTitle = contentSection.Header;
            ViewData.Model = db.ContentBodies.Where(c => c.ContentSection_ID == id).OrderBy(s => s.SortOrder).ToList();
            return View("SectionItems");
        }

        //
        // GET: /ContentMaintenance/Details/5
        [Authorize]
        public ActionResult UpdateSort()
        {
            int bodyId = Convert.ToInt32(Request.Form["section"]);
            int sortPosition = Convert.ToInt32(Request.Form["position"]);
            ContentBody contentBody = db.ContentBodies.Single(c => c.Id == bodyId);
            contentBody.SortOrder = sortPosition;
            db.SaveChanges();

            ContentSection contentSection = db.ContentSections.Single(con => con.Id == contentBody.ContentSection_ID);
            ViewBag.SectionTitle = contentSection.Header;
            ViewData.Model = db.ContentBodies.Where(cb => cb.ContentSection_ID == contentSection.Id).OrderBy(s => s.SortOrder).ToList();
            return View("SectionItems");

        }

        //
        // GET: /ContentMaintenance/Details/5
        [Authorize]
        public ActionResult Details(int id)
        {
            return View();
        }

        //
        // GET: /ContentMaintenance/Create
        [Authorize]
        public ActionResult CreateSection()
        {
            ViewBag.ContentTypeId = new SelectList(db.ContentTypes, "Id", "Description");
            return View();
        } 

        //
        // POST: /ContentMaintenance/Create

        [HttpPost, Authorize]
        public ActionResult CreateSection(ContentSection contentSection)
        {
            try
            {
                db.ContentSections.Attach(contentSection);
                db.ObjectStateManager.ChangeObjectState(contentSection, EntityState.Added);
                db.SaveChanges();
                ViewData.Model = db.ContentSections.ToList();
                return View("ContentMaintenance");
            } 
            catch
            {
                ViewBag.Error = "<span class='field-validation-error'> An error occured while processing this submission. Please try again.</span>";
                ViewBag.ContentTypeId = new SelectList(db.ContentTypes, "Id", "Description");
                return View("");
            }
        }
        
        //
        // GET: /ContentMaintenance/Edit/5
        [Authorize]
        public ActionResult Edit(int id)
        {
            try
            {
                ContentSection contentSection = db.ContentSections.Single(c => c.Id == id);
                return View(contentSection);
            }
            catch
            {
                ViewBag.Error = "<span class='field-validation-error'> An error occured while processing this submission. Please try again.</span>";
                ViewBag.ContentTypeId = new SelectList(db.ContentTypes, "Id", "Description");
                return View("");
            }
        }

        //
        // POST: /ContentMaintenance/Edit/5

        [HttpPost, Authorize]
        public ActionResult Edit(ContentSection contentSection)
        {

            if (ModelState.IsValid)
            {
                db.ContentSections.Attach(contentSection);
                db.ObjectStateManager.ChangeObjectState(contentSection, EntityState.Modified);
                db.SaveChanges();
                
            }
            return RedirectToAction("Index");
        }

        // GET: /ContentDetails/Delete/5

        public ActionResult Delete(int id)
        {
            ContentSection contentSection = db.ContentSections.Single(c => c.Id == id);
            return View(contentSection);
        }

        //
        // GET: /ContentMaintenance/Delete/5
        [Authorize]
        [HttpPost, ActionName("Delete")]
        public ActionResult DeleteConfirmed(int id)
        {
            ContentSection contentSection = db.ContentSections.Single(c => c.Id == id);
            db.ContentSections.DeleteObject(contentSection);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        //
        // POST: /ContentMaintenance/Delete/5

        //[HttpPost, Authorize]
        //public ActionResult Delete(int id, FormCollection collection)
        //{
        //    try
        //    {
        //        // TODO: Add delete logic here
 
        //        return RedirectToAction("Index");
        //    }
        //    catch
        //    {
        //        return View();
        //    }
        //}

        // GET: /ContentMaintenance/UpdateNews
        [Authorize]
        public ActionResult UpdateNews()
        {
            ViewData.Model = db.ContentBodies.Where(c => c.ContentSection_ID == 5).ToList();
            return View("UpdateNews");
        }

        // GET: /ContentMaintenance/UpdateEvents
        [Authorize]
        public ActionResult UpdateEvents()
        {
            //ViewData.Model = _db.ContentSections.ToList();
            return View("UpdateEvents");
        }

        // GET: /ContentMaintenance/MaintainGalleries
        [Authorize]
        public ActionResult MaintainGalleries()
        {
            //ViewData.Model = _db.ContentSections.ToList();
            return View("MaintainGalleries");
        }

    }
}
