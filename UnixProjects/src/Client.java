import java.io.*;
import java.net.*;
public class Client
{

public static void main(String[] args) throws Exception
{
byte b []=new byte[1024];
System.out.println("connecting to udp server..!!!");
FileInputStream fin=new FileInputStream("C:\\Users\\Lakshmi\\Documents\\textTcp.txt");
DatagramSocket dsoc=new DatagramSocket();
int i=0;
while(fin.available()!=0) {
	b[i]=(byte)fin.read();
	i++;
}
fin.close();
dsoc.send(new DatagramPacket(b,i,InetAddress.getLocalHost(),1000));
}
}
