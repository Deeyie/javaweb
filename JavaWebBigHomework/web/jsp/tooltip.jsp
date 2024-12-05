<%--
  Created by IntelliJ IDEA.
  User: lol41
  Date: 2024/12/2
  Time: 下午12:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8"%>
<script type="text/javascript">
    function showAlert(feedback) {
        alert(feedback);
    }
</script>
<%
    String feedback = (String) request.getAttribute("feedback");
    if (feedback != null) {
%>
<script type="text/javascript">
    showAlert('<%=feedback%>');
</script>
<%}%>
