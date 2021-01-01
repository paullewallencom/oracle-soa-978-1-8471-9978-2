<?xml version="1.0" encoding="UTF-8" ?>
<?oracle-xsl-mapper
  <!-- SPECIFICATION OF MAP SOURCES AND TARGETS, DO NOT MODIFY. -->
  <mapSources>
    <source type="WSDL">
      <schema location="../receivePO_B2B.wsdl"/>
      <rootElement name="PurchaseOrder" namespace="http://xmlns.oracle.com/ns/order"/>
    </source>
  </mapSources>
  <mapTargets>
    <target type="WSDL">
      <schema location="http://localhost:8001/soa-infra/services/default/POProcessing/receivePO.wsdl"/>
      <rootElement name="PurchaseOrder" namespace="http://xmlns.oracle.com/ns/order"/>
    </target>
  </mapTargets>
  <!-- GENERATED BY ORACLE XSL MAPPER 11.1.1.0.0(build 090618.1440.5219) AT [TUE SEP 15 14:43:05 PDT 2009]. -->
?>
<xsl:stylesheet version="1.0"
                xmlns:ns0="http://oracle.com/sca/soapservice/POProcessing/POProcessing/receivePO"
                xmlns:xpath20="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.Xpath20"
                xmlns:bpws="http://schemas.xmlsoap.org/ws/2003/03/business-process/"
                xmlns:b2bconfig="http://xmlns.oracle.com/pcbpel/wsdl/b2b/config/"
                xmlns:tns="http://www.oracle.com/integration/b2b/receivePO_B2B/"
                xmlns:mhdr="http://www.oracle.com/XSL/Transform/java/oracle.tip.mediator.service.common.functions.MediatorExtnFunction"
                xmlns:oraext="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.ExtFunc"
                xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
                xmlns:dvm="http://www.oracle.com/XSL/Transform/java/oracle.tip.dvm.LookupValue"
                xmlns:hwf="http://xmlns.oracle.com/bpel/workflow/xpath"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:med="http://schemas.oracle.com/mediator/xpath"
                xmlns:ids="http://xmlns.oracle.com/bpel/services/IdentityService/xpath"
                xmlns:ns1="http://xmlns.oracle.com/ns/order"
                xmlns:xdk="http://schemas.oracle.com/bpel/extension/xpath/function/xdk"
                xmlns:xref="http://www.oracle.com/XSL/Transform/java/oracle.tip.xref.xpath.XRefXPathFunctions"
                xmlns:plt="http://schemas.xmlsoap.org/ws/2003/05/partner-link/"
                xmlns:xsd="http://www.w3.org/2001/XMLSchema"
                xmlns:wsdl="http://schemas.xmlsoap.org/wsdl/"
                xmlns:ora="http://schemas.oracle.com/xpath/extension"
                xmlns:socket="http://www.oracle.com/XSL/Transform/java/oracle.tip.adapter.socket.ProtocolTranslator"
                exclude-result-prefixes="xsi xsl b2bconfig tns ns1 plt xsd ns0 wsdl xpath20 bpws mhdr oraext dvm hwf med ids xdk xref ora socket">
  <xsl:template match="/">
    <ns1:PurchaseOrder>
      <ns1:CustID>
        <xsl:value-of select="/ns1:PurchaseOrder/ns1:CustID"/>
      </ns1:CustID>
      <ns1:ID>
        <xsl:value-of select="/ns1:PurchaseOrder/ns1:ID"/>
      </ns1:ID>
      <ns1:productName>
        <xsl:value-of select="/ns1:PurchaseOrder/ns1:productName"/>
      </ns1:productName>
      <ns1:itemType>
        <xsl:value-of select="/ns1:PurchaseOrder/ns1:itemType"/>
      </ns1:itemType>
      <ns1:price>
        <xsl:value-of select="/ns1:PurchaseOrder/ns1:price"/>
      </ns1:price>
      <ns1:quantity>
        <xsl:value-of select="/ns1:PurchaseOrder/ns1:quantity"/>
      </ns1:quantity>
      <ns1:status>
        <xsl:value-of select="/ns1:PurchaseOrder/ns1:status"/>
      </ns1:status>
      <ns1:ccType>
        <xsl:value-of select="/ns1:PurchaseOrder/ns1:ccType"/>
      </ns1:ccType>
      <ns1:ccNumber>
        <xsl:value-of select="/ns1:PurchaseOrder/ns1:ccNumber"/>
      </ns1:ccNumber>
    </ns1:PurchaseOrder>
  </xsl:template>
</xsl:stylesheet>