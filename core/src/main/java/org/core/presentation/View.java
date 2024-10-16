package org.core.presentation;

import org.core.presentation.router.Router;

import javax.swing.*;

public interface View {
    JComponent render(Router router);
}
