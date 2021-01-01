create or replace FUNCTION VALIDATECC(cc_number IN VARCHAR2) 
RETURN VARCHAR2 AS
    l_status  CREDITCARDINFO.STATUS%TYPE;
BEGIN
     select status
     into  l_status
     from   creditcardinfo
     where  ccnumber = cc_number;
     RETURN l_status;
EXCEPTION
      WHEN NO_DATA_FOUND THEN
          raise_application_error(-20001, 'UNKNOWN CREDIT CARD');
END VALIDATECC;
/
