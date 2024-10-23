package org.manager.presentation;

import org.core.presentation.router.Route;
import org.core.presentation.router.Router;

import java.util.ArrayList;

public class AppRouter {
    public static Router getRouter() {
        final var routes = new ArrayList<Route>();
        return new Router("login", routes);
    }
}
