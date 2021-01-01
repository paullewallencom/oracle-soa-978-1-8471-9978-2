<?xml version="1.0" encoding="UTF-8" ?>
<?oracle-xsl-mapper
  <!-- SPECIFICATION OF MAP SOURCES AND TARGETS, DO NOT MODIFY. -->
  <mapSources>
    <source type="WSDL">
      <schema location="../getStatusByCC.wsdl"/>
      <rootElement name="creditcardStatusRequest" namespace="http://www.globalcompany.com/ns/CCAuthorizationService"/>
    </source>
  </mapSources>
  <mapTargets>
    <target type="WSDL">
      <schema location="../getCreditValidation.wsdl"/>
      <rootElement name="getCreditValidationSelect_ccnbInputParameters" namespace="http://xmlns.oracle.com/pcbpel/adapter/db/top/getCreditValidation"/>
    </target>
  </mapTargets>
  <!-- GENERATED BY ORACLE XSL MAPPER 11.1.1.0.0(build 090618.1440.5219) AT [WED SEP 02 13:51:36 PDT 2009]. -->
?>
<xsl:stylesheet version="1.0"
                xmlns:xpath20="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.Xpath20"
                xmlns:bpws="http://schemas.xmlsoap.org/ws/2003/03/business-process/"
                xmlns:top="http://xmlns.oracle.com/pcbpel/adapter/db/top/getCreditValidation"
                xmlns:mhdr="http://www.oracle.com/XSL/Transform/java/oracle.tip.mediator.service.common.functions.MediatorExtnFunction"
                xmlns:oraext="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.ExtFunc"
                xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
                xmlns:dvm="http://www.oracle.com/XSL/Transform/java/oracle.tip.dvm.LookupValue"
                xmlns:hwf="http://xmlns.oracle.com/bpel/workflow/xpath"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:med="http://schemas.oracle.com/mediator/xpath"
                xmlns:tns="http://oracle.com/sca/soapservice/CreditCardValidation/validationForCC/getStatusByCC"
                xmlns:ids="http://xmlns.oracle.com/bpel/services/IdentityService/xpath"
                xmlns:xdk="http://schemas.oracle.com/bpel/extension/xpath/function/xdk"
                xmlns:inp1="http://www.globalcompany.com/ns/CCAuthorizationService"
                xmlns:xref="http://www.oracle.com/XSL/Transform/java/oracle.tip.xref.xpath.XRefXPathFunctions"
                xmlns:ns0="http://xmlns.oracle.com/pcbpel/adapter/db/CreditCardValidation/validationForCC/getCreditValidation%2F"
                xmlns:plt="http://schemas.xmlsoap.org/ws/2003/05/partner-link/"
                xmlns:xsd="http://www.w3.org/2001/XMLSchema"
                xmlns:wsdl="http://schemas.xmlsoap.org/wsdl/"
                xmlns:ora="http://schemas.oracle.com/xpath/extension"
                xmlns:socket="http://www.oracle.com/XSL/Transform/java/oracle.tip.adapter.socket.ProtocolTranslator"
                exclude-result-prefixes="xsi xsl tns inp1 xsd wsdl top ns0 plt xpath20 bpws mhdr oraext dvm hwf med ids xdk xref ora socket">
  <xsl:template match="/">
    <top:getCreditValidationSelect_ccnbInputParameters>
      <top:ccnb>
        <xsl:value-of select="/inp1:creditcardStatusRequest/inp1:CCNumber"/>
      </top:ccnb>
    </top:getCreditValidationSelect_ccnbInputParameters>
  </xsl:template>
</xsl:stylesheet>