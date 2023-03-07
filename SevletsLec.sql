#It is important to understand that all of our Java code will reside server-side (as opposed to client-side, which is where our JavaScript runs).
    #This means that a user visiting our website will not know that our server is running Java, just that it produces an HTML response, meaning that the end result of the code running on our server should be a valid HTML document.

#now we're going to be using java to run server programs on the back end and have a lot more control
#everything we've learned on the front end can be communicated back to the client through our own java server
    #this gives us a lot more control over things like reading and writing from a database
    #the client/browser does not get to talk directly to the database
#java will be responsible for handing back files and achieves protection between the database and the client

#first way we are going to be doing this is through an older technology caled servlets
#spring will end up kind of cancelling out a lot of this older stuff, but still good to learn where this comes from

#servlets - dont get excited bc theyre "stupid" lol
#theres just better modern solutions now
#java enterprise edition renamed to jakarta enterprise edition

#settign up new servlet project:
#template: web application
#server: tomcat
#language: java
#build sys: maven
#specs: servlets only

#tomcat is a java program on which our java classes will be running
    #there are other java server platforms that will run our programs  ex jboss


import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;

@WebServlet(name = "HelloWorldServlet", urlPatterns = "/hello-world") //listening for this address
           public class HelloWorldServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException { //only when its a get requests
        response.setContentType("text/html");
PrintWriter out = response.getWriter(); //have to tell it youre going to println, printf - we can also sout here but itll go to the console not display on the page
out.println("<h1>Hello, World!</h1>"); //will send out this html to the browser
}

}


    #real programs use dependencies
    #ours is tomcat, so we have to work the way it wants us to
    #anything on the servlet back end has to be set up a very specific way tho


    #jsp page will show us coloration like plain html

    #war file is the built product that goes to the tomcat server

    #use an annotation (@ sign and yellow in intellij) to tell java that this is a servlet
        #an alternative configuration is a web.xml file

    #if you want to do several pages then you have to do a servlet per page
    #its confining that you can only have one Get request, one post request, etc  per servlet

    #its a subclass of some parent class called HttpServlet

    #java for a back end is just big and slow
    #node and js are light and fast


    #name of servlet should reflect its job, same with the path
    #ex PersonServlet


    #Unlike our past Java projects, our application does not have a main method. Instead, Tomcat will be taking over control (initially) for us.




                                    Tomcat Starts
                                      |
                                      v
                              Servlet is Created
                                      |
                                      v
           +->> request >>>>   doGet is called    >>>> response >>-+
           |                                                       |
           ^                                                       v
           ^                                                       v
           |                                                       |
           +-<< request <<<<       Client         <<<< response <<-+




    #The process for a GET request looks like this:
        #1 The Tomcat web server starts up
        #2 A request for a specific URL comes to the web server (e.g. /hello-world)
        #3 If the servlet that is mapped to that URL (e.g. our HelloWorldServlet) does not exist, it is created
        #4 If the servlet has already been created, we'll use the existing one
        #5 The doGet method is called and the response is sent


    #The most important implication of this process is that the objects created from our servlet classes persist between requests. This means that we can create instance properties that can be used across multiple requests. In addition, we should be careful to clean up any resources we use on a single request (e.g. file handles).

    #how do you want your urls to work is part of the design of your project

    #how to access the value the user types into the form
    String name = request.getParameter("name");
    String age = request.getParameter("age");
    System.out.println(name + " " + age);


    if(person == null) {
        System.out.println("making bob!");
        person = new Person("bob!");
        }

        #instance variables will stick around until the server shuts down, so we still arent dealing with persistence yet


            #if we dont get age we redirect them to google
            if(age == null) {
            response.sendRedirect("https://google.com");
            return;
            }
















