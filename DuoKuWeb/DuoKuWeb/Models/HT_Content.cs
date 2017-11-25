using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace DuoKuWeb.Models
{
    public class HT_Content
    {
        public string Title { get; set; }
        public Nullable<int> DownloadNumber { get; set; }
        public string UserName { get; set; }
        public Nullable<int> CollectionNumber { get; set; }
    }
}