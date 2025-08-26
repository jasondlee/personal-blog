package ee.jasondl.blog;

import io.quarkus.qute.TemplateExtension;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;

import java.text.SimpleDateFormat;
import java.util.Arrays;
import java.util.Date;

@TemplateExtension
public class Extensions {

    public static String format(Date date, String format) {
        return new SimpleDateFormat(format).format(date);
    }

    public static String removeToc(String doc) {
        Document parse = Jsoup.parse(doc);
        parse.select("#toc").remove();

        return parse.html();
    }

    public static String excerpt(String text, int limit) {
        int index = text.strip().indexOf("\n");
        var firstLine = text.substring(0, (index != -1) ? index : text.length());
        String[] words = firstLine.split("\\s+");

        return ((words.length < limit) ? firstLine :
                String.join(" ", Arrays.copyOfRange(words, 0, limit))) + "...";
    }
}
