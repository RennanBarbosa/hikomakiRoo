package com.dsc.hikomaki.web;

import com.dsc.hikomaki.domain.Mesa;
import org.springframework.roo.addon.web.mvc.controller.json.RooWebJson;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/mesas")
@Controller
@RooWebScaffold(path = "mesas", formBackingObject = Mesa.class)
@RooWebJson(jsonObject = Mesa.class)
public class MesaController {
}
