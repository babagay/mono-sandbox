package gojava.security;

import org.springframework.boot.autoconfigure.security.SecurityProperties;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.Collection;
import java.util.List;

/**
 * Controller to test spring security
 */
@RestController
@RequestMapping ("/api")
public class BaseSecurityController {


    // Сможет зайти админ и юзер
    @GetMapping("/role")
    @PreAuthorize( "hasRole('ROLE_USER')" )
    public ResponseEntity<Collection<? extends GrantedAuthority>> getUserRole(){

        org.springframework.security.core.context.SecurityContext context = SecurityContextHolder.getContext();
        Authentication auth = context.getAuthentication();
        User user = (User) auth.getPrincipal();
        System.out.println( user.getUsername() );

        Collection<? extends GrantedAuthority> ath = auth.getAuthorities();

        HttpHeaders httpHeaders = new HttpHeaders();

        return new ResponseEntity<>( ath, httpHeaders, HttpStatus.OK );
    }
}
