package network;

import java.net.InetAddress;
import java.net.UnknownHostException;

public class TestNetwork {

	public static void main(String[] args) throws UnknownHostException {
		
		InetAddress localHost = InetAddress.getLocalHost();
        System.out.println(localHost.getHostAddress());
        System.out.println("localHost.getHostName() = " + localHost.getHostName());
        
        InetAddress google = InetAddress.getByName("www.google.com");
        System.out.println("google.getHostAddress() = " + google.getHostAddress());
        
        InetAddress allIps[] = InetAddress.getAllByName("www.google.com");
        for (int i = 0; i < allIps.length; i++) {
            InetAddress allIp = allIps[i];
            System.out.println("ip = " + allIp.getHostAddress());
        }
    

	}

}
