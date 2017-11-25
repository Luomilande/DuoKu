using DuoKuWeb.Models;
using PagedList;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Script.Serialization;

namespace DuoKuWeb.Controllers
{
    public class BackstageController : Controller
    {
        private Models.MaterialEntities db = new Models.MaterialEntities();
        public ActionResult Index(int? page)
        {
            if (Session["Role"] != null && Session["UserName"] != null)
            {
                List<SCdetails> listsc = db.SCdetails.Take(10).ToList();
                //List<SCdetails> sss = db.SCdetails.Where(p=>p.ID==5).ToList();

                var dw = from r in db.SCdetails
                         join w in db.Userinfo on r.UserID equals w.ID
                         orderby r.DownloadNumber descending
                         select new HT_Content { UserName = w.UserName, DownloadNumber = r.DownloadNumber, Title = r.Title, CollectionNumber = r.CollectionNumber };
                ViewBag.sasd = dw;

                var dw1 = from r in db.SCdetails
                          join w in db.Userinfo on r.UserID equals w.ID
                          orderby r.CollectionNumber descending
                          select new HT_Content { UserName = w.UserName, DownloadNumber = r.DownloadNumber, Title = r.Title, CollectionNumber = r.CollectionNumber };
                ViewBag.scph = dw1;

                int aax = db.SCdetails.Count();
                ViewBag.sucais = aax;

                int rs = db.Userinfo.Count();
                ViewBag.rens = rs;
                return View();
            }
            return RedirectToAction("Index", "Home");
        }

        public ActionResult article(int? page)
        {
            List<Userinfo> listuser = db.Userinfo.ToList();


            var tu = db.Userinfo.Where(d => d.ID != 0);
            int pageNumber = page ?? 1; // 第几页
            int pageSize = 10;//每页显示几条
                              // PagedList<SCdetails> tiao = db.SCdetails.ToPagedList(tiao ?? 1, 15);
            tu = tu.OrderByDescending(x => x.Integral);//按下载量排行
            IPagedList<Userinfo> pagedList = tu.ToPagedList(pageNumber, pageSize);//通过ToPageList扩展方法进行分页
            ViewBag.userinfo = pagedList;
            ViewBag.scdetails = pagedList;
            ViewBag.datap = pagedList;
            return View(pagedList);
        }

        public ActionResult add_article(int? page)
        {
            List<SCdetails> listsc = db.SCdetails.ToList();

            var tu = db.SCdetails.Where(d => d.ID != 0);
            int pageNumber = page ?? 1; // 第几页
            int pageSize = 10;//每页显示几条
                              // PagedList<SCdetails> tiao = db.SCdetails.ToPagedList(tiao ?? 1, 15);
            tu = tu.OrderByDescending(x => x.DownloadNumber);//按下载量排行
            IPagedList<SCdetails> pagedList = tu.ToPagedList(pageNumber, pageSize);//通过ToPageList扩展方法进行分页
            ViewBag.scdetails = pagedList;
            ViewBag.datap = pagedList;
            return View(pagedList);
        }
        public ActionResult Xiugai()
        {
            var sr = new System.IO.StreamReader(Request.InputStream);
            var jss = new JavaScriptSerializer();
            var obj = jss.Deserialize<int>(sr.ReadToEnd());
            var currentRec = db.SCdetails.FirstOrDefault(p => p.ID == obj);
            if (currentRec.SCState == false)
            {
                currentRec.SCState = true;
            }
            else
            {
                currentRec.SCState = false;
            }
            db.SaveChanges();
            var rst = Json(new { success = true, ExecuteResult = "素材修改状态成功!" }, JsonRequestBehavior.AllowGet);
            return rst;
        }

        public ActionResult Xiugaihuiyuan()
        {
            var sr = new System.IO.StreamReader(Request.InputStream);
            var jss = new JavaScriptSerializer();
            var obj = jss.Deserialize<int>(sr.ReadToEnd());
            var currentRec = db.Userinfo.FirstOrDefault(p => p.ID == obj);
            if (currentRec.State == false)
            {
                currentRec.State = true;
            }
            else
            {
                currentRec.State = false;
            }
            db.SaveChanges();
            var rst = Json(new { success = true, ExecuteResult = "账号修改状态成功!" }, JsonRequestBehavior.AllowGet);
            return rst;
        }
    }
}