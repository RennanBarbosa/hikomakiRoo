package com.dsc.hikomaki.web;

import com.dsc.hikomaki.domain.Prato;
import org.springframework.roo.addon.web.mvc.controller.json.RooWebJson;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/pratoes")
@Controller
@RooWebScaffold(path = "pratoes", formBackingObject = Prato.class)
@RooWebJson(jsonObject = Prato.class)
public class PratoController {
}
