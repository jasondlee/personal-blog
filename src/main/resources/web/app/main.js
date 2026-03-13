import hljs from 'highlight.js';
import installLineNumbers from './highlightjs-line-numbers.js';
import 'highlight.js/styles/rainbow.css';
// import './new.css';
// import './about.js';

installLineNumbers(hljs, window, document);

hljs.highlightAll();
hljs.initLineNumbersOnLoad();
