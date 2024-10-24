package org.atm.domain.user_cases;

import org.atm.domain.entities.User;
import org.atm.domain.exceptions.UserNotFoundException;
import org.atm.domain.params.LoginParams;
import org.atm.domain.repositories.AuthRepository;

public class Login implements UseCase<User, LoginParams>
{
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
