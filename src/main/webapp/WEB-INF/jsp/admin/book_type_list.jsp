<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link href="${pageContext.request.contextPath}/static/assets/css/bootstrap.min.css" rel="stylesheet"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/style.css"/>
    <link href="${pageContext.request.contextPath}/static/assets/css/codemirror.css" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/assets/css/ace.min.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/assets/css/font-awesome.min.css"/>
    <!--[if IE 7]>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/assets/css/font-awesome-ie7.min.css"/>
    <![endif]-->
    <!--[if lte IE 8]>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/assets/css/ace-ie.min.css"/>
    <![endif]-->
    <script src="${pageContext.request.contextPath}/static/assets/js/jquery.min.js"></script>
    <script type="text/javascript"
            src="${pageContext.request.contextPath}/static/js/jquery-1.12.4.min.js"></script>

    <!-- <![endif]-->

    <!--[if IE]>
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
    <![endif]-->

    <!--[if !IE]> -->

    <script type="text/javascript">
        window.jQuery || document.write("<script src='${pageContext.request.contextPath}/static/assets/js/jquery-2.0.3.min.js'>" + "<" + "/script>");
    </script>

    <!-- <![endif]-->

    <!--[if IE]>
    <script type="text/javascript">
        window.jQuery || document.write("<script src='${pageContext.request.contextPath}/static/assets/js/jquery-1.10.2.min.js'>" + "<" + "/script>");
    </script>
    <![endif]-->

    <script type="text/javascript">
        if ("ontouchend" in document) document.write("<script src='${pageContext.request.contextPath}/static/assets/js/jquery.mobile.custom.min.js'>" + "<" + "/script>");
    </script>
    <script src="${pageContext.request.contextPath}/static/assets/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/static/assets/js/typeahead-bs2.min.js"></script>
    <!-- page specific plugin scripts -->
    <script src="${pageContext.request.contextPath}/static/assets/js/jquery.dataTables.min.js"></script>
    <script src="${pageContext.request.contextPath}/static/assets/js/jquery.dataTables.bootstrap.js"></script>
    <script type="text/javascript" src="../static/js/H-ui.js"></script>
    <script type="text/javascript" src="../static/js/H-ui.admin.js"></script>
    <script src="${pageContext.request.contextPath}/static/assets/layer/layer.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/static/assets/laydate/laydate.js" type="text/javascript"></script>
    <title></title>
</head>

