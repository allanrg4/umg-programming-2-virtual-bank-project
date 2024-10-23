package org.manager.presentation.views.login;

import org.manager.data.repositories.AuthRepositoryImpl;
import org.manager.domain.params.LoginParams;
import org.manager.domain.use_cases.Login;

import javax.swing.*;
import java.awt.event.ActionEvent;

public class LoginController {
    private final LoginView view;

    public LoginController(LoginView view) {
        this.view = view;

        view.getLoginButton().addActionListener(this::login);
    }

    private void login(ActionEvent e) {
        final var username = this.view.getUsernameField().getText();
        final var password = new String(this.view.getPasswordField().getPassword());

        final var login = new Login(new AuthRepositoryImpl());

        try {
            final var result = login.execute(new LoginParams(username, password));
            JOptionPane.showMessageDialog(this.view, "Bienvenido " + result.username());
        } catch (Exception error) {
            System.out.println(error.getMessage());
            JOptionPane.showMessageDialog(this.view, "Error al iniciar sesión");
        }
    }
}
