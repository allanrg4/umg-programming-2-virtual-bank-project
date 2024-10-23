package org.manager.domain.repositories;

import org.manager.domain.entities.User;

public abstract class AuthRepository {
    public abstract User login(String username, String password);
}
