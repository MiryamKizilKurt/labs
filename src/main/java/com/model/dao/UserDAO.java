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
public class UserDAO implements Serializable{
    private Users users;
    private String fileName;
    
    public UserDAO(){  }
    
    public void setFileName(String fileName) throws JAXBException, FileNotFoundException{
        this.fileName = fileName;
        JAXBContext jc = JAXBContext.newInstance(Users.class);
        Unmarshaller um = jc.createUnmarshaller();
        FileInputStream fin = new FileInputStream(fileName);
        users = (Users) um.unmarshal(fin);
    }
    
    public Users getUsers(){
        return this.users;
    }
    
    public void save(Users users, String filename) throws JAXBException, FileNotFoundException, IOException{
        this.users = users;
        this.fileName = filename;
        JAXBContext jc = JAXBContext.newInstance(Users.class);
        Marshaller m = jc.createMarshaller();
        m.setProperty(Marshaller.JAXB_FORMATTED_OUTPUT, true);
        FileOutputStream fout = new FileOutputStream(filename);
        m.marshal(users, fout);
        fout.close();
    }
    
    public Users read(String filename) throws JAXBException, FileNotFoundException{
        this.fileName = filename;
        JAXBContext jc = JAXBContext.newInstance(Users.class);
        Unmarshaller um = jc.createUnmarshaller();
        FileInputStream fin = new FileInputStream(filename);
        users = (Users) um.unmarshal(fin);
        return users;
    }
    
    public void update(Users users, User other) throws JAXBException, IOException{
        this.users = users;
        this.users.remove(other);
        save(this.users, fileName);
        this.users.add(other);
        save(this.users, fileName);
    }
    
    public void delete(Users users,User user) throws JAXBException, IOException{
        this.users = users;
        this.users.remove(user);
        save(this.users, fileName);
    }
}
