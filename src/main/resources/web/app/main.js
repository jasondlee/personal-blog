import hljs from 'highlight.js';
import installLineNumbers from './highlightjs-line-numbers.js';
import 'highlight.js/styles/rainbow.css';

installLineNumbers(hljs, window, document);

hljs.highlightAll();
hljs.initLineNumbersOnLoad();

// Mobile menu toggle
$(document).ready(function() {
    $('#mobile-menu-toggle').on('click', function(e) {
        e.preventDefault();
        $('#mobile-menu').toggleClass('active');
        $(this).toggleClass('active');
    });

    // Close mobile menu when clicking on a link
    $('#mobile-menu a').on('click', function() {
        $('#mobile-menu').removeClass('active');
        $('#mobile-menu-toggle').removeClass('active');
    });
});

// Dark mode toggle
document.addEventListener('DOMContentLoaded', function() {
    var toggle = document.getElementById('dark-mode-toggle');
    if (toggle) {
        toggle.addEventListener('click', function() {
            document.documentElement.classList.add('dark-transition');
            document.documentElement.classList.toggle('dark');
            localStorage.setItem('theme',
                document.documentElement.classList.contains('dark') ? 'dark' : 'light');
            setTimeout(function() {
                document.documentElement.classList.remove('dark-transition');
            }, 350);
        });
    }
});
