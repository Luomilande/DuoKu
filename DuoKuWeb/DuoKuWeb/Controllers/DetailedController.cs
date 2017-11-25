using DuoKuWeb.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace DuoKuWeb.Controllers
{
    public class DetailedController : Controller
    {
        private Models.MaterialEntities db = new Models.MaterialEntities();
        // GET: Detailed
        public ActionResult Index(int id)
        {
            return View();

        }
        public ActionResult Detailedinfo(int id)
        {
            var see = db.SCdetails.FirstOrDefault(s => s.ID == id);
            see.SeeNumber++;
            db.SaveChanges();

            //var obj = db.SCdetails.FirstOrDefault(p => p.ID == id);
            var obj = (from r in db.SCdetails                      
                      join w in db.Userinfo on r.UserID equals w.ID
                      where r.ID == id 
                      select new DetailedViewModels
                      {
                          ID = r.ID,
                          DownloadNumber = r.DownloadNumber,
                          SeeNumber = r.SeeNumber,
                          CollectionNumber = r.CollectionNumber,
                          UploadTime = r.UploadTime,
                          PictureURL = r.PictureURL,
                          UserID = r.UserID,
                          UserName = w.UserName,
                          Title = r.Title,
                      }).FirstOrDefault();
            ViewBag.dataobj = obj;

            var a = db.SCdetails.Where(s => s.SCState == true).Take(10);
            ViewBag.XiangGuan = a;
            return View();
        }


    }
}