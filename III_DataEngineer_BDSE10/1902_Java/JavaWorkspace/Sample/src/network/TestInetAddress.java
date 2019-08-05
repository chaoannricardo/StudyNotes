package network;

import java.net.InetAddress;
import java.net.NetworkInterface;
import java.net.SocketException;
import java.net.UnknownHostException;
import java.util.Enumeration;

public class TestInetAddress {
    public static void main(String[] args) throws UnknownHostException, SocketException {
        
        InetAddress localHost = InetAddress.getLocalHost();
        System.out.println(localHost.getHostAddress());
        System.out.println("localHost.getHostName() = " + localHost.getHostName());
        InetAddress google = InetAddress.getByName("www.google.com");
        System.out.println("google.getHostAddress() = " + google.getHostAddress());

        //getAllByName 取得所有的ip，一個名稱可能會綁多個ip
        InetAddress allIps[] = InetAddress.getAllByName("www.google.com");
        for (int i = 0; i < allIps.length; i++) {
            InetAddress allIp = allIps[i];
            System.out.println("ip = " + allIp.getHostAddress());
        }

        System.out.println("本機");
        //如果本機有多張網卡，必須先找到網卡才能取到ip
        Enumeration<NetworkInterface> interfaces = NetworkInterface.getNetworkInterfaces();
        while (interfaces.hasMoreElements()) {
            NetworkInterface networkInterface = interfaces.nextElement();
            Enumeration<InetAddress> addresses = networkInterface.getInetAddresses();
            System.out.println("網路介面="+networkInterface.getName());
            while (addresses.hasMoreElements()) {
                InetAddress inetAddress = addresses.nextElement();
                System.out.println("IP="+inetAddress.getHostAddress());
            }

        }

    }
}
