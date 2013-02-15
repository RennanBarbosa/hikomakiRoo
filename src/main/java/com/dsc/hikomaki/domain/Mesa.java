package com.dsc.hikomaki.domain;

import java.util.HashSet;
import java.util.Set;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.validation.constraints.NotNull;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.tostring.RooToString;

@RooJavaBean
@RooToString
@RooJpaActiveRecord
public class Mesa {

    @NotNull
    @Column(unique = true)
    private String nomeMesa;

    @ManyToOne
    private Funcionario funcionario;

    @ManyToMany(cascade = CascadeType.ALL)
    private Set<Prato> prato = new HashSet<Prato>();
}
