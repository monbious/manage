<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<title>{{config "String" "globaltitle" ""}}</title>
<link href="/static/css/clndr.css" rel="stylesheet">
<link href="/static/css/table-responsive.css" rel="stylesheet">
{{template "inc/meta.tpl" .}}
</head>
</head>
<body class="sticky-header">
<section> {{template "inc/left.tpl" .}}
  <!-- main content start-->
  <div class="main-content" >
    <!-- header section start-->
    <div class="header-section"> <a class="toggle-btn"><i class="fa fa-bars"></i></a> {{template "inc/user-info.tpl" .}} </div>
    <!-- header section end-->
    <!-- page heading start-->
    <!--<div class="page-heading">-->
    <!--Page Tittle goes here-->
    <!--</div>-->
    <!-- page heading end-->
    <!--body wrapper start-->
    <div class="wrapper">
      <div class="row">
        <div class="col-md-4">
          <div class="row">
            <div class="col-md-12">
              <div class="panel">
                <div class="panel-body">
                  <div class="profile-pic text-center"> <img alt="{{getRealname .user.Id}}" src="{{getAvatar .user.Avatar}}"> </div>
                </div>
              </div>
            </div>
            <div class="col-md-12">
              <div class="panel">
                <div class="panel-body">
                  <div class="calendar-block ">
                    <div class="cal1"> </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
        <div class="col-md-8">
            <div class="panel">
                <div class="panel-body">
                    <ul class="p-info">
                        <li>
                            <div class="title">姓名</div>
                            <div class="desk">{{.pro.Realname}}</div>
                        </li>
                        <li>
                            <div class="title">性别</div>
                            <div class="desk">{{if eq .pro.Sex 1}}男{{else}}女{{end}}</div>
                        </li>
                        <li>
                            <div class="title">生日</div>
                            <div class="desk">{{.pro.Birth}}</div>
                        </li>
                        <li>
                            <div class="title">电话</div>
                            <div class="desk">{{.pro.Phone}}</div>
                        </li>
                        <li>
                            <div class="title">部门</div>
                            <div class="desk">{{.departName}}</div>
                        </li>
                        <li>
                            <div class="title">职称</div>
                            <div class="desk">{{.positionName}}</div>
                        </li>
                    </ul>
                </div>
            </div>
            <div class="panel">
                <div class="panel-body p-states">
                    <h4 class="title"><a href="/notice/manage">公告</a></h4>
                    <ul class="dropdown-list normal-list">
                        {{range $k,$v := .notices}}
                        <li class="new"> <a href="#noticeModal" data-toggle="modal" data-content="{{$v.Content}}"> <span class="label label-danger"><i class="fa fa-bolt"></i></span> <span class="name">{{$v.Title}} </span> <em class="small">{{getDateMH $v.Created}}</em> </a> </li>
                        {{end}}
                        <!--li class="new"><a href="">See All Notifications</a></li-->
                    </ul>
                </div>
            </div>
        </div>
      </div>
    </div>
    <!--body wrapper end-->
    <!--footer section start-->
	{{template "inc/notice-dialog.tpl" .}}
    <!--footer section end-->
  </div>
  <!-- main content end-->
</section>
{{template "inc/foot.tpl" .}}
<script src="/static/js/calendar/clndr.js"></script>
<script src="/static/js/calendar/evnt.calendar.init.js"></script>
<script src="/static/js/calendar/moment-2.2.1.js"></script>
<script src="/static/js/underscore-min.js"></script>
<script>
$(function(){
	$('#noticeModal').on('show.bs.modal', function (e) {
		$('#notice-box').html($(e.relatedTarget).attr('data-content'))
	});
})
</script>
</body>
</html>
