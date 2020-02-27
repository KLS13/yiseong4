package com.project.cm.interfaces;

import com.project.cm.model.network.Header;

public interface CrudInterface<Req,Res> {
    Header<Res> create(Header<Req> request);

    Header<Res> read(Long id);

    Header<Res> update(Header<Req> request);

    Header delete(Long id);
}
