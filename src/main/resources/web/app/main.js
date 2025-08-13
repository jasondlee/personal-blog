import hljs from 'highlight.js';
import foo from './highlightjs-line-numbers.js';
import 'highlight.js/styles/agate.css';


hljs.highlightAll();

foo(hljs, window, document);
hljs.initLineNumbersOnLoad();
