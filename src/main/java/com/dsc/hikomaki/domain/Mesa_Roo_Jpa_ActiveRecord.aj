// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.dsc.hikomaki.domain;

import com.dsc.hikomaki.domain.Mesa;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import org.springframework.transaction.annotation.Transactional;

privileged aspect Mesa_Roo_Jpa_ActiveRecord {
    
    @PersistenceContext
    transient EntityManager Mesa.entityManager;
    
    public static final EntityManager Mesa.entityManager() {
        EntityManager em = new Mesa().entityManager;
        if (em == null) throw new IllegalStateException("Entity manager has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");
        return em;
    }
    
    public static long Mesa.countMesas() {
        return entityManager().createQuery("SELECT COUNT(o) FROM Mesa o", Long.class).getSingleResult();
    }
    
    public static List<Mesa> Mesa.findAllMesas() {
        return entityManager().createQuery("SELECT o FROM Mesa o", Mesa.class).getResultList();
    }
    
    public static Mesa Mesa.findMesa(Long id) {
        if (id == null) return null;
        return entityManager().find(Mesa.class, id);
    }
    
    public static List<Mesa> Mesa.findMesaEntries(int firstResult, int maxResults) {
        return entityManager().createQuery("SELECT o FROM Mesa o", Mesa.class).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
    @Transactional
    public void Mesa.persist() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.persist(this);
    }
    
    @Transactional
    public void Mesa.remove() {
        if (this.entityManager == null) this.entityManager = entityManager();
        if (this.entityManager.contains(this)) {
            this.entityManager.remove(this);
        } else {
            Mesa attached = Mesa.findMesa(this.id);
            this.entityManager.remove(attached);
        }
    }
    
    @Transactional
    public void Mesa.flush() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.flush();
    }
    
    @Transactional
    public void Mesa.clear() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.clear();
    }
    
    @Transactional
    public Mesa Mesa.merge() {
        if (this.entityManager == null) this.entityManager = entityManager();
        Mesa merged = this.entityManager.merge(this);
        this.entityManager.flush();
        return merged;
    }
    
}
