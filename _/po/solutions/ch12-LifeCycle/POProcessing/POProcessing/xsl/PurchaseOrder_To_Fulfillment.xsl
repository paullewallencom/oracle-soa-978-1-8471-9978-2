<?xml version="1.0" encoding="UTF-8" ?>
<?oracle-xsl-mapper
  <!-- SPECIFICATION OF MAP SOURCES AND TARGETS, DO NOT MODIFY. -->
  <mapSources>
    <source type="WSDL">
      <schema location="../receivePO.wsdl"/>
      <rootElement name="PurchaseOrder" namespace="http://xmlns.oracle.com/ns/order"/>
    </source>
  </mapSources>
  <mapTargets>
    <target type="WSDL">
      <schema location="../FulfillmentProcess.wsdl"/>
      <rootElement name="Fulfillment" namespace="http://xmlns.oracle.com/ns/fulfillment"/>
    </target>
  </mapTargets>
  <!-- GENERATED BY ORACLE XSL MAPPER 11.1.1.0.0(build 090618.1440.5219) AT [FRI SEP 11 10:24:32 PDT 2009]. -->
?>
<xsl:stylesheet version="1.0" xmlns:ns1="http://xmlns.oracle.com/ns/fulfillment"
                xmlns:tns="http://oracle.com/sca/soapservice/POProcessing/POProcessing/receivePO"
                xmlns:xpath20="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.Xpath20"
                xmlns:bpws="http://schemas.xmlsoap.org/ws/2003/03/business-process/"
                xmlns:mhdr="http://www.oracle.com/XSL/Transform/java/oracle.tip.mediator.service.common.functions.MediatorExtnFunction"
                xmlns:oraext="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.ExtFunc"
                xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
                xmlns:dvm="http://www.oracle.com/XSL/Transform/java/oracle.tip.dvm.LookupValue"
                xmlns:hwf="http://xmlns.oracle.com/bpel/workflow/xpath"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:med="http://schemas.oracle.com/mediator/xpath"
                xmlns:ids="http://xmlns.oracle.com/bpel/services/IdentityService/xpath"
                xmlns:inp1="http://xmlns.oracle.com/ns/order"
                xmlns:xdk="http://schemas.oracle.com/bpel/extension/xpath/function/xdk"
                xmlns:xref="http://www.oracle.com/XSL/Transform/java/oracle.tip.xref.xpath.XRefXPathFunctions"
                xmlns:plnk="http://schemas.xmlsoap.org/ws/2003/05/partner-link/"
                xmlns:xsd="http://www.w3.org/2001/XMLSchema"
                xmlns:client="http://xmlns.oracle.com/POProcessing/POProcessing/FulfillmentProcess"
                xmlns:wsdl="http://schemas.xmlsoap.org/wsdl/"
                xmlns:ora="http://schemas.oracle.com/xpath/extension"
                xmlns:socket="http://www.oracle.com/XSL/Transform/java/oracle.tip.adapter.socket.ProtocolTranslator"
                exclude-result-prefixes="xsi xsl tns inp1 xsd wsdl ns1 plnk client xpath20 bpws mhdr oraext dvm hwf med ids xdk xref ora socket">
  <xsl:template match="/">
    <ns1:Fulfillment>
      <ns1:customerId>
        <xsl:value-of select="/inp1:PurchaseOrder/inp1:CustID"/>
      </ns1:customerId>
      <ns1:orderId>
        <xsl:value-of select="/inp1:PurchaseOrder/inp1:ID"/>
      </ns1:orderId>
      <ns1:total>
        <xsl:value-of select="/inp1:PurchaseOrder/inp1:price * /inp1:PurchaseOrder/inp1:quantity"/>
      </ns1:total>
    </ns1:Fulfillment>
  </xsl:template>
</xsl:stylesheet>