// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.dsc.hikomaki.domain;

import com.dsc.hikomaki.domain.FuncionarioDataOnDemand;
import com.dsc.hikomaki.domain.Mesa;
import com.dsc.hikomaki.domain.MesaDataOnDemand;
import com.dsc.hikomaki.servico.MesaService;
import java.security.SecureRandom;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Random;
import javax.validation.ConstraintViolation;
import javax.validation.ConstraintViolationException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

privileged aspect MesaDataOnDemand_Roo_DataOnDemand {
    
    declare @type: MesaDataOnDemand: @Component;
    
    private Random MesaDataOnDemand.rnd = new SecureRandom();
    
    private List<Mesa> MesaDataOnDemand.data;
    
    @Autowired
    FuncionarioDataOnDemand MesaDataOnDemand.funcionarioDataOnDemand;
    
    @Autowired
    MesaService MesaDataOnDemand.mesaService;
    
    public Mesa MesaDataOnDemand.getNewTransientMesa(int index) {
        Mesa obj = new Mesa();
        setNomeMesa(obj, index);
        return obj;
    }
    
    public void MesaDataOnDemand.setNomeMesa(Mesa obj, int index) {
        String nomeMesa = "nomeMesa_" + index;
        obj.setNomeMesa(nomeMesa);
    }
    
    public Mesa MesaDataOnDemand.getSpecificMesa(int index) {
        init();
        if (index < 0) {
            index = 0;
        }
        if (index > (data.size() - 1)) {
            index = data.size() - 1;
        }
        Mesa obj = data.get(index);
        Long id = obj.getId();
        return mesaService.findMesa(id);
    }
    
    public Mesa MesaDataOnDemand.getRandomMesa() {
        init();
        Mesa obj = data.get(rnd.nextInt(data.size()));
        Long id = obj.getId();
        return mesaService.findMesa(id);
    }
    
    public boolean MesaDataOnDemand.modifyMesa(Mesa obj) {
        return false;
    }
    
    public void MesaDataOnDemand.init() {
        int from = 0;
        int to = 10;
        data = mesaService.findMesaEntries(from, to);
        if (data == null) {
            throw new IllegalStateException("Find entries implementation for 'Mesa' illegally returned null");
        }
        if (!data.isEmpty()) {
            return;
        }
        
        data = new ArrayList<Mesa>();
        for (int i = 0; i < 10; i++) {
            Mesa obj = getNewTransientMesa(i);
            try {
                mesaService.saveMesa(obj);
            } catch (ConstraintViolationException e) {
                StringBuilder msg = new StringBuilder();
                for (Iterator<ConstraintViolation<?>> iter = e.getConstraintViolations().iterator(); iter.hasNext();) {
                    ConstraintViolation<?> cv = iter.next();
                    msg.append("[").append(cv.getConstraintDescriptor()).append(":").append(cv.getMessage()).append("=").append(cv.getInvalidValue()).append("]");
                }
                throw new RuntimeException(msg.toString(), e);
            }
            obj.flush();
            data.add(obj);
        }
    }
    
}
