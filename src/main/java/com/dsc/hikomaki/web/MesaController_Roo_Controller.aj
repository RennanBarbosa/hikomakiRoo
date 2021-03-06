// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.dsc.hikomaki.web;

import com.dsc.hikomaki.domain.Mesa;
import com.dsc.hikomaki.servico.FuncionarioService;
import com.dsc.hikomaki.servico.MesaService;
import com.dsc.hikomaki.servico.PratoService;
import com.dsc.hikomaki.web.MesaController;
import java.io.UnsupportedEncodingException;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.util.UriUtils;
import org.springframework.web.util.WebUtils;

privileged aspect MesaController_Roo_Controller {
    
    @Autowired
    MesaService MesaController.mesaService;
    
    @Autowired
    FuncionarioService MesaController.funcionarioService;
    
    @Autowired
    PratoService MesaController.pratoService;
    
    @RequestMapping(method = RequestMethod.POST, produces = "text/html")
    public String MesaController.create(@Valid Mesa mesa, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, mesa);
            return "mesas/create";
        }
        uiModel.asMap().clear();
        mesaService.saveMesa(mesa);
        return "redirect:/mesas/" + encodeUrlPathSegment(mesa.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(params = "form", produces = "text/html")
    public String MesaController.createForm(Model uiModel) {
        populateEditForm(uiModel, new Mesa());
        return "mesas/create";
    }
    
    @RequestMapping(value = "/{id}", produces = "text/html")
    public String MesaController.show(@PathVariable("id") Long id, Model uiModel) {
        uiModel.addAttribute("mesa", mesaService.findMesa(id));
        uiModel.addAttribute("itemId", id);
        return "mesas/show";
    }
    
    @RequestMapping(produces = "text/html")
    public String MesaController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            final int firstResult = page == null ? 0 : (page.intValue() - 1) * sizeNo;
            uiModel.addAttribute("mesas", mesaService.findMesaEntries(firstResult, sizeNo));
            float nrOfPages = (float) mesaService.countAllMesas() / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("mesas", mesaService.findAllMesas());
        }
        return "mesas/list";
    }
    
    @RequestMapping(method = RequestMethod.PUT, produces = "text/html")
    public String MesaController.update(@Valid Mesa mesa, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, mesa);
            return "mesas/update";
        }
        uiModel.asMap().clear();
        mesaService.updateMesa(mesa);
        return "redirect:/mesas/" + encodeUrlPathSegment(mesa.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(value = "/{id}", params = "form", produces = "text/html")
    public String MesaController.updateForm(@PathVariable("id") Long id, Model uiModel) {
        populateEditForm(uiModel, mesaService.findMesa(id));
        return "mesas/update";
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE, produces = "text/html")
    public String MesaController.delete(@PathVariable("id") Long id, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        Mesa mesa = mesaService.findMesa(id);
        mesaService.deleteMesa(mesa);
        uiModel.asMap().clear();
        uiModel.addAttribute("page", (page == null) ? "1" : page.toString());
        uiModel.addAttribute("size", (size == null) ? "10" : size.toString());
        return "redirect:/mesas";
    }
    
    void MesaController.populateEditForm(Model uiModel, Mesa mesa) {
        uiModel.addAttribute("mesa", mesa);
        uiModel.addAttribute("funcionarios", funcionarioService.findAllFuncionarios());
        uiModel.addAttribute("pratoes", pratoService.findAllPratoes());
    }
    
    String MesaController.encodeUrlPathSegment(String pathSegment, HttpServletRequest httpServletRequest) {
        String enc = httpServletRequest.getCharacterEncoding();
        if (enc == null) {
            enc = WebUtils.DEFAULT_CHARACTER_ENCODING;
        }
        try {
            pathSegment = UriUtils.encodePathSegment(pathSegment, enc);
        } catch (UnsupportedEncodingException uee) {}
        return pathSegment;
    }
    
}
