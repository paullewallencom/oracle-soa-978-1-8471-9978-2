package soatraining.faulthandling;

import com.collaxa.cube.engine.fp.BPELFaultRecoveryContextImpl;

import java.io.File;
import java.io.PrintStream;

import java.util.ArrayList;
import java.util.Map;

import java.util.Set;

import oracle.integration.platform.faultpolicy.IFaultRecoveryContext;
import oracle.integration.platform.faultpolicy.IFaultRecoveryJavaClass;
import com.oracle.bpel.client.config.faultpolicy.IBPELFaultRecoveryContext;


public class MyFaultHandler implements IFaultRecoveryJavaClass {
    public MyFaultHandler() {
        super();
    }

    public void handleRetrySuccess(IFaultRecoveryContext ifc) {
        print("RertySuccess");
    }

    public String handleFault(IFaultRecoveryContext ifc) {
        print("Handle Fault");
        
        print("Properties");
        print("=================================================================");
        Map<String,ArrayList> props = ifc.getProperties();
        for (Map.Entry<String,ArrayList> entry: props.entrySet()){
            print (entry.getKey() + " = " + entry.getValue().get(0));
        }
        
        String logFileName = (String) props.get("logFileName").get(0);
        String logFileDir = (String) props.get("logFileDir").get(0);
        PrintStream ps = null;
        try
        {
            ps = new PrintStream(logFileDir + File.separator + logFileName);
        }
        catch (Exception e) {
            print(e.getMessage());
        }
                  
        
        log (ps, "Fault Details");
        log (ps, "===============================================================");
        log (ps, "Fault Type ................ " + ifc.getType());
        log (ps, "Poilcy ID ................. " + ifc.getPolicyId());
        log (ps, "Faulted Partner Link ...... " + ifc.getReferenceName());
        log (ps, "Port Type ................. " + ifc.getPortType());
        if (ifc.getType() == "bpel") {
            BPELFaultRecoveryContextImpl bpelCtx = (BPELFaultRecoveryContextImpl)ifc;
            log (ps, "--- BPEL Details ---");
            log (ps, "Process Title ............. " + bpelCtx.getTitle());
            log (ps, "Activity Name ............. " + bpelCtx.getActivityName());
            log (ps, "Activity Type ............. " + bpelCtx.getActivityType());
            log (ps, "Instance ID ................ " + bpelCtx.getInstanceId());
        }
        return "OK";
    }
    
    private void log(PrintStream ps, String s) {
        try {
            ps.println(s);
        }
        catch (Exception e) {
            print (e.getMessage());
        }
    }
    private void print(String s) {
        System.out.println("MyFaultHanlder: " + s);
    }
}
