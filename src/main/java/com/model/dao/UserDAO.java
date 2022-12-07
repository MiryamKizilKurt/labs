/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.model.dao;

import com.model.User;
import com.model.Users;
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
public class UserDAO implements Serializable {
    private Users users;
    private String filePath;
    //private ArrayList<U> ?????

    public UserDAO(){  }
    
    public UserDAO(String filepath){
        this.filePath = filepath;}

    public void setFileName(String filepath) throws JAXBException, FileNotFoundException{
        this.filePath = filepath;
        JAXBContext jc = JAXBContext.newInstance(Users.class);
        Unmarshaller um = jc.createUnmarshaller();
        FileInputStream fin = new FileInputStream(filepath);
        users = (Users) um.unmarshal(fin);
    }
    
    public Users getUsers(){
        return this.users;
    }

    public String getFilePath() {
        return filePath;
    }

    public void setUsers(Users users) {
        this.users = users;
    }

    public void setFilePath(String filePath) {
        this.filePath = filePath;
    }
    

    // Marshaling users to XML = Create
    public void save(Users users, String filepath) throws JAXBException, FileNotFoundException, IOException{
        this.users = users;
        this.filePath = filepath;
        JAXBContext jc = JAXBContext.newInstance(Users.class);
        Marshaller m = jc.createMarshaller();
        m.setProperty(Marshaller.JAXB_FORMATTED_OUTPUT, true);
        FileOutputStream fout = new FileOutputStream(filepath);
        m.marshal(users, fout);
        fout.close();
    }
    
    // Unmarshaling XML to users
    public Users read(String filepath) throws JAXBException, FileNotFoundException{
        this.filePath = filepath;
        JAXBContext jc = JAXBContext.newInstance(Users.class);
        Unmarshaller um = jc.createUnmarshaller();
        FileInputStream fin = new FileInputStream(filepath);
        users = (Users) um.unmarshal(fin);
        return users;
    }
    
    
    public void update(Users users, User other) throws JAXBException, IOException{
        this.users = users;
        this.users.remove(other);
        save(this.users, filePath);
        this.users.add(other);
        save(this.users, filePath);
    }
    
    public void delete(Users users,User user) throws JAXBException, IOException{
        this.users = users;
        this.users.remove(user);
        save(this.users, filePath);
    }    
}
