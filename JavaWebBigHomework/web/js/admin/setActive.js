function setActive() {
    let currentUrl = encodeURIComponent(window.location.href);
    let navLinks = document.querySelectorAll('.sidebar-menu a');
    if (navLinks.length === 0) {
        return;
    }
    navLinks.forEach(function(link) {
        link.parentElement.classList.remove('active');
        let href = link.getAttribute('href');
        if (href && currentUrl.includes(encodeURIComponent(href))) {
            link.parentElement.classList.add('active');
            if (link.parentElement.parentElement.parentElement.nodeName === 'LI'){
                link.parentElement.parentElement.parentElement.classList.add('active');
            }
        }
    })}

function setActiveName() {
    let currentUrl = encodeURIComponent(window.location.href);
    let li = document.querySelector('.breadcrumb .active');
    let span = document.querySelector('.content-header h1 span')
    let navLinks = document.querySelectorAll('.sidebar-menu a');
    if (navLinks.length === 0) {
        return;
    }
    navLinks.forEach(function(link) {
        let href = link.getAttribute('href');
        if (href && currentUrl.includes(encodeURIComponent(href))) {
            span.innerText = link.innerText;
            li.innerText = link.innerText;
        }
    })
}

setActive();
setActiveName();