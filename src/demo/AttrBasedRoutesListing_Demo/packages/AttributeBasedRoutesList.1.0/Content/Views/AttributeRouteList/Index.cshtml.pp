@using $rootnamespace$.Models
@model AttributeRouteListViewModel

@{
    ViewBag.Title = "Attribute Based Routes Listing";
    Layout = null;
}

<!DOCTYPE html>

<html>
<head>
    <meta name="viewport" content="width=device-width" />
    <title>Attribute Based Routes Listing</title>
    <link rel="stylesheet" type="text/css" href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css"/>
    <style type="text/css">
        .help { cursor: pointer }
	.area-prefix { color: #610B21; font-weight: bold }
	.url-prefix { color: #08298A; font-weight: bold }
    </style>
</head>
<body>
    <div class="container">
        <br/>
        <header>
            <div class="well well-sm">
                <div>
                    <div class="pull-left">
			<strong>Attribute Based Routes Url List</strong>
			<a href="http://blogs.msdn.com/b/webdev/archive/2013/10/17/attribute-routing-in-asp-net-mvc-5.aspx" target="_blank" class="help">?</a>
		    </div>
                    <div class="pull-right">
                        <a class="help" data-toggle="modal" data-target="#myModal">Legend</a> |
                        <a href="@Url.RouteUrl("AttrBasedRoutes")">Refresh</a>
                    </div>
                </div>
                <br/>
            </div>
        </header>

        <h2>Attribute Based Routes</h2>
        <small>Paramters are implicit (see url pattern)</small>
        <br/><br/>
            
        <table class="table table-striped">
            <tr>
                <th>Controller</th>
                <th>Action Method</th>
                <th>
                    Url Pattern
                    <a title="[area-prefix?]/[route-prefix?]/url" class="help">?</a>
                </th>
                <th>
                    Route Name
                    <a title="For Url.RouteUrl(...)" class="help">?</a>
                </th>
            </tr>
            @if (!Model.RouteListEntries.Any(r => r.Type == RouteType.Attribute))
            {
                <tr>
                    <td>Nothing Found</td>
                    <td></td>
                    <td></td>
                    <td></td>
                </tr>
            }
            @foreach (var item in Model.RouteListEntries.Where(r => r.Type == RouteType.Attribute))
            {
                <tr>
                    <td>@item.Controller</td>
                    <td>
                        @item.ActionMethod
                    </td>
                    <td>@Html.Raw(item.UrlPatternWithPrefix)</td>
                    <td>@item.RouteName</td>
                </tr>
            }
        </table>
        <br/>

        <h2>Without the "Route" Attribute but Attr. Based</h2>
        <small>Parameters not shown</small>
        <br/><br/>
            
        <table class="table table-striped">
            <tr>
                <th>Controller</th>
                <th>Action Method</th>
                <th>Url Pattern</th>
            </tr>
            @if (!Model.RouteListEntries.Any(r => r.Type == RouteType.Default))
            {
                <tr>
                    <td>Nothing Found</td>
                    <td></td>
                    <td></td>
                </tr>
            }
            @foreach (var item in Model.RouteListEntries.Where(r => r.Type == RouteType.Default))
            {
                <tr>
                    <td>@item.Controller</td>
                    <td>
                        @item.ActionMethod
                    </td>
                    <td>@Html.Raw(item.UrlPatternWithPrefix)</td>
                </tr>
            }
        </table>
        <br/>

        <h2>Custom Route Constraints</h2>
        <br/>
        @if (Model.CustomConstraints == null || !Model.CustomConstraints.Any())
        {
            <span>Nothing Found</span><br/>
        }
        else
        {
            <ul>
                @foreach (var item in Model.CustomConstraints)
                {
                    <li>@item</li>                
                }
            </ul>
        }
        <br/>
        <footer>
            <div class="well well-sm">
                <div>
                    <div class="pull-left"><strong>&copy; <a href="https://www.github.com/karthik25">Karthik Anant</a></strong></div>
                    <div class="pull-right"><a href="http://karthik25.github.io/attribute-based-routes">Project Page</a></div>
                </div>
                <br/>
            </div>
        </footer>
    </div>
    
    <!-- Modal -->
    <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                    <h4 class="modal-title" id="myModalLabel">Legend</h4>
                </div>
                <div class="modal-body">
                    <span class="area-prefix">some-prefix</span> - Area prefix
                    <br/>
                    <span class="url-prefix">some-other-prefix</span> - Controller (route) prefix
                    <br/>
                    <span>some-route-url</span> - Url for an action method
		    <br/>
		    <span>~/some-route-url</span> - This route url overrides any area/route prefixes
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>
    
    <script type="text/javascript" src="@Url.Content("//code.jquery.com/jquery-1.11.0.min.js")"></script>
    <script type="text/javascript" src="@Url.Content("//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js")"></script>
</body>
</html>
