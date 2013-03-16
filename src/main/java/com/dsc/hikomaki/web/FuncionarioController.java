package com.dsc.hikomaki.web;

import com.dsc.hikomaki.domain.Funcionario;
import org.springframework.roo.addon.web.mvc.controller.json.RooWebJson;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/funcionarios")
@Controller
@RooWebScaffold(path = "funcionarios", formBackingObject = Funcionario.class)
@RooWebJson(jsonObject = Funcionario.class)
public class FuncionarioController {
}
