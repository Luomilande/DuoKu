using System;
using System.Collections.Generic;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Script.Serialization;
using DuoKuWeb.Models;

namespace DuoKuWeb.Controllers
{
    public class HomeController : Controller
    {

        private Models.MaterialEntities db = new Models.MaterialEntities();
        public ActionResult Index()
        {
            var newsc1 = db.SCdetails.OrderByDescending(p => p.UploadTime).Where(p => p.SCState == true).Take(4);
            var newsc2 = db.SCdetails.OrderByDescending(p => p.DownloadNumber).Where(p => p.SCState == true).Take(4);
            var newsc3 = db.SCdetails.OrderByDescending(p => p.CollectionNumber).Where(p => p.SCState == true).Take(4);
            var newsc4 = db.SCdetails.Where(p => p.SCState == true).Take(4);

            ViewBag.newsc1 = newsc1;
            ViewBag.newsc2 = newsc2;
            ViewBag.newsc3 = newsc3;
            ViewBag.newsc4 = newsc4;

            return View();
        }
        public ActionResult Upimg()
        {
            return View();
        }
        public ActionResult Up()
        {
            var sr = new System.IO.StreamReader(Request.InputStream);
            var jss = new JavaScriptSerializer();
            var obj = jss.Deserialize<Models.SCdetailsViewModels>(sr.ReadToEnd());///前台传来的数据
            string username = Session["UserName"].ToString();
            //int userid = db.Userinfo.Where(u => u.UserName == username).FirstOrDefault().ID;
            int userid = db.Userinfo.FirstOrDefault(u => u.UserName == username).ID;
            //var userid2 = from r in db.Userinfo
            //              where r.UserName == username
            //              select r;

            Models.SCdetails sc = new Models.SCdetails();
            sc.Title = obj.Title;
            sc.Details = obj.Details;
            sc.CollectionNumber = 1;
            sc.DownloadNumber = 1;
            sc.SeeNumber = 1;
            sc.UserID = userid;
            ///将Base64编码转为图片保存到数据库中
            string byteStr = obj.PictureURL.ToString();//data:image/jpg;base64,         
            int delLength = byteStr.IndexOf(',') + 1;
            string str = byteStr.Substring(delLength, byteStr.Length - delLength);
            Image returnImage = Base64StringToImage(str);
            string imgurl = Guid.NewGuid() + ".jpg";
            returnImage.Save(Server.MapPath("/Content/images/Upimages/") + imgurl, System.Drawing.Imaging.ImageFormat.Jpeg);
            sc.PictureURL = "/Content/images/Upimages/" + imgurl;

            sc.SCState = true;
            sc.FileURL = "";
            sc.UploadTime = DateTime.Now.ToShortDateString().ToString();
            db.SCdetails.Add(sc);
            db.SaveChanges();

            var rst = Json(new { success = true, ExecuteResult = "操作成功:" + obj.Title + " 上传。" }, JsonRequestBehavior.AllowGet);
            return rst;
        }
        private Image Base64StringToImage(string txt)
        {
            byte[] arr = Convert.FromBase64String(txt);
            MemoryStream ms = new MemoryStream(arr);
            Bitmap bmp = new Bitmap(ms);
            return bmp;
        }

        public ActionResult SC()
        {
            if (Session["UserId"] != null)
            {
                var sr = new System.IO.StreamReader(Request.InputStream);
                var jss = new JavaScriptSerializer();
                var obj = jss.Deserialize<Models.SCdetailsViewModels>(sr.ReadToEnd());///前台传来的数据
                int userid = Convert.ToInt32(Session["UserId"].ToString().TrimEnd());
                var a = db.Collection.FirstOrDefault(c => c.SCID == obj.ID && c.UserID == userid);
                Collection col = new Collection();
                if (a == null)
                {
                    col.SCID = obj.ID;
                    col.UserID = userid;
                    db.Collection.Add(col);

                    var scinfo = db.SCdetails.FirstOrDefault(s => s.ID == obj.ID);
                    scinfo.CollectionNumber++;
                    db.SaveChanges();

                    return Json(new { success = true, ExecuteResult = "收藏成功！" }, JsonRequestBehavior.AllowGet);
                }
                else
                {
                    return Json(new { success = true, ExecuteResult = "已收藏！" }, JsonRequestBehavior.AllowGet);
                }
            }
            else
            {
                return Json(new { success = true, ExecuteResult = "请先登陆！" }, JsonRequestBehavior.AllowGet);
            }

        }
        public ActionResult Dow()
        {
            var sr = new System.IO.StreamReader(Request.InputStream);
            var jss = new JavaScriptSerializer();
            var obj = jss.Deserialize<Models.SCdetailsViewModels>(sr.ReadToEnd());///前台传来的数据

            if (Session["UserId"] != null)//用户
            {
                int userid =Convert.ToInt32( Session["UserId"].ToString());
                var dow = db.Download.FirstOrDefault(d => d.UserID == userid && d.SCID==obj.ID);
                if(dow==null)
                {
                    Download dl = new Download();//如果有账号登陆的，则保存下载记录
                    dl.UserID = userid;
                    dl.SCID = obj.ID;
                    db.Download.Add(dl);
                }
            }

        var scinfo = db.SCdetails.FirstOrDefault(s => s.ID == obj.ID);
            scinfo.DownloadNumber++;//下载数+1
            db.SaveChanges();

            return Json(new { success = true }, JsonRequestBehavior.AllowGet);
        }
    }
}