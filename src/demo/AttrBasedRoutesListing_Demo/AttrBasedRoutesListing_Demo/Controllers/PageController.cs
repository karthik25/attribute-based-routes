using System.Web.Mvc;

namespace AttrBasedRoutesListing_Demo.Controllers
{
    [RoutePrefix("pages")]
    [Route("{action=Index}")]
    public class PageController : Controller
    {
        [Route("all")]
        public ActionResult Index()
        {
            return View();
        }

        [Route("view/{pageId}")]
        public ActionResult ViewPage(string pageId)
        {
            return View();
        }
	}
}