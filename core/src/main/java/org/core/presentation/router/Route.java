package org.core.presentation.router;

import org.core.presentation.View;

public record Route(String path, String name, View view) {
}
