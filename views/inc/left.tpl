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
          <span>opms系统</span> </div>
      </div>
      <h5 class="left-nav-title">控制台</h5>
      <ul class="nav nav-pills nav-stacked custom-nav">
        <li><a href="/user/profile"><i class="fa fa-user"></i> <span>个人设置</span></a></li>
        <li><a href="/logout"><i class="fa fa-sign-out"></i> <span>退出</span></a></li>
      </ul>
    </div>
    <!--sidebar nav start-->
    <ul class="nav nav-pills nav-stacked custom-nav js-left-nav">
      <li><a href="/my/manage"><i class="fa fa-home"></i> <span>我的主页</span></a></li>
      <li><a href="/checkwork/manage"><i class="fa fa-tasks"></i> <span>考勤管理</span></a></li>
      <li><a href="/leave/manage"><i class="fa fa-suitcase"></i> <span>审批管理</span></a></li>
      <li><a href="/resume/manage"><i class="fa fa-laptop"></i> <span>简历管理</span></a></li>
      <li><a href="/user/manage"><i class="fa fa-user"></i> <span>组织管理</span></a></li>

    </ul>
    <!--sidebar nav end-->
  </div>
</div>
<!-- left side end-->
