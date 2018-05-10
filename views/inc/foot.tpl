<script src="/static/js/jquery.min.js"></script>
<script src="/static/js/bootstrap.min.js"></script>
<script src="/static/js/jquery.nicescroll.js"></script>
<script src="/static/js/scripts.js"></script>
<script src="/static/js/jquery.validate.js"></script>
<script src="/static/js/manage.js"></script>

<script>
    $(function () {
        $(".left-side-inner ul li a").on("click", function(){
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
            setTimeout(function(){ $('#dialogInfo').modal('hide'); }, 1000);
        });
    })
</script>