package org.manager.presentation.views.login;

import org.manager.data.repositories.AuthRepositoryImpl;
import org.manager.domain.use_cases.Login;

public class LoginController {
    public void login() {
        final var useCase = new Login(new AuthRepositoryImpl());
    }
}
