document.addEventListener("DOMContentLoaded", function() {
    const avatarImg = document.getElementById('avatar');
    const musicStatusButton = document.getElementById('music-status');
    const loadingScreen = document.getElementById('loading-screen');
    const enterBtn = document.getElementById('enter-btn');
    const container = document.querySelector('.container');

    const passwordInput = document.getElementById('password-input');
    const submitPasswordBtn = document.getElementById('submit-password');
    const errorMessage = document.getElementById('error-message');
    const hiddenContent = document.getElementById('hidden-content');
    const passwordProtect = document.getElementById('password-protect');
    
    
    
    const correctPassword = "ddd"; // 设定正确密码
    
    submitPasswordBtn.addEventListener('click', function() {
        const enteredPassword = passwordInput.value;

        if (enteredPassword === correctPassword) {
            passwordProtect.style.display = 'none'; // 隐藏输入框和按钮
            hiddenContent.style.display = 'block'; // 显示隐藏内容
        } else {
            errorMessage.style.display = 'block'; // 显示错误信息
        }
    });

    // 还可以设置回车键提交
    passwordInput.addEventListener('keydown', function(event) {
        if (event.key === 'Enter') {
            submitPasswordBtn.click();
        }
    });
    
    let audioElement = new Audio('/resources/music.mp3');
    audioElement.loop = true;

    // 添加鼠标移动事件监听器
    document.addEventListener('mousemove', function(event) {
        console.log(`鼠标位置: X=${event.clientX}, Y=${event.clientY}`);
    });


    // 用户点击“加载页面”按钮后，显示页面并播放音乐
    enterBtn.addEventListener('click', function() {
        loadingScreen.style.display = 'none'; // 隐藏加载页面
        container.style.display = 'flex'; // 显示页面内容
        audioElement.play().then(() => {
            avatarImg.classList.remove('paused'); // 音乐播放时旋转
            musicStatusButton.textContent = '音乐正在播放';
        }).catch(() => {
            console.log('播放失败，用户未交互');
        });
    });
    
    

    // 点击头像控制音乐播放和暂停
    avatarImg.addEventListener('click', function() {
        if (audioElement.paused) {
            audioElement.play().then(() => {
                avatarImg.classList.remove('paused');
                musicStatusButton.textContent = '音乐正在播放';
            });
        } else {
            audioElement.pause();
            avatarImg.classList.add('paused');
            musicStatusButton.textContent = '音乐已暂停';
        }
    });

    // 当音乐结束时，停止旋转动画
    audioElement.addEventListener('ended', function() {
        avatarImg.classList.add('paused');
        musicStatusButton.textContent = '音乐已结束';
    });
    

    // 随机颜色函数
    // 1. 自定义一个随机颜色函数
    function getRandomColor(flag = true) {
        if (flag) {
          // 3. 如果是true 则返回 #ffffff
          let str = '#'
          let arr = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'a', 'b', 'c', 'd', 'e', 'f']
          // 利用for循环随机抽6次 累加到 str里面
          for (let i = 1; i <= 6; i++) {
            // 每次要随机从数组里面抽取一个  
            // random 是数组的索引号 是随机的
            let random = Math.floor(Math.random() * arr.length)
            // str = str + arr[random]
            str += arr[random]
          }
          return str
  
        } else {
          // 4. 否则是 false 则返回 rgb(255,255,255)
          let r = Math.floor(Math.random() * 256)  // 55
          let g = Math.floor(Math.random() * 256)  // 89
          let b = Math.floor(Math.random() * 256)  // 255
          return `rgb(${r},${g},${b})`
        }
  
      }

      const countdown = document.querySelector('.countdown')
      countdown.style.backgroundColor = getRandomColor()

      function getCountTime() {

        const now = +new Date()

        const last = +new Date('2003-12-3 00:00:00')

        const count = (now - last) / 1000

        let h = parseInt(count / 60 / 60 % 24)
        let m = parseInt(count / 60 % 60)
        let s = parseInt(count % 60)

        document.querySelector('#hour').innerHTML = h
        document.querySelector('#minutes').innerHTML = m
        document.querySelector('#scond').innerHTML = s
        const date = new Date()
        document.querySelector('.countdown .next').innerHTML = `今天是${date.getFullYear()}年${date.getMonth() + 1}月${date.getDate()}日`
        document.querySelector('.countdown .days').innerHTML = `${parseInt(count / 60 / 60 / 24)}天`
      }
      // 先调用一次
      getCountTime()
      setInterval(() => {
        // 6. 颜色随机
        countdown.style.backgroundColor = getRandomColor()
      }, 60000)
  
      // 开启定时器
      setInterval(getCountTime, 1000)
//
//     const sliderData = [
//     { url: '/resources/images/slider01.jpg', title: '对人类来说会不会太超前了？', color: 'rgb(100, 67, 68)' },
//     { url: '/resources/images/slider02.jpg', title: '开启剑与雪的黑暗传说！', color: 'rgb(43, 35, 26)' },
//     { url: '/resources/images/slider03.jpg', title: '真正的jo厨出现了！', color: 'rgb(36, 31, 33)' },
//     { url: '/resources/images/slider04.jpg', title: '李玉刚：让世界通过B站看到东方大国文化', color: 'rgb(139, 98, 66)' },
//     { url: '/resources/images/slider05.jpg', title: '快来分享你的寒假日常吧~', color: 'rgb(67, 90, 92)' },
//     { url: '/resources/images/slider06.jpg', title: '哔哩哔哩小年YEAH', color: 'rgb(166, 131, 143)' },
//     { url: '/resources/images/slider07.jpg', title: '一站式解决你的电脑配置问题！！！', color: 'rgb(53, 29, 25)' },
//     { url: '/resources/images/slider08.jpg', title: '谁不想和小猫咪贴贴呢！', color: 'rgb(99, 72, 114)' },
//   ]
//
// // 1. 获取元素
// const img = document.querySelector('.container .middle-column .content .slider-wrapper img')
//
// const p = document.querySelector('.slider-footer p')
// let i = 0  // 信号量 控制图片的张数
// // 2. 开启定时器
//
// setInterval(function () {
//   i++
//   // 无缝衔接位置  一共八张图片，到了最后一张就是 8， 数组的长度就是 8
//   if (i >= sliderData.length) {
//     i = 0
//   }
//   // console.log(i)
//   // console.log(sliderData[i])
//   // 更换图片路径
//   img.src = sliderData[i].url
//   // 把字写到 p里面
//   p.innerHTML = sliderData[i].title
//   // 小圆点
//   // 先删除以前的active
//   document.querySelector('.slider-indicator .active').classList.remove('active')
//   // 只让当前li添加active
//   document.querySelector(`.slider-indicator li:nth-child(${i + 1})`).classList.add('active')
// }, 2000)

    
const   arr = ['吃饭', '玩手机', '打篮球', '睡觉', '踢足球', '聚餐', '看电影', '逛街', '遛狗', '打游戏', '找男/女朋友']

const playwhat = document.querySelector('.playwhat')
const start = document.querySelector('.start')
const end = document.querySelector('.end')

let timerid = 0
end.disabled = false

start.addEventListener('click',function(){
    timerid = setInterval(function(){
        let index = Math.floor(Math.random()*arr.length)
        playwhat.innerHTML = arr[index]
    },50)
    start.disabled = true
    end.disabled = false
})
end.addEventListener('click',function(){
    clearInterval(timerid)
    start.disabled = false
    end.disabled = true
})


});


