using System.Web;
using System.Web.Routing;

namespace AttrBasedRoutesListing_Demo.Constraints
{
    public class ValuesConstraint : IRouteConstraint
    {
        public bool Match(HttpContextBase httpContext, Route route, string parameterName, RouteValueDictionary values,
                          RouteDirection routeDirection)
        {
            throw new System.NotImplementedException();
        }
    }
}