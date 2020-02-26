package com.project.cm.controller.api;

import com.project.cm.controller.CrudController;
import com.project.cm.model.entity.Partner;
import com.project.cm.model.network.request.PartnerApiRequest;
import com.project.cm.model.network.response.PartnerApiResponse;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api/partner")
public class PartnerApiController extends CrudController<PartnerApiRequest, PartnerApiResponse, Partner> {
}
