package com.dsc.hikomaki.domain;

import javax.persistence.ManyToOne;
import javax.validation.constraints.NotNull;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.json.RooJson;
import org.springframework.roo.addon.tostring.RooToString;

@RooJavaBean
@RooToString
@RooJpaActiveRecord(finders = { "findPratoesByMesa" })
@RooJson
public class Prato {

    @NotNull
    private String nome;

    @NotNull
    private String ingredientes;

    @NotNull
    private Double preco;

    @ManyToOne
    private Mesa mesa;
}
