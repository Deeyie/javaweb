document.addEventListener('DOMContentLoaded', () => {
    // 用户名
    const usernameElement = document.querySelector('[name = "login-username"]');

    // 密码
    const passwordElement = document.querySelector('[name = "login-password"]');

    // 登录按钮
    const loginButtonElement = document.querySelector(".login-button");

    if (loginButtonElement) {
        loginButtonElement.addEventListener('click', (event) => {
            event.preventDefault(); // 阻止表单默认提交行为
            const username = usernameElement.value;
            const password = passwordElement.value;

            if (!login(username, password)) {
                // 如果验证失败，阻止表单提交
                return false;
            }

            // 如果验证成功，手动提交表单
            document.querySelector('.login-form').submit();
        });
    } else {
        console.error("登录按钮未找到");
    }
});

// 登录函数
function login(username, password) {
    if (username === "") {
        alert("请输入用户名");
        return false;
    } else if (password === "") {
        alert("请输入密码");
        return false;
    } else if (username !== "" && password !== "") {
        return true;
    }
}
