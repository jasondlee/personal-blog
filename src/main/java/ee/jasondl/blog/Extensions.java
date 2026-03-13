package ee.jasondl.blog;

import java.text.SimpleDateFormat;
import java.util.Date;

import io.quarkiverse.roq.frontmatter.runtime.RoqTemplateExtension;
import io.quarkiverse.roq.frontmatter.runtime.model.Page;
import io.quarkus.qute.TemplateExtension;
import org.jsoup.Jsoup;
import org.jsoup.select.Elements;

@TemplateExtension
public class Extensions {

    public static String format(Date date, String format) {
        return new SimpleDateFormat(format).format(date);
    }

    public static String removeToc(String html) {
        Elements toc = Jsoup.parse(html).select("#toc");
        return (!toc.isEmpty()) ? toc.next().html() : html;
    }

    public static String excerpt(Page post, int limit) throws InterruptedException {
        String content = post.content();
        int count = 0;
        // This is really dumb and doesn't seem like I should have to do this, but post.content() occasionally returns
        // an empty string
        while (count < 10 && content.isEmpty()) {
            Thread.sleep(500);
            count++;
            content = post.content();
        }

        if (content.isEmpty()) {
            throw new RuntimeException("Failed to get content for " + post.title());
        }

        var stripped = RoqTemplateExtension.stripHtml(removeToc(content)).trim();
        var limited = RoqTemplateExtension.wordLimit(stripped, limit);

        return limited + (limited.endsWith(".") ? ".." : "...");
    }


    public static String homePageLink(Page page, String link) {
        return page.url().path().equals("/") ? link : page.site().url().toString() + link;
    }
}
