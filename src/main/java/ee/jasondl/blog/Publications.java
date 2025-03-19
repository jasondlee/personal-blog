package ee.jasondl.blog;

import java.util.List;

import io.quarkiverse.roq.data.runtime.annotations.DataMapping;

@DataMapping(value = "publications", parentArray = true)
public record Publications(List<Publication> list) {
    public record Publication(String title, String link, String text) {}
}
