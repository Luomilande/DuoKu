using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using DuoKuWeb.Models;
using PagedList;

namespace DuoKuWeb.Controllers
{
    public class ListInfoController : Controller
    {
        private Models.MaterialEntities db = new Models.MaterialEntities();
        // GET: ListInfo
        public ActionResult Index()
        {
            return View();
        }
        public ActionResult listInfo(int? page=1)
        {
            var tu = db.SCdetails.Where(d => d.SCState == true).OrderByDescending(x => x.DownloadNumber);// 获取数据,按下载量排行

            int pageNumber = page ?? 1; // 第几页
            int pageSize = 15;//每页显示几条
            IPagedList<SCdetails> pagedList = tu.ToPagedList(pageNumber, pageSize);//通过ToPageList扩展方法进行分页
            ViewBag.datap = pagedList;
            return View(pagedList);//将分页处理后传给View
        }
    }
}