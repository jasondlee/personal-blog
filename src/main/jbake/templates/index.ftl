<!DOCTYPE html>
<html>
    <head>
        <title>Steeplesoft</title>

        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <link rel="alternate" type="application/rss+xml" title="Steeplesoft RSS Feed" href="<#if (content.rootpath)??>${content.rootpath}<#else></#if>feed.atom">
        <!-- Bootstrap -->
        <link rel="stylesheet" type="text/css" href="<#if (content.rootpath)??>${content.rootpath}<#else></#if>styles/asciidoctor-default.css">
        <link rel="stylesheet" href="<#if (content.rootpath)??>${content.rootpath}<#else></#if>netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap.min.css">
        <link rel="stylesheet" href="<#if (content.rootpath)??>${content.rootpath}<#else></#if>netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap-theme.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
        <script src="<#if (content.rootpath)??>${content.rootpath}<#else></#if>netdna.bootstrapcdn.com/bootstrap/3.1.1/js/bootstrap.min.js" type="text/javascript"></script>
        <!-- Local overrides, etc -->
        <link rel="stylesheet" type="text/css" href="<#if (content.rootpath)??>${content.rootpath}<#else></#if>styles/lightbox/lightbox.css">
        <link rel="stylesheet" type="text/css" href="<#if (content.rootpath)??>${content.rootpath}<#else></#if>styles/style.css">
        <link rel="stylesheet" type="text/css" href="<#if (content.rootpath)??>${content.rootpath}<#else></#if>styles/custom.css">
        <!-- Web Fonts -->
        <link rel="stylesheet" type="text/css" href="http://fonts.googleapis.com/css?family=Cherry+Cream+Soda">
        <link rel="stylesheet" type="text/css" href="http://fonts.googleapis.com/css?family=Philosopher">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.1.0/css/font-awesome.min.css">
        <style type="text/css"></style>
        <!--[if lt IE 9]><script src="<#if (content.rootpath)??>${content.rootpath}<#else></#if>html5shim.googlecode.com/svn/trunk/html5.js"></script><![endif]--><script src="<#if (content.rootpath)??>${content.rootpath}<#else></#if>scripts/lightbox/jquery-1.7.2.min.js" type="text/javascript"></script>
        <script src="<#if (content.rootpath)??>${content.rootpath}<#else></#if>scripts/lightbox/lightbox.js" type="text/javascript"></script>
    </head>
    <body style="padding-left: 10px; padding-right: 10px; margin-left: 10px; margin-right: 10px;">
        <div class="row">
            <div class="blogname"><span><a href="<#if (content.rootpath)??>${content.rootpath}<#else></#if>">Coming Up for Air</a></span></div>
        </div>
        <div class="row main">
            <div class="col-md-9 columns">
                <div class="pagination">
                    <div class="previous" style="width:50%; float: left">
                        <#if (previousFileName??)>
                            <a href="${previousFileName}">Previous</a>
                        <#else>
                            <p>Previous</p>
                        </#if>
                    </div>
                    <div class="next" style="width:50%; float: right; text-align: right">
                        <#if (nextFileName??)>
                            <a href="${nextFileName}">Next</a>
                        <#else>
                            <p>Next</p>
                        </#if>
                    </div>
                </div>
                <div style="clear: both"></div>
                <div id="content">
                    <#list posts as post>
                        <#if (post.status == "published")>
                            <a href="${post.uri}">
                                <h1><#escape x as x?xml>${post.title}</#escape></h1>
                            </a>
                            <p>${post.date?string("dd MMMM yyyy")}</p>
                            <p>${post.body?keep_before("<!-- Read More -->")}</p>
                        </#if>
                    </#list>
                </div>

                <div class="col-md-3 columns widget">
                    <div class="columns">
                        <h3>My Links
                        </h3>
                        <ul>
                            <li>
                                <a href="<#if (content.rootpath)??>${content.rootpath}<#else></#if>about" title="About">About</a>
                            </li>
                            <li>
                                <a href="<#if (content.rootpath)??>${content.rootpath}<#else></#if>projects" title="Projects">Projects</a>
                            </li>
                            <li>
                                <a href="<#if (content.rootpath)??>${content.rootpath}<#else></#if>+" rel="me" title="Google+">Google+</a>
                            </li>
                            <li>
                                <a href="<#if (content.rootpath)??>${content.rootpath}<#else></#if>linkedin" rel="me" title="LinkedIn">LinkedIn</a>
                            </li>
                            <li>
                                <a href="<#if (content.rootpath)??>${content.rootpath}<#else></#if>twitter" rel="me" title="Twitter">Twitter</a>
                            </li>
                            <li>
                                <a href="<#if (content.rootpath)??>${content.rootpath}<#else></#if>resume.pdf" rel="me" title="Resumé">Resumé</a>
                            </li>
                        </ul>

                    </div>
                    <div class="columns">
                        <h3>Quotes</h3>
                        <p id="quote">Sample quote</p>
                        <p id="source">Quote source</p>
                    </div>
                    <div class="columns">
                        <h3>Publications</h3>
                        <ul>
                            <li>
                                <a title="This article discusses ways to use Java EE specs to implement a simple, yet powerful plugin system with a minimum of thrid party libraries. " href="http://jaxenter.com/java-tech-journal/JTJ-2012-06">Tips for Writing Pluggable Java EE Applications</a>
                            </li>
                            <li>
                                <a title="An article Ken Paulsen and I wrote detailing easy JSF component creation" href="http://www.oracle.com/technetwork/articles/javaee/jsf-templating-137822.html">JSFTemplating and Woodstock: Component Authoring Made Easy</a>
                            </li>
                            <li>
                                <a href="http://jsfcentral.com/articles/lee-03-09.html">Jason Lee in depth: Mojarra and Scales</a>
                            </li>
                            <li>
                                <a title="My JavaOne 2008 Wrap Up" href="http://www.theserverside.com/news/thread.tss?thread_id=49343">Jason Lee: Postmortem for JavaOne 2008</a>
                            </li>
                            <li>
                                <a title="The GlassFish Adoption Story from my time at IEC" href="https://blogs.oracle.com/stories/entry/international_environmental">International Environmental: A Cooling Company Which Prefers Hot Software</a>
                            </li>
                            <li>
                                <a title="This details the project that spawned a couple of the Mojarra Scales components" href="http://www.jsfcentral.com/articles/trenches_7.html">IEC donates custom JSF component to Mojarra Scales</a>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="footer">
                <div class="small-12 columns">
                    <p>&#169; Copyright Jason Lee, 2005-2015. All rights reserved.</p>
                </div>
            </div>
            <script type="text/javascript">
                var _gaq = _gaq || [];
                _gaq.push(['_setAccount', 'UA-1091049-1']);
                _gaq.push(['_trackPageview']);
                (function () {
                    var ga = document.createElement('script');
                    ga.type = 'text/javascript';
                    ga.async = true;
                    ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
                    var s = document.getElementsByTagName('script')[0];
                    s.parentNode.insertBefore(ga, s);
                })();
            </script>
            <script src="<#if (content.rootpath)??>${content.rootpath}<#else></#if>scripts/quotes.js" type="text/javascript"></script>
            <script src="<#if (content.rootpath)??>${content.rootpath}<#else></#if>scripts/local.js" type="text/javascript"></script>
        </div>
    </body>
</html>
