using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace AttrBasedRoutesListing_Demo.Areas.Admin.Controllers
{
    [RouteArea("Admin", AreaPrefix = "users")]
    [RoutePrefix("manage")]
    public class UsersController : Controller
    {
        [Route("main")]
        public ActionResult Index()
        {
            return View();
        }
	}
}