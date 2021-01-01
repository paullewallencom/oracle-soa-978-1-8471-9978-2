package customersdo.common;

import org.eclipse.persistence.sdo.SDODataObject;

public class CustomersViewSDOImpl extends SDODataObject implements CustomersViewSDO {

   public static final int START_PROPERTY_INDEX = 0;

   public static final int END_PROPERTY_INDEX = START_PROPERTY_INDEX + 3;

   public CustomersViewSDOImpl() {}

   public java.lang.String getCustomerId() {
      return getString(START_PROPERTY_INDEX + 0);
   }

   public void setCustomerId(java.lang.String value) {
      set(START_PROPERTY_INDEX + 0 , value);
   }

   public java.lang.String getCustomerName() {
      return getString(START_PROPERTY_INDEX + 1);
   }

   public void setCustomerName(java.lang.String value) {
      set(START_PROPERTY_INDEX + 1 , value);
   }

   public java.lang.String getLastOrderNumber() {
      return getString(START_PROPERTY_INDEX + 2);
   }

   public void setLastOrderNumber(java.lang.String value) {
      set(START_PROPERTY_INDEX + 2 , value);
   }

   public java.math.BigDecimal getLastOrderAmount() {
      return getBigDecimal(START_PROPERTY_INDEX + 3);
   }

   public void setLastOrderAmount(java.math.BigDecimal value) {
      set(START_PROPERTY_INDEX + 3 , value);
   }


}

