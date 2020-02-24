package com.project.cm.repository;

import com.project.cm.CmApplicationTests;
import com.project.cm.model.entity.Item;
import com.project.cm.model.entity.User;
import org.junit.Assert;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import javax.transaction.Transactional;
import java.time.LocalDateTime;
import java.util.Optional;

public class UserRepositoryTest extends CmApplicationTests {

    @Autowired
    private UserRepository userRepository;

    @Test
    public void create() {
        User user = new User();
        user.setAccount("Test05");
        user.setEmail("Test04@mail.com");
        user.setPhoneNumber("010-4444-1234");
        user.setCreatedAt(LocalDateTime.now());
        user.setCreatedBy("TestUser04");

        User newUser = userRepository.save(user);
        System.out.println("newUser : " + newUser);

    }

    @Test
    @Transactional
    public void read() {

        Optional<User> user = userRepository.findByAccount("Test05");
        user.ifPresent(selectUser -> {
            selectUser.getOrderDetails().stream().forEach(detail->{
                Item item = detail.getItem();
                System.out.println(detail.getItem());
            });
        });
    }

    @Test
    public void update() {
        Optional<User> user = userRepository.findById(2L);

        user.ifPresent(selectUser ->{
            selectUser.setAccount("testUpdate");
            selectUser.setUpdatedAt(LocalDateTime.now());
            selectUser.setUpdatedBy("update method()");

            userRepository.save(selectUser);
        });
    }

    @Test
    @Transactional
    public void delete() {
        Optional<User> user = userRepository.findById(1L);

        Assert.assertTrue(user.isPresent());

        user.ifPresent(selectUser ->{
            userRepository.delete(selectUser);
        });
        Optional<User> deleteUser = userRepository.findById(1L);

        Assert.assertFalse(deleteUser.isPresent());

    }
}
