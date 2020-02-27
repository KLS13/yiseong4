package com.project.cm.controller.api;

import com.project.cm.controller.CrudController;
import com.project.cm.interfaces.CrudInterface;
import com.project.cm.model.entity.OrderGroup;
import com.project.cm.model.network.Header;
import com.project.cm.model.network.request.OrderGroupApiRequest;
import com.project.cm.model.network.response.OrderGroupApiResponse;
import com.project.cm.service.OrderGroupApiLogicService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.annotation.PostConstruct;

@RestController
@RequestMapping("/api/orderGroup")
public class OrderGroupApiController extends CrudController<OrderGroupApiRequest, OrderGroupApiResponse, OrderGroup> {

}
