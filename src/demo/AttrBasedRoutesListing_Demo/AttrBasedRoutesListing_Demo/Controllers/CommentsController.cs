using System.Web.Mvc;

namespace AttrBasedRoutesListing_Demo.Controllers
{
    [RoutePrefix("comments")]
    [Route("{action=Index}")]
    public class CommentsController : Controller
    {
        public ActionResult Index()
        {
            return View();
        }
	}
}