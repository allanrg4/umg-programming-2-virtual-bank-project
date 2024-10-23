package org.core.orm.exceptions;

public class NotSerializableException extends Exception {
    public NotSerializableException(String entity) {
        super("Entity " + entity + " is not serializable");
    }
}
