package de.akquinet.mlc.wildflyswarm;

import org.wildfly.swarm.Swarm;

public class StartServer {
    public static void main(String[] args) throws Exception {
        new Swarm()
                .start()
                .deploy();
    }
}
