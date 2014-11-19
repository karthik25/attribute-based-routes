using System.Web.Mvc;

namespace AttrBasedRoutesListing_Demo.Controllers
{
    public class HomeController : Controller
    {
        [Route("home")]
        public ActionResult Index()
        {
            return View();
        }

        [Route("help")]
        public ActionResult Help()
        {
            return View();
        }
	}
}
