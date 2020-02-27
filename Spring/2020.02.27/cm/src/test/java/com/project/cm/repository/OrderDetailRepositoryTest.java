package com.project.cm.repository;

import com.project.cm.CmApplicationTests;
import com.project.cm.model.entity.OrderDetail;
import com.project.cm.model.entity.User;
import org.junit.Assert;
import org.junit.jupiter.api.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.junit4.SpringRunner;

import java.math.BigDecimal;
import java.time.LocalDateTime;

public class OrderDetailRepositoryTest extends CmApplicationTests {

    @Autowired
    private OrderDetailRepository orderDetailRepository;

    @Test
    public void create() {

        OrderDetail orderDetail = new OrderDetail();

        orderDetail.setStatus("AA");
        orderDetail.setArrivalDate(LocalDateTime.now().plusDays(2));
        orderDetail.setQuantity(1);
        orderDetail.setTotalPrice(BigDecimal.valueOf(850000));
       // orderDetail.setOrderGroupId(1L);
      //  orderDetail.setItemId(1L);
        orderDetail.setCreatedAt(LocalDateTime.now());
        orderDetail.setCreatedBy("Admin");

        OrderDetail newOrder = orderDetailRepository.save(orderDetail);
        Assert.assertNotNull(newOrder);


    }

    @Test
    public void read() {

    }

}
