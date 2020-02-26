package com.project.cm.repository;

import com.project.cm.CmApplicationTests;
import com.project.cm.model.entity.Category;
import com.project.cm.model.entity.Item;
import com.project.cm.model.entity.User;
import org.junit.Assert;
import org.junit.jupiter.api.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.junit4.SpringRunner;

import javax.transaction.Transactional;
import java.time.LocalDateTime;
import java.util.Optional;


public class UserRepositoryTest extends CmApplicationTests {

    @Autowired
    private UserRepository userRepository;

    @Test
    public void create() {

        String account = "Test5";
        String password = "Test5";
        String status = "Res";
        String email = "Test@com";
        String phoneNumber = "010-3333-3333";
        LocalDateTime registeredAt = LocalDateTime.now();
        LocalDateTime createdAt = LocalDateTime.now();
        String createdBy = "Admin";

        User user = new User();
        user.setAccount(account);
        user.setPassword(password);
//        user.setStatus(status);
        user.setEmail(email);
        user.setPhoneNumber(phoneNumber);
        user.setRegisteredAt(registeredAt);

       // User u = User.builder().account(account).password(password).status(status).email(email).build();

        User newUser = userRepository.save(user);

        Assert.assertNotNull(newUser);

    }

    @Test
    @Transactional
    public void read() {
        User user = userRepository.findFirstByPhoneNumberOrderByIdDesc("010-3333-2222");



        if(user != null){

          //  user.setEmail("a").setPhoneNumber("a").setStatus("a");

            user.getOrderGroupList().stream().forEach(orderGroup -> {
                System.out.println("---------------------주문");
                System.out.println(orderGroup.getTotalPrice());
                System.out.println(orderGroup.getTotalQuantity());
                System.out.println(orderGroup.getRevName());
                System.out.println("---------------------상세");

                orderGroup.getOrderDetailList().forEach(orderDetail -> {
                    System.out.println("파트너사 이름 : " + orderDetail.getItem().getPartner().getName());
                    System.out.println("카테고리 : " + orderDetail.getItem().getPartner().getCategory().getTitle());
                    System.out.println("주문상태 : " + orderDetail.getStatus());
                    System.out.println("주문도착 : " + orderDetail.getArrivalDate());

                    System.out.println(orderDetail.getItem().getName());
                    System.out.println(orderDetail.getItem().getPartner().getCallCenter());
                });
            });

            Assert.assertNotNull(user);
        }

    }

    @Test
    public void update() {
    }

    @Test
    @Transactional
    public void delete() {

    }
}
