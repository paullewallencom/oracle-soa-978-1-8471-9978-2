/**
* $Id: Send.java 24 2006-06-24 00:12:01Z dlher $
*----------------------------------------------------------------------------------------
* Oracle Enterprise Messaging Services - sample JMS sender
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
 
// Java infrastructure packages
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.Hashtable;
import java.util.Properties;

// JMS packages
import javax.jms.*;
import javax.naming.*;
 
public class Send {

    /* -------------------------------------------------------
        * main
        * ------------------------------------------------------- */
    public static void main(String[] args) 
      throws Exception {

        Connection          conn                = null;
        ConnectionFactory   cf                  = null;
        Destination         dest                = null;
        Session             sess                = null;
        String              msgText             = null;
        String              myCF                = null;
        TextMessage         msg                 = null;
        MessageProducer     sender              = null;
        String              destName            = null;
        InputStream         propertiesFile      = null;
        InitialContext      jndiContext         = null;
        String              propertiesFilename  = "oems.properties";
        Properties          myProperties        = new Properties();

        System.out.println("\n-----------------------------------------------------------");
        System.out.println("Oracle Enterprise Messaging Services - sample JMS Send");
        System.out.println("-----------------------------------------------------------");
    
 		// get JNDI parameters from properties file oems.properties (exit if problem)
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

        // get destination to listen on (from command-line)
        try {
            destName = args[0];
        } catch (Exception e) {
            System.out.println("please provide a destination to send on [" + args.length + "]");
            usage();
        }

        // get message to send (from command-line)
        try {
            msgText = args[1];
        } catch (Exception e) {
            System.err.println("please specify some text to send [" + args.length + "]");
            usage();
        }

       //myProperties.list(System.out);
       
       // initialize JNDI context and lookup connection factory and destination
		try {
			// Initialize JNDI context
			jndiContext = new InitialContext(myProperties);
        } catch (NamingException e) {
			e.printStackTrace();
            usageJndi(myProperties);
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
            // create connection
            conn = cf.createConnection();
            // create session
            sess = conn.createSession(false, javax.jms.Session.AUTO_ACKNOWLEDGE);
            // create sender
            sender = sess.createProducer(dest);
            System.out.println("\ndestination: " + dest + "\nmessage    :\n\n" + msgText);
            // prepare message to send
            msg = sess.createTextMessage();
            msg.setText(msgText);
            // send message
            sender.send(msg);
            System.out.println("\n...message sent!\n");
		} catch (JMSException e) {
            System.err.println("JMS: failed building and sending message\n");
			e.printStackTrace();
			System.exit(-1);
        } finally {
            try {
                if (sender != null) {
                    sender.close();
                }
                if (sess != null) {
                    sess.close();
                }
                if (conn != null) {
                    conn.close();
                }
            } catch (JMSException e) {
                 System.err.println("Couldn't properly close all resources.\n");
            }
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
        System.err.println("\nUsage: Send <JNDI location of your destination> <message>");
        System.err.println("Ex   : Send \"jms/demoQueue\" \"hello world\"");
        System.exit(0);
    }
}
