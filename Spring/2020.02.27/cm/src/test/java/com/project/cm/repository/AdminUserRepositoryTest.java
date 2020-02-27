package com.project.cm.repository;

import com.project.cm.CmApplicationTests;
import com.project.cm.model.entity.AdminUser;
import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.junit4.SpringRunner;

import java.time.LocalDateTime;

@RunWith(SpringRunner.class)
public class AdminUserRepositoryTest extends CmApplicationTests {
    @Autowired
    private AdminUserRepository adminUserRepository;

    @Test
    public void create() {
        AdminUser adminUser = new AdminUser();
        adminUser.setAccount("Admin02");
        adminUser.setPassword("Admin02");
        adminUser.setStatus("Reg");
        adminUser.setRole("partner");
     //   adminUser.setCreatedAt(LocalDateTime.now());
     //   adminUser.setCreatedBy("Admin");

        AdminUser newAdminUser = adminUserRepository.save(adminUser);

        Assert.assertNotNull(newAdminUser);

        newAdminUser.setAccount("change");
        adminUserRepository.save(newAdminUser);
    }
}
