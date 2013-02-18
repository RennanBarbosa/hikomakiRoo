// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.dsc.hikomaki.domain;

import com.dsc.hikomaki.domain.MesaDataOnDemand;
import com.dsc.hikomaki.domain.Prato;
import com.dsc.hikomaki.domain.PratoDataOnDemand;
import java.security.SecureRandom;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Random;
import javax.validation.ConstraintViolation;
import javax.validation.ConstraintViolationException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

privileged aspect PratoDataOnDemand_Roo_DataOnDemand {
    
    declare @type: PratoDataOnDemand: @Component;
    
    private Random PratoDataOnDemand.rnd = new SecureRandom();
    
    private List<Prato> PratoDataOnDemand.data;
    
    @Autowired
    MesaDataOnDemand PratoDataOnDemand.mesaDataOnDemand;
    
    public Prato PratoDataOnDemand.getNewTransientPrato(int index) {
        Prato obj = new Prato();
        setIngredientes(obj, index);
        setNome(obj, index);
        setPreco(obj, index);
        return obj;
    }
    
    public void PratoDataOnDemand.setIngredientes(Prato obj, int index) {
        String ingredientes = "ingredientes_" + index;
        obj.setIngredientes(ingredientes);
    }
    
    public void PratoDataOnDemand.setNome(Prato obj, int index) {
        String nome = "nome_" + index;
        obj.setNome(nome);
    }
    
    public void PratoDataOnDemand.setPreco(Prato obj, int index) {
        Double preco = new Integer(index).doubleValue();
        obj.setPreco(preco);
    }
    
    public Prato PratoDataOnDemand.getSpecificPrato(int index) {
        init();
        if (index < 0) {
            index = 0;
        }
        if (index > (data.size() - 1)) {
            index = data.size() - 1;
        }
        Prato obj = data.get(index);
        Long id = obj.getId();
        return Prato.findPrato(id);
    }
    
    public Prato PratoDataOnDemand.getRandomPrato() {
        init();
        Prato obj = data.get(rnd.nextInt(data.size()));
        Long id = obj.getId();
        return Prato.findPrato(id);
    }
    
    public boolean PratoDataOnDemand.modifyPrato(Prato obj) {
        return false;
    }
    
    public void PratoDataOnDemand.init() {
        int from = 0;
        int to = 10;
        data = Prato.findPratoEntries(from, to);
        if (data == null) {
            throw new IllegalStateException("Find entries implementation for 'Prato' illegally returned null");
        }
        if (!data.isEmpty()) {
            return;
        }
        
        data = new ArrayList<Prato>();
        for (int i = 0; i < 10; i++) {
            Prato obj = getNewTransientPrato(i);
            try {
                obj.persist();
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