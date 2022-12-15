/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.model.dao;

import com.model.Admins;
import com.model.Admin;
import com.model.Admins;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.Serializable;
import javax.xml.bind.JAXBContext;
import javax.xml.bind.JAXBException;
import javax.xml.bind.Marshaller;
import javax.xml.bind.Unmarshaller;

/**
 *
 * @author 236349
 */
public class AdminDAO implements Serializable{
    private Admins admins;
    private String fileName;
    
    public AdminDAO(){  }
    
    public void setFileName(String fileName) throws JAXBException, FileNotFoundException{
        this.fileName = fileName;
        JAXBContext jc = JAXBContext.newInstance(Admins.class);
        Unmarshaller um = jc.createUnmarshaller();
        FileInputStream fin = new FileInputStream(fileName);
        admins = (Admins) um.unmarshal(fin);
    }
    
    public Admins getAdmins(){
        return this.admins;
    }
    
    public void save(Admins admins, String filename) throws JAXBException, FileNotFoundException, IOException{
        this.admins = admins;
        this.fileName = filename;
        JAXBContext jc = JAXBContext.newInstance(Admins.class);
        Marshaller m = jc.createMarshaller();
        m.setProperty(Marshaller.JAXB_FORMATTED_OUTPUT, true);
        FileOutputStream fout = new FileOutputStream(filename);
        m.marshal(admins, fout);
        fout.close();
    }
    
    public Admins read(String filename) throws JAXBException, FileNotFoundException{
        this.fileName = filename;
        JAXBContext jc = JAXBContext.newInstance(Admins.class);
        Unmarshaller um = jc.createUnmarshaller();
        FileInputStream fin = new FileInputStream(filename);
        admins = (Admins) um.unmarshal(fin);
        return admins;
    }
    
    public void update(Admins admins, Admin other) throws JAXBException, IOException{
        this.admins = admins;
        this.admins.remove(other);
        save(this.admins, fileName);
        this.admins.add(other);
        save(this.admins, fileName);
    }
    
    public void delete(Admins admins,Admin admin) throws JAXBException, IOException{
        this.admins = admins;
        this.admins.remove(admin);
        save(this.admins, fileName);
    }
}

 
    
