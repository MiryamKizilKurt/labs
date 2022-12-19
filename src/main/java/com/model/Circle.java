
package com.model;

import java.io.Serializable;
import static java.lang.Math.pow;
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
public class Circle implements Serializable{
    
    private double radius;
    
    public Circle(){}   
    public Circle(double radius){
        this.radius = radius;
    }
    
    @XmlElement
    public double getRadius(){
        return this.radius;
    }
    
    @XmlElement
    public double getPerimeter(){
        return 2*Math.PI*this.radius;
    }
    
    @XmlElement
    public double getArea(){
        return pow(this.radius , 2)*Math.PI;
    }
    
    
}
