package org.atm.domain.exceptions;

public class UserNotFoundException extends Exception
{
    public UserNotFoundException() {
        super("User not found");
    }
}
