package ee.jasondl.blog;

import java.util.List;

import io.quarkiverse.roq.data.runtime.annotations.DataMapping;

@DataMapping(value = "links", parentArray = true)
public record Links(List<Link> list) {
    public record Link(String title, String link) {}
}

