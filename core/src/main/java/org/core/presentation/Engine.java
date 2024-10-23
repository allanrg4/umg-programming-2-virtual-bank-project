package org.core.presentation;

import org.core.presentation.router.Router;

import javax.swing.*;

public class Engine {
    private final String title;
    private final Router router;

    public Engine(String title, Router router) {
        this.title = title;
        this.router = router;
    }

    public void start() {
        var frame = new JFrame(this.title);

        frame.setSize(300, 150);
        frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        frame.setLocationRelativeTo(null);

        this.router.setOnRouteChange((route) -> {
            frame.getContentPane().removeAll();
            frame.setContentPane(route.view().render(this.router));
            frame.revalidate();
            frame.repaint();
        });

        this.router.navigate(this.router.getInitial());
        frame.setVisible(true);
    }
}
