package ee.jasondl.blog;

import static io.quarkiverse.roq.frontmatter.runtime.RoqTemplateAttributes.PAGE_PATH;
import static io.quarkiverse.roq.frontmatter.runtime.RoqTemplateAttributes.PAGE_URL;
import static io.quarkiverse.roq.frontmatter.runtime.RoqTemplateAttributes.SITE_PATH;
import static io.quarkiverse.roq.frontmatter.runtime.RoqTemplateAttributes.SITE_URL;
import static io.quarkiverse.roq.frontmatter.runtime.RoqTemplateAttributes.SOURCE_PATH;

import io.quarkiverse.roq.frontmatter.runtime.RoqTemplateAttributes;
import io.quarkiverse.roq.frontmatter.runtime.model.DocumentPage;
import io.quarkiverse.roq.frontmatter.runtime.model.Site;
import io.quarkiverse.roq.plugin.asciidoctorj.runtime.AsciidoctorJConverter;
import io.quarkus.arc.Arc;
import io.quarkus.arc.InstanceHandle;
import io.quarkus.arc.impl.LazyValue;
import io.quarkus.qute.TemplateExtension;

import java.text.SimpleDateFormat;
import java.util.Arrays;
import java.util.Date;
import java.util.HashMap;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

@TemplateExtension
public class Extensions {

    public static String format(Date date, String format) {
        return new SimpleDateFormat(format).format(date);
    }

    public static String excerpt(String text, int limit) {
        int index = text.strip().indexOf("\n");
        var firstLine = text.substring(0, (index != -1) ? index : text.length());
        String[] words = firstLine.split("\\s+");

        return ((words.length < limit) ? firstLine :
                String.join(" ", Arrays.copyOfRange(words, 0, limit))) + "...";
    }
}
