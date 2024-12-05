<%--
  Created by IntelliJ IDEA.
  User: lol41
  Date: 2024/12/2
  Time: 下午5:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8"   %>
<div class="pull-left">
    <div class="form-group form-inline">
        <div class="btn-group">
            <button type="button" id="btn_add" name="btn_add" class="btn btn-default"
                    title="新建" onclick="">
                <i class="fa fa-file-o"></i> 新建
            </button>
            <button type="button" id="refresh" name="refresh" class="btn btn-default"
                    title="刷新">
                <i class="fa fa-refresh"></i> 刷新
            </button>
        </div>
    </div>
</div>
<div class="pull-right">
    <div class="form-group form-inline">
        <select class="form-control" id="stype" name="stype">
            <option value="0" selected>=请选择字段=</option>
            <option value="1">用户名称</option>
        </select>
        <input type="text" id="svalue" name="svalue" class="form-control"
               placeholder="请输入查找字段值" />
        <div class="btn-group">
            <button class="btn btn-info btn-search" id="search" name="search"
                    onclick="search()">查找</button>
        </div>
    </div>
</div>
