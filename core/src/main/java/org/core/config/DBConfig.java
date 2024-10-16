package org.core.config;

import io.github.cdimascio.dotenv.Dotenv;

public class DBConfig {
    private static DBConfig instance;

    private final String engine;
    private final String host;
    private final String port;
    private final String user;
    private final String password;
    private final String database;

    private DBConfig() {
        var envs = Dotenv.load();

        engine = envs.get("DB_ENGINE");
        host = envs.get("DB_HOST");
        port = envs.get("DB_PORT");
        user = envs.get("DB_USER");
        password = envs.get("DB_PASSWORD");
        database = envs.get("DB_NAME");
    }

    public static DBConfig getInstance() {
        if (instance == null)
            instance = new DBConfig();

        return instance;
    }

    public String getConnectionUrl() {
        return String.format(
                "jdbc:%s://%s:%s/%s",
                this.engine,
                this.host,
                this.port,
                this.database);
    }

    public String getUser() {
        return this.user;
    }

    public String getPassword() {
        return this.password;
    }
}
