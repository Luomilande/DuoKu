using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace DuoKuWeb.Models
{
    public class SCdetailsViewModels
    {
        public int ID { get; set; }
        public string Title { get; set; }
        public string Details { get; set; }
        public Nullable<int> CollectionNumber { get; set; }
        public Nullable<int> DownloadNumber { get; set; }
        public Nullable<int> SeeNumber { get; set; }
        public string PictureURL { get; set; }
        public string FileURL { get; set; }
        public int UserID { get; set; }
        public string UploadTime { get; set; }
        public bool SCType { get; set; }
        public string bit { get; set; }
    }
}