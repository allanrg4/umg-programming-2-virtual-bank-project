package org.core.domain;

public interface UseCase<Type, Params> {
    Type execute(Params params);
}
