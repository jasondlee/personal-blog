package ee.jasondl.blog;

import java.text.SimpleDateFormat;
import java.util.Date;

import io.quarkiverse.roq.plugin.asciidoctorj.runtime.AsciidoctorJConverter;
import io.quarkus.arc.Arc;
import io.quarkus.arc.impl.LazyValue;
import io.quarkus.qute.TemplateExtension;

@TemplateExtension
public class Extensions {
    private static final LazyValue<AsciidoctorJConverter> CONVERTER = new LazyValue<>(
        () -> Arc.container().instance(AsciidoctorJConverter.class).get());

    public static String format(Date date, String format) {
        return new SimpleDateFormat(format).format(date);
    }

    public static String convert(String rawText) {
        return CONVERTER.get()
            .apply(rawText.replace("{#asciidoc}\n\n", ""));
    }

    public static String excerpt(String text) {
        int index = text.indexOf("// more");
        return (index == -1) ? text : text.substring(0, index);
    }
}
