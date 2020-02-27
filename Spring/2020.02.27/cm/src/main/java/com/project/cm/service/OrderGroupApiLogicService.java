package com.project.cm.service;

import com.project.cm.interfaces.CrudInterface;
import com.project.cm.model.entity.OrderGroup;
import com.project.cm.model.network.Header;
import com.project.cm.model.network.request.OrderGroupApiRequest;
import com.project.cm.model.network.response.OrderGroupApiResponse;
import com.project.cm.repository.OrderGroupRepository;
import com.project.cm.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import sun.security.krb5.internal.ccache.CredentialsCache;

@Service
public class OrderGroupApiLogicService extends BaseService<OrderGroupApiRequest, OrderGroupApiResponse,OrderGroup> {

    @Autowired
    private UserRepository userRepository;

    @Override
    public Header<OrderGroupApiResponse> create(Header<OrderGroupApiRequest> request) {

        OrderGroupApiRequest body = request.getData();

        OrderGroup orderGroup = OrderGroup.builder()
                .status(body.getStatus())
                .orderType(body.getOrderType())
                .revAddress(body.getRevAddress())
                .revName(body.getRevName())
                .paymentType(body.getPaymentType())
                .totalPrice(body.getTotalPrice())
                .totalQuantity(body.getTotalQuantity())
                .orderAt(body.getOrderAt())
                .arrivalDate(body.getArrivalDate())
                .user(userRepository.getOne(body.getUserId()))
                .build();

        OrderGroup newOrderGroup = baseReposiotry.save(orderGroup);

        return response(newOrderGroup);
    }

    @Override
    public Header<OrderGroupApiResponse> read(Long id) {

        return baseReposiotry.findById(id)
                .map(this::response)
                .orElseGet(()-> Header.ERROR("데이터 없음"));
        }

    @Override
    public Header<OrderGroupApiResponse> update(Header<OrderGroupApiRequest> request) {

        OrderGroupApiRequest body = request.getData();

        return baseReposiotry.findById(body.getId())
                .map(orderGroup -> {
                    orderGroup.setStatus(body.getStatus())
                            .setOrderType(body.getOrderType())
                            .setRevAddress(body.getRevAddress())
                            .setRevName(body.getRevName())
                            .setPaymentType(body.getPaymentType())
                            .setTotalPrice(body.getTotalPrice())
                            .setTotalQuantity(body.getTotalQuantity())
                            .setOrderAt(body.getOrderAt())
                            .setArrivalDate(body.getArrivalDate())
                            .setUser(userRepository.getOne(body.getUserId()));

                            return orderGroup;

                })
                .map(changeOrderGroup -> baseReposiotry.save(changeOrderGroup))
                .map(this::response)
                .orElseGet(()->Header.ERROR("데이터없음"));
    }

    @Override
    public Header delete(Long id) {

       return baseReposiotry.findById(id)
                .map(orderGroup -> {
                    baseReposiotry.delete(orderGroup);
                    return Header.OK();
                })

                .orElseGet(()->Header.ERROR("데이터없음"));
    }

    public Header<OrderGroupApiResponse> response(OrderGroup orderGroup) {
        OrderGroupApiResponse body = OrderGroupApiResponse.builder()
                .id(orderGroup.getId())
                .status(orderGroup.getStatus())
                .orderType(orderGroup.getOrderType())
                .revAddress(orderGroup.getRevAddress())
                .revName(orderGroup.getRevName())
                .paymentType(orderGroup.getPaymentType())
                .totalPrice(orderGroup.getTotalPrice())
                .totalQuantity(orderGroup.getTotalQuantity())
                .orderAt(orderGroup.getOrderAt())
                .arrivalDate(orderGroup.getArrivalDate())
                .userId(orderGroup.getUser().getId())
                .build();

        return Header.OK(body);
    }
}
