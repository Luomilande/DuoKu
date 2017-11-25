using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Script.Serialization;
using DuoKuWeb.Models;
using System.Text;
using System.Security.Cryptography;

namespace DuoKuWeb.Controllers
{

    public class AccountController : Controller
    {
        private Models.MaterialEntities db = new Models.MaterialEntities();
        // GET: Account
        public ActionResult Index()
        {
            return View();
        }
        public ActionResult Login()
        {
            var sr = new System.IO.StreamReader(Request.InputStream);
            var jss = new JavaScriptSerializer();
            var obj = jss.Deserialize<Models.Userinfo>(sr.ReadToEnd());///前台传来的数据
            Userinfo us = new Models.Userinfo();
            
            us.UserName = obj.UserName;
            us.UserPassword = obj.UserPassword;
            var userinfo = db.Userinfo.Where(u => u.UserName == us.UserName && u.UserPassword == us.UserPassword).FirstOrDefault();
            if (us.UserName == null || us.UserPassword == null || userinfo == null || !userinfo.State)
            {
                ModelState.AddModelError("", "登陆失败。");
                return View();
            }
            else
            {
                ViewBag.user = userinfo.ID;
                Session["Role"] = userinfo.Role;//获取用户身份
                Session["UserName"] = userinfo.UserName;//获取用户名
                Session["UserId"] = userinfo.ID;//获取用户ID
                Session["UserIntegral"] = userinfo.Integral;//获取用户ID
                return Json(new { success = true, ExecuteResult = "操作成功:" + userinfo.UserName + " 登陆成功。" }, JsonRequestBehavior.AllowGet);

            }
            // return RedirectToAction("Index", "Home");
            //return View();


        }
        private string SHA256Encrypt(string plainText)
        {
            byte[] data = ASCIIEncoding.ASCII.GetBytes(plainText);
            SHA256 sha256 = new SHA256CryptoServiceProvider();
            byte[] result = sha256.ComputeHash(data);
            return Convert.ToBase64String(result);
        }
        /// <summary>
        /// 判断用户是否存在
        /// </summary>
        /// <returns></returns>
        private bool UserExist(string UserName)
        {
            var user = db.Userinfo.Where(u => u.UserName == UserName).FirstOrDefault();
            if (user != null)
            {
                return true;
            }
            else
            {
                return false;
            }
        }
        public ActionResult Register()
        {
            return View();
        }
        [HttpPost]
        public ActionResult Register(RegisterViewModel model)
        {
            if (UserExist(model.UserName))
            {
                ModelState.AddModelError("UserName", "注册失败！");
            }
            if (ModelState.IsValid)
            {
                Userinfo user = new Userinfo();
                user.UserName = model.UserName;
                user.UserPassword = model.Password;
                user.State = true;
                user.Integral = 0;
                user.Role = "user";
                db.Userinfo.Add(user);
                db.SaveChanges();
                return RedirectToAction("Index", "Home");
            }
            return View();
        }
        //public ActionResult Registerset() 
        //{
        //    var sr = new System.IO.StreamReader(Request.InputStream);
        //    var jss = new JavaScriptSerializer();
        //    var obj = jss.Deserialize<Models.Userinfo>(sr.ReadToEnd());///前台传来的数据
        //    Userinfo uf = new Userinfo();

        //    uf.UserName = obj.UserName;
        //    uf.UserNumber = obj.UserNumber;
        //    uf.UserPassword = obj.UserPassword;
        //    uf.State = true;
        //    var user = db.Userinfo.Where(u => u.UserNumber == uf.UserNumber).FirstOrDefault();
        //    if(user==null)
        //    {
        //        db.Userinfo.Add(uf);
        //        db.SaveChanges();
        //        return Json(new { success = true, ExecuteResult = uf.UserName + " 注册成功。" }, JsonRequestBehavior.AllowGet);
        //    }
        //    else
        //    {
        //        return Json(new { success = false, ExecuteResult = uf.UserName + " 账号已存在。" }, JsonRequestBehavior.AllowGet);
        //    }
        //}
        public ActionResult UserCenter(int id)
        {
            if(Session["UserName"]!=null && Session["Role"]!=null)
            {
            var Col = db.Collection.Where(d => d.UserID == id);
            var set = db.SCdetails.Where(d => d.UserID == id);
            List<SCdetails> sc = new List<SCdetails>();

            foreach (var item in Col)
            {
                sc.Add(db.SCdetails.Where(s => s.ID == item.SCID).FirstOrDefault());
            }
            ViewBag.DataXZ = sc;

            ViewBag.DataUp = set;
            return View();
            }
            return RedirectToAction("Index", "Home");
        }
        public ActionResult ExitUser()
        {
            Session["Role"] = null;//获取用户身份
            Session["UserName"] = null;//获取用户名
            Session["UserId"] = null;//获取用户ID
            return RedirectToAction("Index", "Home");
        }
    }
}