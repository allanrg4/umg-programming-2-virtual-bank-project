package org.core.orm;

import java.sql.ResultSet;
import java.sql.SQLException;

public interface Entity {
    static Entity from(ResultSet rs) throws SQLException {
        return null;
    }
}
