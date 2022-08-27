<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: kai
  Date: 2022/8/22
  Time: 18:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <script type="text/javascript"
            src="${pageContext.request.contextPath}/static/js/jquery-1.12.4.min.js"></script>
    <script src="${pageContext.request.contextPath}/static/bootstrap-3.4.1-dist/js/bootstrap.min.js"></script>
    <link href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
    <title>员工列表</title>
</head>
<body>
<!-- 员工添加的Modal -->
<!-- 员工添加的模态框 -->
<div class="modal fade" id="empAddModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="myModalLabel">员工添加</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal">
                    <div class="form-group">
                        <label class="col-sm-2 control-label">empName</label>
                        <div class="col-sm-10">
                            <input type="text" name="empName" class="form-control" id="empName_add_input" placeholder="empName">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">email</label>
                        <div class="col-sm-10">
                            <input type="text" name="email" class="form-control" id="email_add_input" placeholder="email@atguigu.com">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">gender</label>
                        <div class="col-sm-10">
                            <label class="radio-inline">
                                <input type="radio" name="gender" id="gender1_add_input" value="M" checked="checked"> 男
                            </label>
                            <label class="radio-inline">
                                <input type="radio" name="gender" id="gender2_add_input" value="F"> 女
                            </label>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">deptName</label>
                        <div class="col-sm-4">
                            <!-- 部门提交部门id即可 -->
                            <select class="form-control" name="dId">
                            </select>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" id="emp_save_btn">保存</button>
            </div>
        </div>
    </div>
</div>
<!-- 员工修改的模态框 -->
<div class="modal fade" id="empUpdateModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title">员工修改</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal">
                    <div class="form-group">
                        <label class="col-sm-2 control-label">empName</label>
                        <div class="col-sm-10">
                            <p class="form-control-static" id="empName_update_static"></p>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">email</label>
                        <div class="col-sm-10">
                            <input type="text" name="email" class="form-control" id="email_update_input" placeholder="email@atguigu.com">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">gender</label>
                        <div class="col-sm-10">
                            <label class="radio-inline">
                                <input type="radio" name="gender" id="gender1_update_input" value="M" checked="checked"> 男
                            </label>
                            <label class="radio-inline">
                                <input type="radio" name="gender" id="gender2_update_input" value="F"> 女
                            </label>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">deptName</label>
                        <div class="col-sm-4">
                            <!-- 部门提交部门id即可 -->
                            <select class="form-control" name="dId">
                            </select>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" id="emp_update_btn">更新</button>
            </div>
        </div>
    </div>
</div>
<%--搭建显示页面--%>
<div class="container">
    <%--  这是标题行   --%>
    <div class="row">
        <div class="col-md-12">
            <h1>SSM-CRUD</h1>
        </div>
    </div>
    <%--      按钮--%>
    <div class="row">
        <div class="col-md-4 col-md-offset-8">
            <button class="btn btn-primary" id = "emp_add_modal_btn">新增</button>
            <button class="btn btn-danger" id = "emp_delete_all_btn">删除</button>
        </div>
    </div>
    <%--      显示表格信息--%>
    <div class="row">
        <div class="col-md-12">
            <table class="table table-hover" id = "emps_table">
                <thead>
                <tr>
                    <th>
                        <input type="checkbox" id="check_all"/>
                    </th>
                    <th>#</th>
                    <th>empName</th>
                    <th>gender</th>
                    <th>email</th>
                    <th>deptName</th>
                    <th>操作按钮</th>
                </tr>
                </thead>
                <tbody>
                </tbody>
            </table>
        </div>
    </div>
    <%--      显示分页信息--%>
    <div class="row">
<%--        分页文字信息--%>
        <div class="col-md-6" id ="page_info_area">
        </div>
<%--    分页条信息--%>
        <div class="col-md-6" id = "page_nav_area">
        </div>
    </div>
