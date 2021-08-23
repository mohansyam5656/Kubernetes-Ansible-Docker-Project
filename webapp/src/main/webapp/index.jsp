<?xml version="1.0" encoding="UTF-8"?>
<jsp:root 
  xmlns:jsp="http://java.sun.com/JSP/Page" 
  xmlns:ui="http://araneaframework.org/tag-library/standard" version="1.2">
  <ui:widgetContext>
    <html>
      <head>
        <title>Aranea Template Application</title>
         
        <ui:importScripts/>      
        <ui:importStyles/>      
   
      </head>
    
        <ui:body>
          <ui:systemForm method="POST">
            <h1>Aranea Application</h1>
              
            <ui:messages/>

            <ui:widgetInclude id="root"/>
          </ui:systemForm>
          
      </ui:body>   
    </html>
  </ui:widgetContext>
</jsp:root>
  
