package org.core.orm;

import org.apache.commons.dbutils.DbUtils;
import org.core.config.DBConfig;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public interface Manager {
    default Connection connect() throws SQLException {
        DbUtils.loadDriver("com.mysql.cj.jdbc.Driver");

        final var config = DBConfig.getInstance();
        return DriverManager.getConnection(
                config.getConnectionUrl(),
                config.getUser(),
                config.getPassword());
    }
}
