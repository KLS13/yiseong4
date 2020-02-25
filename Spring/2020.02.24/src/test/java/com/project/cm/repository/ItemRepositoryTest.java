package com.project.cm.repository;

import com.project.cm.CmApplication;
import com.project.cm.CmApplicationTests;
import com.project.cm.model.entity.Item;
import org.junit.Assert;
import org.junit.jupiter.api.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.junit4.SpringRunner;

import java.time.LocalDateTime;
import java.util.Optional;

public class ItemRepositoryTest extends CmApplicationTests {
    @Autowired
    private ItemRepository itemRepository;

    @Test
    public void create() {

        Item item = new Item();
        item.setStatus("dd");
        item.setName("코딩");
        item.setTitle("자바");
        item.setContent("JDK8");
        item.setPrice(59990);
        item.setBrandName("한빛미디어");
        item.setRegisteredAt(LocalDateTime.now());
        item.setCreatedAt(LocalDateTime.now());
        item.setCreatedBy("p1");
      //  item.setPartnerId(1L);

        Item newItem = itemRepository.save(item);
        Assert.assertNotNull(newItem);
    }

    @Test
    public void read() {

    }
}
