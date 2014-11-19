using System.Web.Mvc;

namespace AttrBasedRoutesListing_Demo.Areas.Admin.Controllers
{
    [RouteArea("Admin", AreaPrefix = "administration")]
    public class MainController : Controller
    {
        [Route("main")]
        public ActionResult Index()
        {
            return View();
        }

        [Route("~/delete-user")]
        public ActionResult Delete()
        {
            return View();
        }
	}
}