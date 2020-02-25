package com.project.cm.interfaces;

import com.project.cm.model.network.Header;

public interface CrudInterface {
    Header create();

    Header read(Long id);

    Header update();

    Header delete(Long id);
}
