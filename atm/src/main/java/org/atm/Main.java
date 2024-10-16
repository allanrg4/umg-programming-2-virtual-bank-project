package org.atm;

import org.atm.views.HomeView;
import org.atm.views.LoginView;
import org.core.presentation.Engine;
import org.core.presentation.router.Route;
import org.core.presentation.router.Router;

import java.util.ArrayList;

public class Main {
    public static void main(String[] args) {
        final var routes = new ArrayList<Route>();
        routes.add(new Route("/", "home", new LoginView()));
        routes.add(new Route("/", "h", new HomeView()));

        new Engine("ATM", new Router(routes)).start();
    }
}
