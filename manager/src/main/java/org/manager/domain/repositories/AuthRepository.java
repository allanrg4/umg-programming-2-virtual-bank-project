package org.manager.domain.repositories;

import org.manager.domain.entities.User;
import org.manager.domain.exceptions.UserNotFoundException;

public abstract class AuthRepository {
    public abstract User login(String username, String password)
            throws UserNotFoundException;
}
