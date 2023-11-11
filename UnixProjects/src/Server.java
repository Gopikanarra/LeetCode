import java.io.*;
import java.net.*;
public class Server
{
public static void main(String[] args) throws Exception
{
	byte [] b=new byte[1024]; 
	DatagramSocket ds=new DatagramSocket(1000);
	FileOutputStream fos=new FileOutputStream("C:\\Users\\Lakshmi\\Documents\\test.txt");
	DatagramPacket dp=new DatagramPacket(b,b.length);
	ds.receive(dp);
	String str=new String(dp.getData());
	byte [] strtoBytes=str.getBytes();x
	fos.write(strtoBytes);
	System.out.println("File Transfered Successfully..!");
	fos.close();
	}
}
