package org.core.presentation.router;

import org.core.presentation.router.exceptions.RouteNotFoundException;

import java.util.ArrayList;
import java.util.List;
import java.util.function.Consumer;

public class Router {
    private final String initial;
    private final List<Route> routes = new ArrayList<>();
    private final List<String> history = new ArrayList<>();
    private Route current;
    private Consumer<Route> onRouteChange;

    public Router(String initial, List<Route> routes) {
        this.initial = initial;
        this.routes.addAll(routes);
    }

    public String getInitial() {
        return initial;
    }

    private Route findRoute(String name) throws RouteNotFoundException {
        return routes.stream()
                .filter(route -> route.name().equals(name))
                .findFirst()
                .orElseThrow(() -> new RouteNotFoundException(name));
    }

    public void navigate(String name) {
        try {
            var before = current;
            var to = findRoute(name);

            if (before != null) history.add(before.name());

            current = to;
            if (onRouteChange != null) onRouteChange.accept(to);
        } catch (RouteNotFoundException e) {
            System.out.println(e.getMessage());
        }
    }

    public void back() {
        try {
            if (!history.isEmpty()) {
                var before = current;
                var to = history.getLast();

                history.removeLast();
                current = findRoute(to);

                if (onRouteChange != null) onRouteChange.accept(current);
            }
        } catch (RouteNotFoundException e) {
            System.out.println(e.getMessage());
        }
    }

    public void setOnRouteChange(Consumer<Route> onRouteChange) {
        this.onRouteChange = onRouteChange;
    }
}