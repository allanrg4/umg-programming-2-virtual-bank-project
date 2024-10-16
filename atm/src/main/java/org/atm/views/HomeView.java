package org.atm.views;

import org.core.presentation.View;
import org.core.presentation.router.Router;

import javax.swing.*;

public class HomeView implements View {
    @Override
    public JPanel render(Router router) {
        var panel = new JPanel();

        panel.setLayout(null);

        var userLabel = new JLabel("User:");
        userLabel.setBounds(10, 20, 80, 25);
        panel.add(userLabel);

        var loginButton = new JButton("Back");
        loginButton.setBounds(100, 80, 80, 25);
        panel.add(loginButton);

        loginButton.addActionListener(e -> {
            router.back();
        });

        return panel;
    }
}