</div>
<script type="text/javascript">
    var totalRecord,currentPage;
    //1.页面加载完成之后，直接去发送一个ajax请求,获取分页数据
    $(function (){
     //去首页
        toPage(1);
    });
    function toPage(pn) {
        $.ajax({
            url:"${pageContext.request.contextPath}/emps",
            data:"pn=" + pn,
            type:"get",
            success:function (msg) {
                //1.解析并显示员工数据
                build_emps_table(msg);
                // 2.解析并显示分页信息
                build_page_info(msg);
                //3.解析并显示分页条信息
                build_page_nav(msg);
            }
        });
    }
     function  build_emps_table(msg) {
        //清空table表格
         $("#emps_table tbody").empty();
         var emps= msg.extend.pageInfo.list;
         $.each(emps,function (index,item) {
             var checkBoxTd = $("<td><input type='checkbox'class='check_item'/></td>")
             var empIdTd = $("<td></td>").append(item.empId);
             var empNameTd = $("<td></td>").append(item.empName);
             var genderTd = $("<td></td>").append(item.gender=="M"?"男":"女");
             var emailTd = $("<td></td>").append(item.email);
             var deptNameTd = $("<td></td>").append(item.dId);
             var editBtn = $("<button></button>").addClass("btn btn-primary btn-sm edit_btn").append("编辑");
             //为编辑按钮添加一个自定义的属性来代表员工id
             editBtn.attr("edit-id",item.empId);
             var delBtn = $("<button></button>").addClass("btn btn-danger btn-sm delete_btn").append("删除");
             //为删除按钮添加一个自定义属性
             delBtn.attr("del-id",item.empId);
             $("<tr></tr>").append(checkBoxTd).append(empIdTd)
             .append(empNameTd).append(genderTd).append(emailTd).append(deptNameTd).append(editBtn).append(delBtn)
                 .appendTo("#emps_table tbody");
         })
     }
     //解析显示分页信息
    function build_page_info(msg) {
        //清空页面信息
        $("#page_info_area").empty();
        $("#page_info_area").append("当前第" +msg.extend.pageInfo.pageNum+ " 页,总共" +msg.extend.pageInfo.pages + "页," +
            "总条" + msg.extend.pageInfo.total+"记录");
        totalRecord = msg.extend.pageInfo.total;
        currentPage= msg.extend.pageInfo.pageNum;
    }
     //解析显示分页条
     function build_page_nav(msg) {
         //清空分页条信息
         $("#page_nav_area").empty();
         var ul =$("<ul></ul>").addClass("pagination");
        var firstPageLi =$("<li></li>").append($("<a></a>").append("首页").attr("href","#"));
        var prePageLi = $("<li></li>").append($("<a></a>").append("&laquo;"));
        if(msg.extend.pageInfo.hasPreviousPage == false){
            firstPageLi.addClass("disable");
            prePageLi.addClass("disable");
        }
        firstPageLi.click(function () {
           toPage(1);
        });
        prePageLi.click(function () {
           toPage(msg.extend.pageInfo.pageNum -1);
        });
        var nextPageLi = $("<li></li>").append($("<a></a>").append("&raquo;"));
        var lastPageLi = $("<li></li>").append($("<a></a>").append("末页").attr("href","#"));
        if(msg.extend.pageInfo.hasNextPage == false){
            nextPageLi.addClass("disable");
            lastPageLi.addClass("disable");
        }
        nextPageLi.click(function () {
           toPage(msg.extend.pageInfo.pageNum + 1);
        });
         lastPageLi.click(function () {
             toPage(msg.extend.pageInfo.pages);
         });
        //添加首页和前一页的提示
        ul.append(firstPageLi).append(prePageLi);
         //123遍历给ul中添加页码提示
        $.each(msg.extend.pageInfo.navigatepageNums,function (index,item) {
            var numLi = $("<li></li>").append($("<a></a>").append(item));
            if(msg.extend.pageInfo.pageNum == item){
                numLi.addClass("active");
            }
            numLi.click(function(){
                toPage(item);
            });
            ul.append(numLi)
        });
        //添加下一页和末页的提示
         ul.append(nextPageLi).append(lastPageLi);
         var navEle = $("<nav></nav>").append(ul);
         navEle.appendTo("#page_nav_area");
     }
     function reset_form(ele) {
         $(ele)[0].reset();
         //清空表单样式
         $(ele).find("*").removeClass("has-error has-success");
         $(ele).find(".help-block").text("");
     }
     //点击新增按钮弹出模态框
     $("#emp_add_modal_btn").click(function () {
         //清除表单数据
         reset_form("#empAddModal form")
         //$("#empAddModal form")[0].reset();
         getDepts("#empAddModal select");
         $("#empAddModal").modal({
             //发送ajax请求，查出部门信息,显示在下拉列表中
             //弹出模态框
             backdrop:"static"
         });
     });
    //查出所有的部门信息并显示在下拉列表中
     function getDepts(ele) {
         $(ele).empty();
         $.ajax({
                   url:"${pageContext.request.contextPath}/depts",
                   type: "GET",
                   success:function (msg) {
                        // console.log(msg);
                     // $("#dept_add_select").append()
                       $.each(msg.extend.depts,function () {
                           var optionEle = $("<option></option>").append(this.deptName).attr("value",this.deptId);
                           optionEle.appendTo(ele);
                       });
                   }
         });
     }
     function show_validate_msg(ele,status,msg) {
         $(ele).parent().removeClass("has-success has-error");
         $(ele).next("span").text("");
         if("success"==status){
            $(ele).parent().addClass("has-success");
            $(ele).next("span").text(msg);
         }else if("error"==status){
             $(ele).parent().addClass("has-error");
             $(ele).next("span").text(msg);
         }
     }
     //校验表单数据
    function validate_add_form() {
        //1.拿到要校验的数据
        var empName = $("#empName_add_input").val();
        var regName = /(^[a-zA-Z0-9]{4,16}$)/;
        if(!regName.test(empName)){
            //alert("用户名输入不合法，请重新输入");
            show_validate_msg("#empName_add_input","error","用户名输入不合法，请重新输入");
            return false;
        }else {
            show_validate_msg("#empName_add_input","success","");
        };
        //2.校验邮箱信息
        var email = $("#email_add_input").val();
        var regemail = /^([A-Za-z0-9_\-\.])+\@([A-Za-z0-9_\-\.])+\.([A-Za-z]{2,4})$/;
        if(!regemail.test(email)){
            show_validate_msg("#email_add_input","error","邮箱格式不正确，请重新输入");
            return false;
        }else {
            show_validate_msg("#email_add_input","success","");
        };
        return true;
    }
    $("#empName_add_input").change(function () {
       //发送ajax请求校验用户的可用性
        var empName = this.value;
       $.ajax({
           url:"${pageContext.request.contextPath}/checkuser",
           data:"empName="+empName,
           type:"POST",
           success:function (msg) {
               if(msg.code==100){
                  show_validate_msg("#empName_add_input","success","用户名可用");
                  $("#emp_save_btn").attr("ajax-va","success");
               }else {
                   show_validate_msg("#empName_add_input","error",msg.extend.va_msg);
                   $("#emp_save_btn").attr("ajax-va","error");
               }
           }
       });
    });
        //发送ajax请求保存员工
    $("#emp_save_btn").click(function () {
        if(!validate_add_form()){
          return false;
        };
        //1.判断之前的ajax用户名校验是否成功
        if($(this).attr("ajax-va")=="error"){
            return false;
        }
        $.ajax({
            url:"${pageContext.request.contextPath}/emp",
            type:"POST",
            data:$("#empAddModal form").serialize(),
            success:function (msg) {
                if(msg.code==100){
                    //关闭模态框
                    $("#empAddModal").modal('hide');
                    //2.跳转到最后一页
                    //发送ajax请求
                    //
                    toPage(totalRecord);
                }else {
                    //显示失败信息
                    //有哪个字段的错误信息就显示哪个字段的错误信息
                   if(undefined!=msg.extend.errorFields.email){
                       //显示邮箱的错误信息
                       show_validate_msg("#email_add_input","error","邮箱格式不正确，请重新输入");
                   }
                    if(undefined!=msg.extend.errorFields.email){
                        //显示用户名的错误信息
                        show_validate_msg("#empName_add_input","error","用户名输入不合法，请重新输入");
                    }
                }

            }
        });
    });
    //这边使用live方法,新版JQuery用on取代了live方法;
    $(document).on("click",".edit_btn",function () {
       // alert("edit");
        //1.查出员工信息，显示员工信息
        getEmp($(this).attr("edit-id"));
        //2.查出部门信息，并显示部门列表
        getDepts("#empUpdateModal select");
        //3.把员工的id传递给模态框的更新按钮
        $("#emp_update_btn").attr("edit-id",$(this).attr("edit-id"));
        $("#empUpdateModal").modal({
               backdrop: "static"
        });
    });
    function getEmp(id) {
        $.ajax({
           url:"${pageContext.request.contextPath}/emp"+id,
            type:"GET",
            success:function (msg){
               //console.log(result);
                var empData = msg.extend.emp;
                $("empName_update_static").text(empData.empName);
                $("email_update_input").val(empData.email);
                $("#empUpdateModal input[name=gender]").val([empData.gender]);
                $("#empUpdateModal select").val([empData.dId]);
            }
        });
    }
    //点击更新，更新员工信息
    $("#emp_update_btn").click(function () {
       //验证邮箱是否合法
        var email = $("#email_update_input").val();
        var regemail = /^([A-Za-z0-9_\-\.])+\@([A-Za-z0-9_\-\.])+\.([A-Za-z]{2,4})$/;
        if(!regemail.test(email)){
            show_validate_msg("#email_update_input","error","邮箱格式不正确，请重新输入");
            return false;
        }else {
            show_validate_msg("#email_update_input","success","");
        };
       //发送ajax请求保存更新的员工数据
        $.ajax({
           url:"${pageContext.request.contextPath}/emp/" +$(this).attr("edit-id"),
            type:"POST",
            data:$("#empUpdateModal form").serialize()+"&_method=PUT",
            success:function (msg) {
                //alert(msg.msg);
                //1.关闭模态框
                $("#empUpdateModal").modal("hide");
                //2.回到本页面
                toPage(currentPage);
            }
        });
    });
      //单个删除
    $(document).on("click",".delete_btn",function () {
     //1.弹出是否确定删除对话框
        var empName =$(this).parent("tr").find("td:eq(2)").text();
        var empId = $(this).attr("del-id");
        //alert($(this).parent("tr").find("td:eq(1)").text());
        if(confirm("确认删除【"+ empName + "】吗？")){
        //确认，发送ajax请求删除即可
            $.ajax({
                url:"${pageContext.request.contextPath}/emp/"+empId,
                type:"DELETE",
                success:function (msg) {
                    alert(msg.msg);
                    toPage(currentPage);
                }
            });
        }
    });
    //完成全选/全不选
    $("#check_all").click(function () {
        $(".check_item").prop("checked",$(this).prop("checked"));
    });
    //check_item
    $(document).on("click",".check_item",function () {
        //判断当前选择的元素是否是5个
        var flag = $(".check_item:checked").length == $(".check_item").length
        $("#check_all").prop("checked",flag);
    });
    //点击全部删除，进行批量删除
    $("#emp_delete_all_btn").click(function () {
        var empNames = "";
        var del_idstr = "";
       $.each($(".check_item:checked"),function () {
             empNames += $(this).parent("tr").find("td:eq(2)").text()+",";
             del_idstr += $(this).parent("tr").find("td:eq(1)").text()+"-"
       });
        del_idstr=del_idstr.substring(0,del_idstr.length-1);
       if(confirm("确认删除【"+ empNames +"】吗?")){
           //发送ajax请求删除
         $.ajax({
            url:"${pageContext.request.contextPath}/emp/"+ del_idstr,
            type:"DELETE",
             success:function (msg) {
                 alert(msg.msg);
                 toPage(currentPage);
             }
         });
       }
    });
</script>
</body>
</html>