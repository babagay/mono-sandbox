package gojava.web.rest;

import com.codahale.metrics.annotation.Timed;
import gojava.security.AuthoritiesConstants;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.access.annotation.Secured;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * Foo controller
 */
@RestController
@RequestMapping("/api/foo")
public class FooResource {

    private final Logger log = LoggerFactory.getLogger(FooResource.class);

    /**
    * GET getFoo
    */
    @GetMapping("/get-foo")
    @Secured(AuthoritiesConstants.ADMIN)
    @Timed
    public String getFoo() {
        return "getFoo";
    }

    // пускает только анонима
    @GetMapping("/get-bar")
    @Secured(AuthoritiesConstants.ANONYMOUS)
    public String getBar() {
        return "getBoo";
    }

    /**
    * POST postFoo
    */
    @PostMapping("/post-foo")
    @Secured(AuthoritiesConstants.USER)
    public String postFoo() {
        return "postFoo";
    }

}
