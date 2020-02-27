package com.project.cm.service;

import com.project.cm.interfaces.CrudInterface;
import com.project.cm.model.entity.OrderGroup;
import com.project.cm.model.entity.User;
import com.project.cm.model.enumclass.UserStatus;
import com.project.cm.model.network.Header;
import com.project.cm.model.network.Pagination;
import com.project.cm.model.network.request.UserApiRequest;
import com.project.cm.model.network.response.ItemApiResponse;
import com.project.cm.model.network.response.OrderGroupApiResponse;
import com.project.cm.model.network.response.UserApiResponse;
import com.project.cm.model.network.response.UserOrderInfoApiResponse;
import com.project.cm.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import java.time.LocalDateTime;
import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

@Service
public class UserApiLogicService implements CrudInterface<UserApiRequest, UserApiResponse> {

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private OrderGroupApiLogicService orderGroupApiLogicService;

    @Autowired
    private ItemApiLogicService itemApiLogicService;

    @Override
    public Header<UserApiResponse> create(Header<UserApiRequest> request) {

        UserApiRequest userApiRequest = request.getData();

        User user = User.builder()
                .account(userApiRequest.getAccount())
                .password(userApiRequest.getPassword())
                .status(UserStatus.REGISTERED)
                .phoneNumber(userApiRequest.getPhoneNumber())
                .email(userApiRequest.getEmail())
                .registeredAt(LocalDateTime.now())
                .build();

        User newUser = userRepository.save(user);

        return Header.OK(response(newUser));
    }

    @Override
    public Header<UserApiResponse> read(Long id) {

        return userRepository.findById(id).
        map(user -> response(user))
        .map(Header::OK)
        .orElseGet(() ->Header.ERROR("데이터가 없습니다."));
    }

    @Override
    public Header<UserApiResponse> update(Header<UserApiRequest> request) {

        UserApiRequest userApiRequest = request.getData();

        Optional<User> optional = userRepository.findById(userApiRequest.getId());

        return optional.map(user -> {
            user.setAccount(userApiRequest.getAccount())
                    .setPassword(userApiRequest.getPassword())
                    .setStatus(userApiRequest.getStatus())
                    .setPhoneNumber(userApiRequest.getPhoneNumber())
                    .setEmail(userApiRequest.getEmail())
                    .setRegisteredAt(userApiRequest.getRegisteredAt())
                    .setUnregisteredAt(userApiRequest.getUnregisteredAt());
            return user;
        }).map(user -> userRepository.save(user))
                .map(updateUser -> response(updateUser))  // userApiResponse 생성
                .map(Header::OK)
                .orElseGet(() -> Header.ERROR("데이터가 없습니다"));
    }

    @Override
    public Header delete(Long id) {

        Optional<User> optionl = userRepository.findById(id);

        return optionl.map(user -> {
            userRepository.delete(user);
            return Header.OK();
        }).orElseGet(()-> Header.ERROR("데이터가 없습니다"));

    }

    private UserApiResponse response(User user) {
        UserApiResponse userApiResponse = UserApiResponse.builder()
                .id(user.getId())
                .account(user.getAccount())
                .password(user.getPassword())
                .email(user.getEmail())
                .phoneNumber(user.getPhoneNumber())
                .status(user.getStatus())
                .registeredAt(user.getRegisteredAt())
                .unRegisteredAt(user.getUnregisteredAt())
                .build();

        return userApiResponse;
    }

    public Header<List<UserApiResponse>> search(Pageable pageable) {
        Page<User> users = userRepository.findAll(pageable);

        List<UserApiResponse> userApiResponseList = users.stream()
                .map(user -> response(user))
                .collect(Collectors.toList());

        Pagination pagination = Pagination.builder()
                .totalPages(users.getTotalPages())
                .totalElements(users.getTotalElements())
                .currentPage(users.getNumber())
                .currentElements(users.getNumberOfElements())
                .build();


        return Header.OK(userApiResponseList,pagination);
    }

    public Header<UserOrderInfoApiResponse> orderInfo(Long id) {
        User user = userRepository.getOne(id);
        UserApiResponse userApiResponse = response(user);

        List<OrderGroup> orderGroupList = user.getOrderGroupList();
        List<OrderGroupApiResponse> orderGroupApiResponseList = orderGroupList.stream()
                .map(orderGroup -> {
                    OrderGroupApiResponse orderGroupApiResponse = orderGroupApiLogicService.response(orderGroup).getData();

                    List<ItemApiResponse> itemApiResponseList = orderGroup.getOrderDetailList().stream()
                            .map(detail -> detail.getItem())
                            .map(item -> itemApiLogicService.response(item).getData())
                            .collect(Collectors.toList());

                    orderGroupApiResponse.setItemApiResponseList(itemApiResponseList);
                    return orderGroupApiResponse;
                })

                .collect(Collectors.toList());

        userApiResponse.setOrderGroupApiResponseList(orderGroupApiResponseList);

        UserOrderInfoApiResponse userOrderInfoApiResponse = UserOrderInfoApiResponse.builder()
                .userApiResponse(userApiResponse)
                .build();

                return Header.OK(userOrderInfoApiResponse);

    }
}
