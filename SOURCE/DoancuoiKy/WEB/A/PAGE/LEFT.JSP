
<%-- 
    Document   : leftPage
    Created on : Nov 10, 2011, 9:23:42 AM
    Author     : FreeX
--%>
<%@ page import= "org.jdom.*, java.util.*, 
org.jdom.input.SAXBuilder" %>
<%
  String clintHost = request.getServerName();
  int clintPort = request.getServerPort();
  String clintPath = request.getContextPath();
  String xmlPath = "http://"+clintHost + ":"+String.valueOf(clintPort) +clintPath+"/a/page/import/module.xml";
  SAXBuilder saxBuilder = new SAXBuilder();
  //Document doc = saxBuilder.build(xmlPath.toString());
  Document doc = saxBuilder.build(xmlPath);
  ArrayList<String> T = new ArrayList<String>();
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<div class="column_left">
    
    
    
    <%
    List list = doc.getRootElement().getChildren();
    Iterator iter = list.iterator();
    String v = null;
    String pNext=null;
    String nameModule=null;
    int f=0;
    while (iter.hasNext()){
        Element element = (Element) iter.next();
        v = element.getAttributeValue("id");
        if(!v.equals(pNext)){
            pNext = element.getAttributeValue("id");
                if(f == 1){
                    %></div><%
                }
        ////
        ////
        }
        else{
            v = null;
        }
        //else {
        //  v = element.getAttributeValue("id");
        // }
        List NameDOBCity  = element.getChildren();
        Iterator listIter = NameDOBCity.iterator();
        Iterator listItertemp = NameDOBCity.iterator();
    if(v != null){
        f =1;
        while ( listItertemp.hasNext() ){
        Element childNode = (Element) listItertemp.next();
            nameModule = childNode.getText();
            break;
        }
        
    %>
    <div class="box">
    <h3><%=nameModule%></h3>
    <%
    }
    int foo=0;
    String child=null;
    while ( listIter.hasNext() ){
    Element childNode = (Element) listIter.next();
    if(foo == 1) {
        child = childNode.getText();
    }
    if(foo == 2){
    %>
    <div><a href=<%="'"+pNext+"_"+child+".do' />"%><%= childNode.getText() %></a></div>
    <%
    }
    foo++;
    }
    }
    %>
    
    
    </div>
    
</div>     

