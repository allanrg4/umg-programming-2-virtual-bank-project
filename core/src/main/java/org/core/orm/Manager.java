package org.core.orm;

import java.util.List;

public abstract class Manager<E extends Entity> implements ManagerConnection {
    final String table;

    protected Manager(String name) {
        this.table = name;
    }

    public List<E> getAll() {
//        final var entries = new ArrayList<E>();
//        final var query = "SELECT * FROM " + this.table;
//
//        try (var conn = this.connect()) {
//            var stmt = conn.createStatement();
//            var rs = stmt.executeQuery(query);
//
//            while (rs.next()) {
//                @SuppressWarnings("unchecked")
//                var entry = (E) E.from(rs);
//                entries.add(entry);
//            }
//        } catch (Exception ignored) {
//        }
//
//        return entries;
        return null;
    }
}
