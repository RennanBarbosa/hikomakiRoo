// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.dsc.hikomaki.servico;

import com.dsc.hikomaki.domain.Mesa;
import com.dsc.hikomaki.servico.MesaService;
import java.util.List;

privileged aspect MesaService_Roo_Service {
    
    public abstract long MesaService.countAllMesas();    
    public abstract void MesaService.deleteMesa(Mesa mesa);    
    public abstract Mesa MesaService.findMesa(Long id);    
    public abstract List<Mesa> MesaService.findAllMesas();    
    public abstract List<Mesa> MesaService.findMesaEntries(int firstResult, int maxResults);    
    public abstract void MesaService.saveMesa(Mesa mesa);    
    public abstract Mesa MesaService.updateMesa(Mesa mesa);    
}
