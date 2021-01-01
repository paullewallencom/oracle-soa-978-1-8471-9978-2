/**
* $Rev: 24 $ $Author: dlher $ $Date: 2006-06-23 17:12:01 -0700 (Fri, 23 Jun 2006) $
*----------------------------------------------------------------------------------------
* Oracle Enterprise Messaging Services - sample JMS asynchronous receiver
*----------------------------------------------------------------------------------------
* This sample code uses the JMS 1.1 API and therefore can be used with topics
* as well as queues.
*
 * REQUIREMENTS
 * 
 * Oracle OC4J 10.1.3 or above
 *
 * PROPERTIES FILE
 *
 * This program will look for a file called oems.properties in the current directory
 * This properties file should contain the following entries:
 *      java.naming.factory.initial	        =oracle.j2ee.rmi.RMIInitialContextFactory
 *      java.naming.provider.url            =ormi://localhost:23791
 *      java.naming.security.principal      =oc4jadmin
 *      java.naming.security.credentials 	=welcome1
 *     factory.name =jms/ConnectionFactory
 * 
 * CLASSPATH
 *
 * As of AS 10.1.3, the following jar files are required in your classpath to
 * run this example:
 * %J2EE_HOME%\lib\jms.jar;%J2EE_HOME%\lib\jndi.jar;%J2EE_HOME%\oc4jclient.jar;%J2EE_HOME%\lib\javax77.jar
 * 
 */
 
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;

import java.util.Hashtable;
import java.util.Properties;

import javax.jms.*;
import javax.naming.*;

public class Receive
  implements MessageListener {
    
	private	static TextMessage         msg                 = null;
	private	static ConnectionFactory   cf                  = null;
	private	static Connection          conn                = null;
	private	static Destination         dest                = null;
	private	static Session             sess                = null;
	private	static MessageConsumer     msgConsumer         = null;
	private static InputStream         propertiesFile      = null;
    private static InitialContext      jndiContext         = null;
	private static Properties          myProperties        = new Properties();
	private static String              propertiesFilename  = "oems.properties";
    private static String              myCF                = null;
        
  /*-----------------------------------------------------------------------
     * Receive
     * This is where the JMS work is done.
     *----------------------------------------------------------------------*/	
    public Receive(String destName)
	{
		// get server parameters from properties file oems.properties (exit if problem)
		try {
			propertiesFile = new FileInputStream(propertiesFilename);
			myProperties.load(propertiesFile);
			propertiesFile.close();
		} catch (IOException e) {
			System.out.println("I/O Exception while trying to open properties file: "
                               +propertiesFilename);
			e.printStackTrace();
			System.exit(-1);
		}
		
        // initialize JNDI context and lookup connection factory and destination
		try {
			// Initialize JNDI context
			jndiContext = new InitialContext(myProperties);
        } catch (NamingException e) {
            usageJndi(myProperties);
			e.printStackTrace();
		}       

        try {
			// lookup JMS connection factory in JNDI
			cf = (ConnectionFactory) jndiContext.lookup(myProperties.getProperty("factory.name"));
            // lookup JMS destination in JNDI
			dest = (Destination)jndiContext.lookup(destName);
        } catch (NamingException e) {
			System.err.println("Problem during the JNDI lookup\n");
			e.printStackTrace();
			System.exit(-1);
		}    
        
        // create JMS connection, session, consumer and register listener - then start session
        try {
		   // create connection to the provider
		   conn = cf.createConnection();
		   // create session (choosing AUTO_ACKNOWLEDGE mode for simplicity reasons)
		   sess = conn.createSession(false, javax.jms.Session.AUTO_ACKNOWLEDGE);
		   // create consumer
		   msgConsumer = sess.createConsumer(dest);
           // register a message listener (onMessage)
		   msgConsumer.setMessageListener(this);
		   // initiate connection - make sure to register your listener first or you might lose messages
           conn.start();
		   System.out.println("Listening on: "+dest);
		} catch (JMSException e) {
			System.err.println("Problem initializing JMS session");
			e.printStackTrace();
			System.exit(-1);
		} 

	   }
  /*-----------------------------------------------------------------------
     * onMessage
     * The callback function invoked upon message reception
     *----------------------------------------------------------------------*/		   
    public void onMessage(Message msg)
	{
	 try {
		String msgText;
		if (msg instanceof TextMessage) {
	 	  msgText = ((TextMessage)msg).getText();
		  System.out.println("\n** NEW MESSAGE (TEXT):\n"+ msgText);
	    } else {
		  // if message is not a TextMessage, attempt a conversion to string
		  System.out.println("\n** NEW MESSAGE ("
                    +msg.getClass().getName()
                    +"):\n"+msg.toString());
		}
	  } catch (JMSException e) {
	    e.printStackTrace();
	  } 
	}

  /*-----------------------------------------------------------------------
     * usageJndi
     * prints JNDI requirements
     *----------------------------------------------------------------------*/

    private static void usageJndi(Properties myProperties) {
        System.err.println("\nThe following properties must exist in oems.properties:\n");
        System.err.println("* java.naming.factory.initial");
        System.err.println("* java.naming.provider.url");
        System.err.println("* java.naming.security.principal");
        System.err.println("* java.naming.security.credentials");
        System.err.println("* factory.name");
        System.err.println("Here's what was passed to the context creation routine:");
        myProperties.list(System.out);
        System.exit(0);
    }
    
  /*-----------------------------------------------------------------------
     * usage
     * prints program usage
     *----------------------------------------------------------------------*/
     
    private static void usage() {
            System.err.println("\nUsage: listen <JNDI location of your destination>");
            System.err.println("Ex   : listen \"jms/demoQueue\"");
    }
	
  /*-----------------------------------------------------------------------
     * main
     *----------------------------------------------------------------------*/
    public static void main(String[] args)
    {
	
	InputStreamReader	commandBuffer = null;
	char                command       = '\0';
	String              destName      = null;
	
	System.out.println("\n-----------------------------------------------------------");
    System.out.println("Oracle Enterprise Messaging Services - sample JMS Receive");
	System.out.println("-----------------------------------------------------------");
	
	// get destination to listen on from command-line
	try {
		destName = args[0]; 
	} catch (Exception e) {
		System.out.println("please provide a destination to listen on");
		usage();
		System.exit(0);
	}
	
    try {	
    
        // start the JMS session	
    	new Receive(destName);
    	
    	System.out.println("(type q to exit at any time...)\n");
    	
    	// Now just loop, waiting for messages until user types 'q' to quit
    	commandBuffer = new InputStreamReader(System.in);
    	while (!(command == 'q')) {
    		try {
    			command = (char)commandBuffer.read();
    		} catch (IOException e) {
    			System.err.println("I/O Exception: ");
    			e.printStackTrace();
    			}
            }
            
    } catch (Exception e) {
            e.printStackTrace();
    } finally {
            try {
                System.out.println("...closing resources before exiting");
                if (msgConsumer != null) {
                    msgConsumer.close();
                }
                if (sess != null) {
                    sess.close();
                }
                if (conn != null) {
                    conn.close();
                }
            } catch (JMSException e) {
                 System.err.println("Couldn't properly close all resources.\n");
                 e.printStackTrace();
            }
        }
       
        }
}

