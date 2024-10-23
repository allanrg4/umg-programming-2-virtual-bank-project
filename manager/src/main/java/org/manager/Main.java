package org.manager;

import org.manager.presentation.views.login.LoginView;

import javax.swing.*;

public class Main {
    public static void main(String[] args) {
        SwingUtilities.invokeLater(() -> {
            final var loginView = new LoginView();
            loginView.setVisible(true);
        });
    }
}
