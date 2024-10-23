package org.manager.domain.use_cases;

import org.core.domain.UseCase;
import org.manager.domain.entities.User;
import org.manager.domain.exceptions.UserNotFoundException;
import org.manager.domain.params.LoginParams;
import org.manager.domain.repositories.AuthRepository;

public class Login implements UseCase<User, LoginParams> {
    private final AuthRepository authRepo;

    public Login(AuthRepository authRepo) {
        this.authRepo = authRepo;
    }

    public User execute(LoginParams params) {
        if (params.username() == null || params.password() == null) {
            throw new IllegalArgumentException("Username and password must be provided");
        }

        try {
            return authRepo.login(params.username(), params.password());
        } catch (UserNotFoundException e) {
            throw new RuntimeException(e);
        }
    }
}
