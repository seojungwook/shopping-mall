package controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpSession;
import javax.websocket.OnClose;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;

@ServerEndpoint("/chatcontroller")
public class ChatController {
	
	 private static Set<Session> clients = Collections 
	          .synchronizedSet(new HashSet<Session>());
	    
	    
	    Map<String,String> userMap= new HashMap<String,String>();
	    List<String> sessionId = new ArrayList<String>();
	    //private static List<Session> clientsName = Collections
	       //   .synchronizedList(new ArrayList<Session>()); 
	  
	 
	    @OnMessage 
	    public void onMessage(String message, Session session) throws IOException{
	       
	       System.out.println("message :" + message);
	       System.out.println("���� ���̵�:"+session.getId());
	 
	       
	       synchronized (clients) {
	       if(message.contains("����")){
	          //���� ��ü ����� ���̵� �����Ǵ� session id �����ͼ� ���Ͽ� ����ְ� �޼��� �׼������� �۽� �ϸ鳡
	          //clients.add(wsession);
	          for (Session client : clients) {
	             if (!client.equals(session)) { 
	                client.getBasicRemote().sendText(message);
	             }
	          }
	          
	       }else{
	         for (Session client : clients) {
	             if (!client.equals(session)) { 
	                client.getBasicRemote().sendText(message);
	             }
	        }
	       } 
	       } 
	    }
	   @OnOpen 
	    public void onOpen(Session session) throws IOException{
	       clients.add(session);
	       
	       //makeUser(session.getId(), hsession.getAttribute("myid"));
	       //clientsName.add(session);
	    } 
	 
	 
	    @OnClose 
	    public void onClose(Session session) throws IOException { 
	       clients.remove(session);
	       //session.close();
	       //clientsName.remove(session);
	       
	    } 
	    public void getsession(HttpSession hsession) {
	      
	   }
}
