import hljs from 'highlight.js';
import installLineNumbers from './highlightjs-line-numbers.js';
import 'highlight.js/styles/rainbow.css';
// import './new.css';
// import './about.js';

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
