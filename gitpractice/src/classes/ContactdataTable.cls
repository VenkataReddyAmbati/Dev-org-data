public class ContactdataTable {
  @AuraEnabled
   public static List<Contact> getContacts(Integer recordLimit, Integer recordOffset) {
       Integer intLimit = Integer.valueof(recordLimit);
        Integer intOffset = Integer.valueof(recordOffset);
        List<Contact> conList = new List<Contact>();
        conList = [SELECT Id, Name, Phone, Email FROM Contact LIMIT :intLimit Offset :intOffset];
        return conList;
    }
    @AuraEnabled
    public static List<Contact> getContactlist() {
      
        List<Contact> conList = new List<Contact>();
        conList = [SELECT Id, Name, Phone, Email FROM Contact];
        return conList;
    }
    //Delete Contact
    @AuraEnabled
    public static void deleteContact(Contact con){
        Delete con;
    } 
    
    @AuraEnabled
    public static void updatecontacts(List<contact> editedcontactList){
        system.debug('editedcontactList'+editedcontactList);
            update editedcontactList;
       
        
    }
     @AuraEnabled
    public static void updateAccount(List<contact> acc ){
        update acc;
    }
   
}