<body>
<div class="page-content clearfix">
    <div id="Member_Ratings">
        <div class="d_Confirm_Order_style">
            <div class="border clearfix">
       <span class="l_f">
           <a href="javascript:void()" class="btn btn-danger" id="delete_selected"><i class="icon-trash"></i>批量删除</a>
           &nbsp;&nbsp;
           <a href="javascript:void()" class="btn btn-success" id="insert_book_type" title="新增图书分类"><i
                   class="icon-adjust"></i>新增图书分类</a>

       </span>
                <span class="r_f">共：<b>${bookTypeCount}</b>条</span>
            </div>
            <!---->
            <div class="table_menu_list">
                <table class="table table-striped table-bordered table-hover" id="sample-table">
                    <thead>
                    <tr>
                        <th width="25"><label><input type="checkbox" class="ace"><span class="lbl"></span></label></th>
                        <th width="80">ID</th>
                        <th width="0">种类名称</th>
                        <th width="0" style="display: none"></th>
                        <th width="0" style="display: none"></th>
                        <th width="0" style="display: none"></th>
                        <th width="0" style="display: none"></th>
                        <th width="0" style="display: none"></th>
                        <th width="0" style="display: none"></th>
                        <th width="180">状态</th>
                        <th width="180">操作</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${bookType}" var="re">
                        <tr>
                            <td><label><input type="checkbox" class="ace"><span class="lbl"></span></label></td>
                            <td>${re.tId}</td>
                            <td><u style="cursor:pointer" class="text-primary">${re.tType}</u></td>
                            <td style="display: none"></td>
                            <td style="display: none"></td>
                            <td style="display: none"></td>
                            <td class="text-l" style="display: none"></td>
                            <td style="display: none"></td>
                            <td style="display: none"></td>

                            <td class="td-status">
                                <span class="label label-success radius">审核通过</span>
                            </td>
                            <td class="td-manage">

                                <a onClick="member_go(this,'${re.tId}')" href="javascript:;" title="删除此分类"
                                   class="btn btn-xs btn-danger"><i class="icon-trash bigger-120"></i></a>
                                &nbsp;
                                <a onClick="update_go(this,'${re.tId}')" href="javascript:;" title="修改此分类"
                                   class="btn btn-xs btn-success"><i class="icon-edit bigger-120"></i></a>
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>
</body>
</html>
<script>
    jQuery(function ($) {
        var oTable1 = $('#sample-table').dataTable({
            "aaSorting": [[1, "desc"]],//默认第几个排序
            "bStateSave": true,//状态保存
            "aoColumnDefs": [
                // {"bVisible": true, "aTargets": [3, 4, 5, 6, 7, 8, 9]}, //控制列的隐藏显示
                {"orderable": false, "aTargets": [0, 8, 9, 10]}// 制定列不参与排序
            ]
        });


        $('table th input:checkbox').on('click', function () {
            var that = this;
            $(this).closest('table').find('tr > td:first-child input:checkbox')
                .each(function () {
                    this.checked = that.checked;
                    $(this).closest('tr').toggleClass('selected');
                });

        });


        $('[data-rel="tooltip"]').tooltip({placement: tooltip_placement});

        function tooltip_placement(context, source) {
            var $source = $(source);
            var $parent = $source.closest('table')
            var off1 = $parent.offset();
            var w1 = $parent.width();

            var off2 = $source.offset();
            var w2 = $source.width();

            if (parseInt(off2.left) < parseInt(off1.left) + parseInt(w1 / 2)) return 'right';
            return 'left';
        }
    })

    /*删除*/
    function member_go(obj, id) {
        layer.confirm('确认要删除此分类吗？', function (index) {
            $.ajax({
                url: "/bookType/deleteBookTypeById",
                data: "tId=" + id,
                type: "POST",
                success: function (result) {
                    layer.msg('已经删除!', {icon: 6, time: 1000});
                }
            });
            setTimeout("location.href = '${pageContext.request.contextPath}/bookType/selectBookType'", "1500");
        });
    }

    /* 修改 */
    function update_go(obj, id) {
        location.href = "${pageContext.request.contextPath}/bookType/findBookTypeById?id=" + id;
    }


    //批量删除
    $("#delete_selected").click(function () {
        //遍历每一个被选中的元素
        var userNames = "";
        var del_idstr = "";
        $.each($(".ace:checked"), function () {
            userNames += $(this).parents("tr").find("td:eq(2)").text() + ",";
            //组装员工id字符串
            del_idstr += $(this).parents("tr").find("td:eq(1)").text() + "-";
        });
        //删除多余的，
        userNames = userNames.substring(0, userNames.length - 1);
        //去除删除的id多余的-
        del_idstr = del_idstr.substring(0, del_idstr.length - 1);
        layer.confirm('确认要删除' + '[' + userNames + ']' + '吗？', function () {
            $.ajax({
                url: "/bookType/deleteBookTypeById",
                data: "tId=" + del_idstr,
                type: "POST",
                success: function () {
                    layer.msg('已经删除!', {icon: 1, time: 1000});
                }
            });
            setTimeout("location.href = '${pageContext.request.contextPath}/bookType/selectBookType'", "1500");
        });
    });

    $("#insert_book_type").click(function () {
        location.href = "${pageContext.request.contextPath}/bookType/toaddBookType";
    });

    laydate({
        elem: '#start',
        event: 'focus'
    });

</script>