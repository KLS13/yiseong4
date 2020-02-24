package com.project.cm.repository;

import com.project.cm.CmApplicationTests;
import com.project.cm.model.entity.OrderDetail;
import com.project.cm.model.entity.User;
import org.junit.Assert;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;

import java.time.LocalDateTime;

public class OrderDetailRepositoryTest extends CmApplicationTests {

    @Autowired
    private OrderDetailRepository orderDetailRepository;

    @Test
    public void create() {

        OrderDetail orderDetail = new OrderDetail();

        orderDetail.setOrderAt(LocalDateTime.now());

        //orderDetail.setUserId(4L);

        //orderDetail.setItemId(2L);

        OrderDetail newOrder = orderDetailRepository.save(orderDetail);
        Assert.assertNotNull(newOrder);
    }

    @Test
    public void read() {

    }

}
