// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.dsc.hikomaki.servico;

import com.dsc.hikomaki.domain.Prato;
import com.dsc.hikomaki.servico.PratoService;
import java.util.List;

privileged aspect PratoService_Roo_Service {
    
    public abstract long PratoService.countAllPratoes();    
    public abstract void PratoService.deletePrato(Prato prato);    
    public abstract Prato PratoService.findPrato(Long id);    
    public abstract List<Prato> PratoService.findAllPratoes();    
    public abstract List<Prato> PratoService.findPratoEntries(int firstResult, int maxResults);    
    public abstract void PratoService.savePrato(Prato prato);    
    public abstract Prato PratoService.updatePrato(Prato prato);    
}