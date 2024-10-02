package org.umg.use_cases;

public interface UseCase<Result, Params> {
    Result execute(Params params);
}
