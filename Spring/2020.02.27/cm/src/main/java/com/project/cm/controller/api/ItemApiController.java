package com.project.cm.controller.api;

import com.project.cm.controller.CrudController;
import com.project.cm.interfaces.CrudInterface;
import com.project.cm.model.entity.Item;
import com.project.cm.model.network.Header;
import com.project.cm.model.network.request.ItemApiRequest;
import com.project.cm.model.network.response.ItemApiResponse;
import com.project.cm.service.ItemApiLogicService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.annotation.PostConstruct;

@RestController
@RequestMapping("/api/item")
public class ItemApiController extends CrudController<ItemApiRequest, ItemApiResponse, Item> {

}
