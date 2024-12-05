document.addEventListener("DOMContentLoaded", function() {
    // 获取 .bubbles 容器
    const bubblesContainer = document.querySelector('.bubbles');


    const numBubbles = 42;
    function getRandomNumber(max) {return Math.floor(Math.random() * max);}


    for (let i = 1; i <= numBubbles; i++) {

        const bubble = document.createElement('span');
        const randomNum = getRandomNumber(numBubbles);

        bubble.style.setProperty('--i', randomNum);

        // 将新创建的 span 元素添加到 .bubbles 容器中
        bubblesContainer.appendChild(bubble);
    }
});
