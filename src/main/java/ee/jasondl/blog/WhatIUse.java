package ee.jasondl.blog;

import java.util.List;

import io.quarkiverse.roq.data.runtime.annotations.DataMapping;

@DataMapping(value = "whatiuse", parentArray = true)
public record WhatIUse(List<Tech> techs) {
    public record Tech(String id,
                       String label,
                       String color,
                       List<String> entries) {
    }
}
