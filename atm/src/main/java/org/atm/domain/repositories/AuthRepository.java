package org.atm.domain.repositories;

import org.atm.domain.entities.User;
import org.atm.domain.exceptions.UserNotFoundException;

public abstract class AuthRepository 
{
    public abstract User login(String username, String password)
            throws UserNotFoundException;
}

