package com.servlet;


import com.servlet.utilities.MySqlConn;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(name = "ForgetPassServlet", urlPatterns = {"/user-forget"})
public class ForgetPassServlet extends HttpServlet {
    public void doPost(HttpServletRequest request,
                       HttpServletResponse response)
    {
        String username = request.getParameter("getBack-username");
        String password = request.getParameter("getBack-password");

        try {
            boolean result;
            result = MySqlConn.updateUserInfo(username, password, "", 0, 1,1);
            if(result)
            {
                response.sendRedirect("userSign.jsp");
                request.setAttribute("feedback","密码已重置！");
            }
        }catch (Exception e) {
            throw new RuntimeException("密码修改失败！");
        }

    }

}
