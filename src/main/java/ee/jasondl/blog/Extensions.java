package ee.jasondl.blog;

import java.text.SimpleDateFormat;
import java.util.Date;

import io.quarkiverse.qute.web.asciidoc.runtime.AsciidocConverter;
import io.quarkus.qute.TemplateExtension;
import io.vertx.core.json.JsonArray;
import org.jsoup.Jsoup;

@TemplateExtension
public class Extensions {
    public static String format(Date date, String format) {
        return new SimpleDateFormat(format).format(date);
    }

    public static String convert(String rawText) {
        return new AsciidocConverter().apply(rawText);
    }

    public static String excerpt(String text) {
        int index = text.indexOf("// more");
        return (index == -1) ? text : text.substring(0, index);
    }
}
