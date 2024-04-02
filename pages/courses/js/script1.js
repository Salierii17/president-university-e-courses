function toggleTopic(contentId) {
    var content = document.getElementById(contentId);
    var displayStyle = content.style.display;
    content.style.display = displayStyle === 'block' ? 'none' : 'block';
}

document.addEventListener('DOMContentLoaded', function () {
    var navItems = document.querySelectorAll('.sidebar-nav .nav-item');

    navItems.forEach(function (item) {
        item.addEventListener('click', function () {
            navItems.forEach(function (item) {
                item.classList.remove('active');
            });
            this.classList.add('active');
        });
    });
});

function toggleTopic(contentId) {
    var content = document.getElementById(contentId);
    content.style.display = content.style.display === 'block' ? 'none' : 'block';
}

function toggleTopic(contentId) {
    var content = document.getElementById(contentId);
    if (content.style.display === 'block') {
      content.style.display = 'none';
      localStorage.setItem(contentId, 'none');
    } else {
      content.style.display = 'block';
      localStorage.setItem(contentId, 'block');
    }
  }
  
function toggleTopic(contentId) {
    var content = document.getElementById(contentId);
    content.style.display = content.style.display === 'block' ? 'none' : 'block';
    }

    document.addEventListener('DOMContentLoaded', function () {
    var allTopics = document.querySelectorAll('.topic-content');
    allTopics.forEach(function(topic) {
        topic.style.display = 'none';
    });
});
  