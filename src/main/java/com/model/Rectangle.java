
package com.model;

import java.io.Serializable;
import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author 236349
 */
@XmlRootElement
@XmlAccessorType(XmlAccessType.PROPERTY)
public class Rectangle implements Serializable{
    private double height;
    private double width;
    
    public Rectangle(){}
    
    public Rectangle(double height , double width){
        this.height = height;
        this.width = width;
    }
    
    @XmlElement
    public double getPerimeter(){
        return 2*(this.height + this.width);
    }
    
    @XmlElement
    public double getArea(){
        return this.height*this.width;
    }
    
}
