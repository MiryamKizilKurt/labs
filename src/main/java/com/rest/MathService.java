package com.rest;

import com.model.Circle;
import com.model.Rectangle;
import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;

/**
 *
 * @author George
 */
@Path("mathapi")
public class MathService {
    public MathService(){}
    
    @GET
    @Path("hello")
    @Produces(MediaType.TEXT_PLAIN)
    public String hello(){
        return "Welcome to Math Service";
    }
    
    @GET
    @Path("/radius/r/{Radius}")
    @Produces(MediaType.APPLICATION_XML)
    public Circle values(@PathParam("Radius") double Radius){
        return new Circle(Radius);
    }
    
}
