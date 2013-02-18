// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.dsc.hikomaki.web;

import com.dsc.hikomaki.domain.Funcionario;
import com.dsc.hikomaki.domain.Mesa;
import com.dsc.hikomaki.domain.Prato;
import com.dsc.hikomaki.web.ApplicationConversionServiceFactoryBean;
import org.springframework.beans.factory.annotation.Configurable;
import org.springframework.core.convert.converter.Converter;
import org.springframework.format.FormatterRegistry;

privileged aspect ApplicationConversionServiceFactoryBean_Roo_ConversionService {
    
    declare @type: ApplicationConversionServiceFactoryBean: @Configurable;
    
    public Converter<Funcionario, String> ApplicationConversionServiceFactoryBean.getFuncionarioToStringConverter() {
        return new org.springframework.core.convert.converter.Converter<com.dsc.hikomaki.domain.Funcionario, java.lang.String>() {
            public String convert(Funcionario funcionario) {
                return new StringBuilder().append(funcionario.getNome()).append(' ').append(funcionario.getTurno()).append(' ').append(funcionario.getTelefone()).append(' ').append(funcionario.getDataNasc()).toString();
            }
        };
    }
    
    public Converter<Long, Funcionario> ApplicationConversionServiceFactoryBean.getIdToFuncionarioConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.Long, com.dsc.hikomaki.domain.Funcionario>() {
            public com.dsc.hikomaki.domain.Funcionario convert(java.lang.Long id) {
                return Funcionario.findFuncionario(id);
            }
        };
    }
    
    public Converter<String, Funcionario> ApplicationConversionServiceFactoryBean.getStringToFuncionarioConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.String, com.dsc.hikomaki.domain.Funcionario>() {
            public com.dsc.hikomaki.domain.Funcionario convert(String id) {
                return getObject().convert(getObject().convert(id, Long.class), Funcionario.class);
            }
        };
    }
    
    public Converter<Mesa, String> ApplicationConversionServiceFactoryBean.getMesaToStringConverter() {
        return new org.springframework.core.convert.converter.Converter<com.dsc.hikomaki.domain.Mesa, java.lang.String>() {
            public String convert(Mesa mesa) {
                return new StringBuilder().append(mesa.getNomeMesa()).toString();
            }
        };
    }
    
    public Converter<Long, Mesa> ApplicationConversionServiceFactoryBean.getIdToMesaConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.Long, com.dsc.hikomaki.domain.Mesa>() {
            public com.dsc.hikomaki.domain.Mesa convert(java.lang.Long id) {
                return Mesa.findMesa(id);
            }
        };
    }
    
    public Converter<String, Mesa> ApplicationConversionServiceFactoryBean.getStringToMesaConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.String, com.dsc.hikomaki.domain.Mesa>() {
            public com.dsc.hikomaki.domain.Mesa convert(String id) {
                return getObject().convert(getObject().convert(id, Long.class), Mesa.class);
            }
        };
    }
    
    public Converter<Prato, String> ApplicationConversionServiceFactoryBean.getPratoToStringConverter() {
        return new org.springframework.core.convert.converter.Converter<com.dsc.hikomaki.domain.Prato, java.lang.String>() {
            public String convert(Prato prato) {
                return new StringBuilder().append(prato.getNome()).append(' ').append(prato.getIngredientes()).append(' ').append(prato.getPreco()).toString();
            }
        };
    }
    
    public Converter<Long, Prato> ApplicationConversionServiceFactoryBean.getIdToPratoConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.Long, com.dsc.hikomaki.domain.Prato>() {
            public com.dsc.hikomaki.domain.Prato convert(java.lang.Long id) {
                return Prato.findPrato(id);
            }
        };
    }
    
    public Converter<String, Prato> ApplicationConversionServiceFactoryBean.getStringToPratoConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.String, com.dsc.hikomaki.domain.Prato>() {
            public com.dsc.hikomaki.domain.Prato convert(String id) {
                return getObject().convert(getObject().convert(id, Long.class), Prato.class);
            }
        };
    }
    
    public void ApplicationConversionServiceFactoryBean.installLabelConverters(FormatterRegistry registry) {
        registry.addConverter(getFuncionarioToStringConverter());
        registry.addConverter(getIdToFuncionarioConverter());
        registry.addConverter(getStringToFuncionarioConverter());
        registry.addConverter(getMesaToStringConverter());
        registry.addConverter(getIdToMesaConverter());
        registry.addConverter(getStringToMesaConverter());
        registry.addConverter(getPratoToStringConverter());
        registry.addConverter(getIdToPratoConverter());
        registry.addConverter(getStringToPratoConverter());
    }
    
    public void ApplicationConversionServiceFactoryBean.afterPropertiesSet() {
        super.afterPropertiesSet();
        installLabelConverters(getObject());
    }
    
}