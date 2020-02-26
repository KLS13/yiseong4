package com.project.cm.controller.api;

import com.project.cm.controller.CrudController;
import com.project.cm.interfaces.CrudInterface;
import com.project.cm.model.entity.User;
import com.project.cm.model.network.Header;
import com.project.cm.model.network.request.UserApiRequest;
import com.project.cm.model.network.response.UserApiResponse;
import com.project.cm.service.UserApiLogicService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.annotation.PostConstruct;
import java.util.Optional;

@Slf4j
@RestController
@RequestMapping("/api/user")
public class UserApiController extends CrudController<UserApiRequest, UserApiResponse,User> {

}
