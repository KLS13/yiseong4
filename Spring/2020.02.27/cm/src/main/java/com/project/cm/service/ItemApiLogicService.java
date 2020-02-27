package com.project.cm.service;

import com.project.cm.model.entity.Item;
import com.project.cm.model.network.Header;
import com.project.cm.model.network.request.ItemApiRequest;
import com.project.cm.model.network.response.ItemApiResponse;
import com.project.cm.repository.PartnerRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;

@Service
public class ItemApiLogicService extends BaseService<ItemApiRequest,ItemApiResponse,Item> {
    @Autowired
    private PartnerRepository partnerRepository;

    @Override
    public Header<ItemApiResponse> create(Header<ItemApiRequest> request) {

        ItemApiRequest body = request.getData();

        Item item = Item.builder()
                .status(body.getStatus())
                .name(body.getName())
                .title(body.getTitle())
                .content(body.getContent())
                .price(body.getPrice())
                .brandName(body.getBrandName())
                .registeredAt(LocalDateTime.now())
                .partner(partnerRepository.getOne(body.getPartnerId()))
                .build();

        Item newItem = baseReposiotry.save(item);
        return response(newItem);
    }

    @Override
    public Header<ItemApiResponse> read(Long id) {

        return baseReposiotry.findById(id)
                .map(item -> response(item))
                .orElseGet(() -> Header.ERROR("데이터 없습니다."));
    }

    @Override
    public Header<ItemApiResponse> update(Header<ItemApiRequest> request) {

        ItemApiRequest body = request.getData();

        return baseReposiotry.findById(body.getId())
                .map(entityItem -> {
                    entityItem
                            .setStatus(body.getStatus())
                            .setName(body.getName())
                            .setTitle(body.getTitle())
                            .setContent(body.getContent())
                            .setPrice(body.getPrice())
                            .setBrandName(body.getBrandName())
                            .setRegisteredAt(body.getRegisteredAt())
                            .setUnregisteredAt(body.getUnregisteredAt());
                    return entityItem;
                }).map(newEntityItem -> baseReposiotry.save(newEntityItem))
                .map(item -> response(item))
                .orElseGet(() -> Header.ERROR("데이터가 없습니다."));
    }

    @Override
    public Header delete(Long id) {

        return baseReposiotry.findById(id)
                .map(item -> {
                    baseReposiotry.delete(item);
                    return Header.OK();
                })
                .orElseGet(() -> Header.ERROR("데이터가 없음"));
    }

    public Header<ItemApiResponse> response(Item item) {

        ItemApiResponse body = ItemApiResponse.builder()
                .id(item.getId())
                .status(item.getStatus())
                .name(item.getName())
                .title(item.getTitle())
                .content(item.getContent())
                .price(item.getPrice())
                .brandName(item.getBrandName())
                .registeredAt(item.getRegisteredAt())
                .unregisteredAt(item.getUnregisteredAt())
                .partnerId(item.getPartner().getId())
                .build();

        return Header.OK(body);
    }
}
