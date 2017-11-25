using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace DuoKuWeb.Models
{
 
    public class RegisterViewModel
    {
        [DisplayName("用户名")]
        [Required(ErrorMessage = "用户名不能为空")]
        [MinLength(3, ErrorMessage = "用户名最小长度为{1}")]
        public string UserName { get; set; }

        [DisplayName("密码")]
        [Required(ErrorMessage = "密码不能为空")]
        [MinLength(6, ErrorMessage = "密码最小长度为{1}")]
        public string Password { get; set; }

        [DisplayName("确认密码")]
        [Compare("Password", ErrorMessage = "两次密码要一致")]
        public string ConfirmPassword { get; set; }
    }

    /// <summary>
    /// 登录视图模型类
    /// </summary>
    public class LoginViewModel
    {
        [DisplayName("用户名")]
        [Required(ErrorMessage = "用户名不能为空")]
        [MinLength(3, ErrorMessage = "用户名最小长度为{1}")]
        public string UserName { get; set; }

        [DisplayName("密码")]
        [MinLength(6, ErrorMessage = "密码最小长度为{1}")]
        public string Password { get; set; }

        [DisplayName("记住账号密码")]
        public bool RememberMe { get; set; }
    }
}