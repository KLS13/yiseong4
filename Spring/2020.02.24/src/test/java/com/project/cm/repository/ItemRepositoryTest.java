package com.project.cm.repository;

import com.project.cm.CmApplication;
import com.project.cm.CmApplicationTests;
import com.project.cm.model.entity.Item;
import org.junit.Assert;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.Optional;

public class ItemRepositoryTest extends CmApplicationTests {
    @Autowired
    private ItemRepository itemRepository;

    @Test
    public void create() {
        Item item = new Item();
        item.setName("이것이 자바다");
        item.setPrice(25000);
        item.setContent("자바 입문용 !");

        Item newItem = itemRepository.save(item);
        Assert.assertNotNull(newItem);
    }

    @Test
    public void read() {
        Long id = 2L;

        Optional<Item> item = itemRepository.findById(id);

        Assert.assertTrue(item.isPresent());

    }
}
