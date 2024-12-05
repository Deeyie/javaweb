document.addEventListener('DOMContentLoaded', () => {
    // 验证码
    let userCode;

    // 账号
    const accountElement = document.querySelector('[name = "register-account"]');

    // 昵称
    const usernameElement = document.querySelector('[name = "register-username"]');

    // 密码
    const passwordElement = document.querySelector('[name = "register-password"]');

    const confirmPasswordElement = document.querySelector('[name = "confirm_password"]');

    // 手机
    const emailElement = document.querySelector('[name = "email"]');

    // 验证码
    const codeElement = document.querySelector(".code");

    // 验证码按钮
    const codeButtonElement = document.querySelector(".code-button");
    if (codeButtonElement) {
        codeButtonElement.addEventListener('click', () => {
            const email = emailElement.value;
            sendCode(email);
        });
    } else {
        console.error("未找到 .code-button 元素");
    }

    // 注册按钮
    const registerButtonElement = document.querySelector(".register-button");
    if (registerButtonElement) {
        registerButtonElement.addEventListener('click', (event) => {
            event.preventDefault(); // 阻止表单默认提交行为
            const account = accountElement.value;
            const username = usernameElement.value;
            const password = passwordElement.value;
            const confirm_password = confirmPasswordElement.value;
            const email = emailElement.value;
            const code = parseInt(codeElement.value); // 确保转换为整数

            console.log(account, username, password, confirm_password, email, code);
            if (password !== confirm_password) {
                alert("两次输入的密码不一致");
                return false;
            }

            register(account, username, password, email, code);
        });
    } else {
        console.error("未找到 .register-button 元素");
    }

    // 注册函数
    function register(account, username, password, email, code) {
        if (account === "" || username === "" || password === "" || email === "" || code === "") {
            alert("请输入完整信息");
        }
        else if (account.length < 8 || account.length > 16) {
            alert("账号长度为8-16位");
        }
        else if (!/^\d+$/.test(account)) {
            alert("账号必须由数字构成！");
        }
        else if (username.length < 2 || username.length > 24) {
            alert("用户名字符为2-24个");
        }
        else if (code !== userCode) {
            alert("验证码不正确");
        }
        else if (account !== "" && username !== "" && password !== "" && email !== "" && code !== "") {
            document.querySelector('.register-form').submit();
        }
    }

    // 验证码函数
    function sendCode(email) {
        if (email === "") {
            alert("请输入邮箱账号");
        }
        else if (email !== "") {
            userCode = parseInt(Math.random() * (10000 - 1000)) + 1000;
            alert("验证码已发送！");
            alert("您的验证码为：" + userCode);

            codeButtonElement.setAttribute("disabled", "true");

            let times = 2;
            codeButtonElement.value = "(" + times-- + "s)";

            const buttonTime = setInterval(() => {
                if (times === 0) {
                    clearInterval(buttonTime);
                    codeButtonElement.value = "获取验证码";
                    codeButtonElement.removeAttribute("disabled");
                }
                else {
                    codeButtonElement.value = "(" + times-- + "s)";
                }
            }, 1000);
        }
    }
});
