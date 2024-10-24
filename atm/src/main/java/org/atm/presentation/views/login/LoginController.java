package org.atm.presentation.views.login;

import javax.swing.JOptionPane;

import org.atm.domain.params.LoginParams;
import org.atm.domain.user_cases.Login;
import org.atm.views.LoginView;

public class LoginController 
{
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
