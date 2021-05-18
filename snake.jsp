<html>
   <head>
      <title>Setting HTTP Status Code</title>
   </head>
   
   <body>
      <%
         // Set error code and reason.
         response.sendError(407, "Need authentication!!!" );
      %>
   </body>
</html>
