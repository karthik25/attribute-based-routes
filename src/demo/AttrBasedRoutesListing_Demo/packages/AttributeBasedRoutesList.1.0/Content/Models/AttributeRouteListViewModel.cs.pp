using System.Collections.Generic;

namespace $rootnamespace$.Models
{
    public class AttributeRouteListViewModel
    {
        public List<RouteListEntry> RouteListEntries { get; set; }
        public List<string> CustomConstraints { get; set; }

        public AttributeRouteListViewModel()
        {
            RouteListEntries = new List<RouteListEntry>();
            CustomConstraints = new List<string>();
        }
    }

    public class RouteListEntry
    {
        public string Controller { get; set; }
        public string ActionMethod { get; set; }
        public string AreaPrefix { get; set; }
        public string UrlPrefix { get; set; }
        public string UrlPattern { get; set; }
        public string RouteName { get; set; }
        public RouteType Type { get; set; }

        public string UrlPatternWithPrefix
        {
            get
            {
                var parts = new List<string>();
                if (!string.IsNullOrEmpty(AreaPrefix))
                    parts.Add(string.Format("<span class=\"area-prefix\">{0}</span>", AreaPrefix));
                if (!string.IsNullOrEmpty(UrlPrefix))
                    parts.Add(string.Format("<span class=\"url-prefix\">{0}</span>", UrlPrefix));

                if (UrlPattern.StartsWith("~"))
                    parts.Clear();

                parts.Add(UrlPattern);
                return string.Join("/", parts.ToArray());
            }
        }
    }

    public enum RouteType
    {
        Attribute,
        Default
    }
}
