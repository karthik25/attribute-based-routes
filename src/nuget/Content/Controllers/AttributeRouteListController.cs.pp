using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection;
using System.Web.Mvc;
using System.Web.Routing;
using $rootnamespace$.Models;

namespace $rootnamespace$.Controllers
{
    public class AttributeRouteListController : Controller
    {
        [Route("attribute-based-routes", Name = "AttrBasedRoutes")]
        public ActionResult Index()
        {
            var model = Request.IsLocal ? GetModel() : new AttributeRouteListViewModel();
            return View(model);
        }

        private static AttributeRouteListViewModel GetModel()
        {
            var executingAssembly = Assembly.GetExecutingAssembly();
            var types = executingAssembly.GetTypes();
            var model = new AttributeRouteListViewModel
            {
                RouteListEntries = GetAttributeBasedRoutes(types),
                CustomConstraints = GetCustomConstraints(types)
            };

            return model;
        }

        private static List<RouteListEntry> GetAttributeBasedRoutes(IEnumerable<Type> types)
        {
            var relevantTypes = types.Where(type => type.BaseType == typeof(Controller)).ToList();
            var relevantEntries = new List<RouteListEntry>();
            relevantTypes.ForEach(type => relevantEntries.AddRange(ProcessType(type)));
            return relevantEntries;
        }

        private static List<string> GetCustomConstraints(IEnumerable<Type> types)
        {
            var relevantTypes = types.Where(t => t.GetInterfaces().Any(i => i == typeof (IRouteConstraint)));
            return relevantTypes.Select(r => r.FullName).ToList();
        }

        private static IEnumerable<RouteListEntry> ProcessType(Type type)
        {
            var prefix = type.GetCustomAttribute<RoutePrefixAttribute>();
            var route = type.GetCustomAttribute<RouteAttribute>();
            var area = type.GetCustomAttribute<RouteAreaAttribute>();

            var methods =
                type.GetMethods(BindingFlags.Instance | BindingFlags.Public | BindingFlags.DeclaredOnly).ToList();
            var entries = new List<RouteListEntry>();
            methods.ForEach(methodInfo =>
                {
                    var routeAttr = methodInfo.GetCustomAttribute<RouteAttribute>();
                    var entry = new RouteListEntry
                        {
                            Controller = type.FullName,
                            ActionMethod = methodInfo.Name,
                            AreaPrefix = area != null && !string.IsNullOrEmpty(area.AreaPrefix) ? area.AreaPrefix : string.Empty,
                            UrlPrefix = prefix != null ? prefix.Prefix : string.Empty,
                            UrlPattern = routeAttr != null ? routeAttr.Template : methodInfo.Name.ToLower(),
                            RouteName = routeAttr != null && !string.IsNullOrEmpty(routeAttr.Name) ? routeAttr.Name : string.Empty,
                            Type = routeAttr == null ? RouteType.Default : RouteType.Attribute
		    };
                    if (entry.Type == RouteType.Attribute || (prefix != null || route != null || area != null))
                    {
                        entries.Add(entry);
                    }
                });
            return entries;
        }
    }
}
