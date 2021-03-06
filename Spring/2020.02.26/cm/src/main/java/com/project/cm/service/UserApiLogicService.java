package com.project.cm.service;

import com.project.cm.interfaces.CrudInterface;
import com.project.cm.model.entity.User;
import com.project.cm.model.enumclass.UserStatus;
import com.project.cm.model.network.Header;
import com.project.cm.model.network.request.UserApiRequest;
import com.project.cm.model.network.response.UserApiResponse;
import com.project.cm.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;
import java.util.Optional;

@Service
public class UserApiLogicService extends BaseService<UserApiRequest, UserApiResponse,User> {

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

        User newUser = baseRepository.save(user);



        return response(newUser);
    }

    @Override
    public Header<UserApiResponse> read(Long id) {

        return baseRepository.findById(id).
        map(user -> response(user))
        .orElseGet(() ->Header.ERROR("데이터가 없습니다."));
    }

    @Override
    public Header<UserApiResponse> update(Header<UserApiRequest> request) {

        UserApiRequest userApiRequest = request.getData();

        Optional<User> optional = baseRepository.findById(userApiRequest.getId());

        return optional.map(user -> {
            user.setAccount(userApiRequest.getAccount())
                    .setPassword(userApiRequest.getPassword())
                    .setStatus(userApiRequest.getStatus())
                    .setPhoneNumber(userApiRequest.getPhoneNumber())
                    .setEmail(userApiRequest.getEmail())
                    .setRegisteredAt(userApiRequest.getRegisteredAt())
                    .setUnregisteredAt(userApiRequest.getUnregisteredAt());
            return user;
        }).map(user -> baseRepository.save(user))
                .map(updateUser -> response(updateUser))  // userApiResponse 생성
                .orElseGet(() -> Header.ERROR("데이터가 없습니다"));
    }

    @Override
    public Header delete(Long id) {

        Optional<User> optionl = baseRepository.findById(id);

        return optionl.map(user -> {
            baseRepository.delete(user);
            return Header.OK();
        }).orElseGet(()-> Header.ERROR("데이터가 없습니다"));

    }

    private Header<UserApiResponse> response(User user) {
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

        return Header.OK(userApiResponse);
    }
}
