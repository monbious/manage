<!-- left side start-->
<div class="left-side sticky-left-side">
  <!--logo and iconic logo start-->
  <div class="logo"> <a href="/"><img src="{{getAvatar .LoginAvatar}}" ></a> </div>
  <!--<div class="logo-icon text-center"> <a href="/"><img src="/static/img/logo_icon.png" style="width:40px;" ></a> </div>-->
  <!--logo and iconic logo end-->
  <div class="left-side-inner">
    <!-- visible to small devices only -->
    <div class="visible-xs hidden-sm hidden-md hidden-lg">
      <div class="media logged-user"> <img alt="{{.LoginUsername}}" src="{{getAvatar .LoginAvatar}}" class="media-object">
        <div class="media-body">
          <h4><a href="/user/show/{{.LoginUserid}}">{{.LoginUsername}}</a></h4>
          <span>员工管理系统</span> </div>
      </div>
      <h5 class="left-nav-title">控制台</h5>
      <ul class="nav nav-pills nav-stacked custom-nav">
        <li><a href="/user/profile"><i class="fa fa-user"></i> <span>个人设置</span></a></li>
        <li><a href="/logout"><i class="fa fa-sign-out"></i> <span>退出</span></a></li>
      </ul>
    </div>
    <!--sidebar nav start-->
    <ul class="nav nav-pills nav-stacked custom-nav js-left-nav">
      <li><a  h="/my/manage" r="{{.LoginRole}}"><i class="fa fa-home"></i> <span>我的主页</span></a></li>
      <li><a  h="/checkwork/manage" r="{{.LoginRole}}"><i class="fa fa-tasks"></i> <span>考勤管理</span></a></li>
      <li><a  h="/leave/manage" r="{{.LoginRole}}"><i class="fa fa-suitcase"></i> <span>审批管理</span></a></li>
      <li><a  h="/resume/manage" r="{{.LoginRole}}"><i class="fa fa-laptop"></i> <span>简历管理</span></a></li>
      <li><a  h="/user/manage" r="{{.LoginRole}}"><i class="fa fa-user"></i> <span>组织管理</span></a></li>

    </ul>
    <!--sidebar nav end-->
  </div>
  <style>
    .left-side-inner ul li a {
      cursor: pointer;
    }
  </style>
  <script src="/static/js/jquery.min.js"></script>
  <script src="/static/js/manage.js"></script>
  <script>
    $(function () {
        $(".left-side-inner ul li a").click(function(){
            var h = $(this).attr("h");
            var r = $(this).attr("r");
            if(r == "0") {
                if(h == "/resume/manage" || h == "/user/manage") {
                    dialogInfo("你没有此权限！");
                } else {
                    $(this).prop("href", h);
                }
            }else{
                $(this).prop("href", h);
            }
        });
    })
  </script>
</div>
<!-- left side end-->
