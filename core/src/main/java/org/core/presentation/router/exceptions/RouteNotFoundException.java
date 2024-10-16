package org.core.presentation.router.exceptions;

public class RouteNotFoundException extends Exception {
    public RouteNotFoundException(String name) {
        super("Route not found: " + name);
    }
}
