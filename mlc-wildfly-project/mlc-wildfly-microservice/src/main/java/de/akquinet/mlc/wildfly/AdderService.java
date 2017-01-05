package de.akquinet.mlc.wildfly;

import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.QueryParam;

@Path("/adder")
public class AdderService {

    @GET
    public float add(@QueryParam("summand1") float summand1, @QueryParam("summand2") float summand2) {
        return summand1 + summand2;
    }
}
