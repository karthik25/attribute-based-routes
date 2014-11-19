using System.Web.Mvc;

namespace AttrBasedRoutesListing_Demo.Controllers
{
    [RoutePrefix("non-attr")]
    [Route("{action=Index}")]
    public class NonAttrBasedController : Controller
    {
        public ActionResult Index()
        {
            return View();
        }
	}
}